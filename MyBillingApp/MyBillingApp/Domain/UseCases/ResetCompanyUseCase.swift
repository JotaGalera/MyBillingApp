//
//  resetCompanyUseCase.swift
//  MyBillingApp
//
//  Created by Javier Galera Garrido on 12/10/23.
//

import Foundation

protocol ResetCompanyUseCase {
    func execute()
}

class ResetCompanyUseCaseImplementation: ResetCompanyUseCase {
    var dataManager: DataManager
    
    init(dataManager: DataManager = DataManager.shared) {
        self.dataManager = dataManager
    }
    
    func execute() {
        dataManager.resetCompany()
    }
}
