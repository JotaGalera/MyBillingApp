//
//  CompanyProfileViewModelTests.swift
//  MyBillingAppTests
//
//  Created by Javier Galera Garrido on 12/10/23.
//

import Foundation
import XCTest

@testable import MyBillingApp

class CompanyProfileViewModelTests: XCTestCase {
    private var sut: CompanyProfileViewModel!
    private var getCompanyUseCaseMock: GetCompanyUseCaseMock!
    private var addCompanyUseCaseMock: AddCompanyUseCaseMock!
    private var resetCompanyUseCaseMock: ResetCompanyUseCaseMock!
    
    @MainActor
    override func setUp() {
        super.setUp()
        getCompanyUseCaseMock = GetCompanyUseCaseMock()
        addCompanyUseCaseMock = AddCompanyUseCaseMock()
        resetCompanyUseCaseMock = ResetCompanyUseCaseMock()
        sut = CompanyProfileViewModel(getCompanyUseCase: getCompanyUseCaseMock,
                                      addCompanyUseCase: addCompanyUseCaseMock,
                                      resetCompanyUseCase: resetCompanyUseCaseMock)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    @MainActor
    func testThatGetCompanyUseCaseIsCalled_When_GetCompanyIsCalled() {
        getCompanyUseCaseMock.executeCallsCount = 0
        
        sut.getCompanyData()
        
        XCTAssertEqual(1, getCompanyUseCaseMock.executeCallsCount)
    }
    
    @MainActor
    func testThatAddCompanyUseCaseIsCalled_When_CreateCompanyDataIsCalled() {
        sut.createCompanyData(name: "nameMock", image: Data())
        
        XCTAssertEqual(1, addCompanyUseCaseMock.executeModelCallsCount)
    }
    
    @MainActor
    func testThatResetCompanyUseCaseMock_When_ResetCompanyDataIsCalled() {
        sut.resetCompanyData()
        
        XCTAssertEqual(1, resetCompanyUseCaseMock.executeCallsCount)
    }
}
