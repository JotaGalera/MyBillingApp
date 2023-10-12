//
//  DataManager.swift
//  MyBillingApp
//
//  Created by Javier Galera Garrido on 12/10/23.
//

import Foundation
import CoreData

enum DataManagerType {
    case normal, preview, testing
}

class DataManager: NSObject, ObservableObject {
    static let shared = DataManager(type: .normal)
    static let testing = DataManager(type: .testing)
    
    @Published var company: CompanyModel?
    
    fileprivate var managedObjectContext: NSManagedObjectContext
    private let companyResultController: NSFetchedResultsController<Company>
    
    private init(type: DataManagerType) {
        switch type {
        case .normal:
            let persistentController = PersistenceController()
            managedObjectContext = persistentController.context
        case .preview:
            let persistentController = PersistenceController(inMemory: true)
            managedObjectContext = persistentController.context
        case .testing:
            let persistentController = PersistenceController(inMemory: true)
            managedObjectContext = persistentController.context
        }
        
        let companyFetchRequest: NSFetchRequest<Company> = Company.fetchRequest()
        companyFetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: false)]
        companyResultController = NSFetchedResultsController(fetchRequest: companyFetchRequest,
                                                             managedObjectContext: managedObjectContext,
                                                             sectionNameKeyPath: nil,
                                                             cacheName: nil)
        super.init()
        
        getInitialValues()
    }
    
    private func getInitialValues() {
        companyResultController.delegate = self
        try? companyResultController.performFetch()
        if let newCompaniesResult = companyResultController.fetchedObjects,
           let companySaved = newCompaniesResult.first,
           let name = companySaved.name,
           let logo = companySaved.logo {
            company = CompanyModel(name: name, image: logo)
        }
    }
    
    func saveData() {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch let error {
                NSLog("Unresolved error saving context: \(error)")
            }
        }
    }
    
    private func fetchFirst<T: NSManagedObject>(_ objectType: T.Type, predicate: NSPredicate?) -> Result<T?, Error> {
        let request = objectType.fetchRequest()
        request.predicate = predicate
        request.fetchLimit = 1
        do {
            let result = try managedObjectContext.fetch(request) as? [T]
            return .success(result?.first)
        } catch {
            return .failure(error)
        }
    }
}

extension DataManager: NSFetchedResultsControllerDelegate {
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        if let newCompanies = controller.fetchedObjects as? [Company],
           let companySaved = newCompanies.first,
           let name = companySaved.name ,
           let logo = companySaved.logo {
            company = CompanyModel(name: name, image: logo)
        }
    }
}

//MARK: - CRUD operations
extension DataManager {
    func updateAndSaveCompany(model: CompanyModel) {
        let predicate = NSPredicate(format: "name = %@", model.name)
        let result = fetchFirst(Company.self, predicate: predicate)
        switch result {
        case .success(let companySaved):
            if let companySaved {
                updateCompany(modelBD: companySaved, from: model)
            } else {
                createCompany(from: model)
            }
        case .failure(let error):
            print("Couldn't fetch TodoMO to save. \(error)")
        }
        
        saveData()
    }
                  
    func resetCompany() {
        do {
            guard let existingCompany = try fetchFirst(Company.self, predicate: nil).get() else { return }
            managedObjectContext.delete(existingCompany)
            saveData()
            company = nil
        } catch {
            print("There is no company saved previously.")
        }
    }
    
    private func updateCompany(modelBD: Company, from model: CompanyModel) {
        modelBD.name = model.name
        modelBD.logo = model.image
    }
        
    private func createCompany(from model: CompanyModel) {
        let company = MyBillingApp.Company(context: managedObjectContext)
        updateCompany(modelBD: company, from: model)
    }
}
