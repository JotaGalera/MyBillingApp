//
//  GetCompanyUseCase.swift
//  MyBillingApp
//
//  Created by Javier Galera Garrido on 12/10/23.
//

import Foundation

protocol GetCompanyUseCase: AutoMockable {
    func execute() -> CompanyModel?
}

class GetCompanyUseCaseImplementation: GetCompanyUseCase {
    var dataManager: DataManager
    
    init(dataManager: DataManager = DataManager.shared) {
        self.dataManager = dataManager
    }
    
    func execute() -> CompanyModel? {
        if let result = dataManager.company {
            return result
        } else {
            return nil
        }
    }
}
