//
//  AddCompanyUseCaseTests.swift
//  MyBillingAppTests
//
//  Created by Javier Galera Garrido on 12/10/23.
//

import Foundation
import XCTest

@testable import MyBillingApp

class AddCompanyUseCaseTests: XCTestCase {
    private var sut: AddCompanyUseCase!
    private var dataManager: DataManager?
    
    override func setUp() {
        super.setUp()
        dataManager = DataManager.testing
        dataManager?.resetCompany()
        sut = AddCompanyUseCaseImplementation(dataManager: dataManager ?? .testing)
    }
    
    override func tearDown() {
        dataManager = nil
        super.tearDown()
    }
    
    func testThatCompanyIsAdded_When_ExecuteIsCalled() {
        let companyModelMock = CompanyModel(name: "nameMock", image: Data())
        
        sut.execute(model: companyModelMock)
        
        XCTAssertEqual(companyModelMock, dataManager?.company)
    }
}
