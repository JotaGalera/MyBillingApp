//
//  GetCompanyUseCaseTests.swift
//  MyBillingAppTests
//
//  Created by Javier Galera Garrido on 12/10/23.
//

import Foundation
import XCTest

@testable import MyBillingApp

class GetCompanyUseCaseTests: XCTestCase {
    private var sut: GetCompanyUseCase!
    private var dataManager: DataManager?
    
    override func setUp() {
        super.setUp()
        dataManager = DataManager.testing
        dataManager?.resetCompany()
        sut = GetCompanyUseCaseImplementation(dataManager: dataManager ?? .testing)
    }
    
    override func tearDown() {
        dataManager = nil
        super.tearDown()
    }
    
    func testThatCompanyIsReturned_When_ExecuteIsCalled() {
        dataManager?.resetCompany()
        let companyModelMock = CompanyModel(name: "nameMock", image: Data())
        dataManager?.updateAndSaveCompany(model: companyModelMock)
        
        let result = sut.execute()
        
        XCTAssertEqual(companyModelMock, result)
    }
}
