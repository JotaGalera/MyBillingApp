//
//  AddCompanyUseCase.swift
//  MyBillingApp
//
//  Created by Javier Galera Garrido on 12/10/23.
//

import Foundation

protocol AddCompanyUseCase: AutoMockable {
    func execute(model: CompanyModel)
}

class AddCompanyUseCaseImplementation: AddCompanyUseCase {
    var dataManager: DataManager
    
    init(dataManager: DataManager = DataManager.shared) {
        self.dataManager = dataManager
    }
    
    func execute(model: CompanyModel) {
        dataManager.updateAndSaveCompany(model: model)
    }
}
