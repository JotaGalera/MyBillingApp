//
//  DataManagerTests.swift
//  MyBillingAppTests
//
//  Created by Javier Galera Garrido on 12/10/23.
//

import Foundation
import XCTest

@testable import MyBillingApp

class DataManagerTests: XCTestCase {
    private var sut: DataManager!
    
    override func setUp() {
        super.setUp()
        sut = DataManager.testing
        sut.resetCompany()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testThatCompanyDataIsCreated_When_UpdateAndSaveCompanyIsCalled_And_ThereIsNotDataPreviously() {
        let companyModelMock = CompanyModel(name: "nameMock", image: Data())
        
        sut.updateAndSaveCompany(model: companyModelMock)
        
        XCTAssertEqual(companyModelMock.name, sut.company?.name)
        XCTAssertEqual(companyModelMock.image, sut.company?.image)
    }
    
    func testThatCompanyDataIsUpdated_When_UpdateAndSaveCompanyIsCalled_And_ThereIsDataPreviously() {
        let oldCompanyModelMock = CompanyModel(name: "nameMock", image: Data())
        sut.updateAndSaveCompany(model: oldCompanyModelMock)
        let newCompanyModelMock = CompanyModel(name: "newNameMock", image: Data())
        
        sut.updateAndSaveCompany(model: newCompanyModelMock)
        
        XCTAssertEqual(newCompanyModelMock.name, sut.company?.name)
        XCTAssertEqual(newCompanyModelMock.image, sut.company?.image)
    }
    
    func testThatCompanyDataIsRemoved_When_ResetCompanyIsCalled() {
        let oldCompanyModelMock = CompanyModel(name: "nameMock", image: Data())
        sut.updateAndSaveCompany(model: oldCompanyModelMock)
        
        sut.resetCompany()
        
        XCTAssertNil(sut.company)
    }
}
