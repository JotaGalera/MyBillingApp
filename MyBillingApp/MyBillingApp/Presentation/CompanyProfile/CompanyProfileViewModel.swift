//
//  CompanyProfileViewModel.swift
//  MyBillingApp
//
//  Created by Javier Galera Garrido on 11/10/23.
//

import CoreData
import SwiftUI

@MainActor
class CompanyProfileViewModel: ObservableObject {
    private var getCompanyUseCase: GetCompanyUseCase
    private var addCompanyUseCase: AddCompanyUseCase
    private var resetCompanyUseCase: ResetCompanyUseCase
    var companyModel: CompanyModel? {
        didSet {
            isCompanyConfigured = companyModel != nil
        }
    }
    @Published var isCompanyConfigured: Bool = false
    
    init() {
        getCompanyUseCase = GetCompanyUseCaseImplementation()
        addCompanyUseCase = AddCompanyUseCaseImplementation()
        resetCompanyUseCase = ResetCompanyUseCaseImplementation()
        
        getCompanyData()
    }
    
    func getCompanyData() {
        companyModel = getCompanyUseCase.execute()
    }
    
    func createCompanyData(name: String?, image: Data?) {
        guard let name, let image else { return }
        
        let companyModel = CompanyModel(name: name, image: image)
        addCompanyUseCase.execute(model: companyModel)
        getCompanyData()
    }
    
    func resetCompanyData() {
        resetCompanyUseCase.execute()
        getCompanyData()
    }
}
