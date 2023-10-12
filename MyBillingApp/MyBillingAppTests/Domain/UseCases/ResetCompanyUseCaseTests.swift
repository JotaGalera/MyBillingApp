//
//  ResetCompanyUseCaseTests.swift
//  MyBillingAppTests
//
//  Created by Javier Galera Garrido on 12/10/23.
//

import Foundation
import XCTest

@testable import MyBillingApp

class ResetCompanyUseCaseTests: XCTestCase {
    private var sut: ResetCompanyUseCase!
    private var dataManager: DataManager?
    
    override func setUp() {
        super.setUp()
        sut = ResetCompanyUseCaseImplementation(dataManager: dataManager ?? .testing)
    }
    
    override func tearDown() {
        dataManager?.resetCompany()
        dataManager = nil
        super.tearDown()
    }
    
    func testThatCompanyIsRemoved_When_ExecuteIsCalled() {
        let companyModelMock = CompanyModel(name: "nameMock", image: Data())
        dataManager?.updateAndSaveCompany(model: companyModelMock)
        
        sut.execute()
        
        XCTAssertNil(dataManager?.company)
    }
}
