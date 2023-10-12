// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable line_length
// swiftlint:disable variable_name

import Foundation
@testable import MyBillingApp
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif
























class AddCompanyUseCaseMock: AddCompanyUseCase {




    //MARK: - execute

    var executeModelCallsCount = 0
    var executeModelCalled: Bool {
        return executeModelCallsCount > 0
    }
    var executeModelReceivedModel: CompanyModel?
    var executeModelReceivedInvocations: [CompanyModel] = []
    var executeModelClosure: ((CompanyModel) -> Void)?

    func execute(model: CompanyModel) {
        executeModelCallsCount += 1
        executeModelReceivedModel = model
        executeModelReceivedInvocations.append(model)
        executeModelClosure?(model)
    }

}
class GetCompanyUseCaseMock: GetCompanyUseCase {




    //MARK: - execute

    var executeCallsCount = 0
    var executeCalled: Bool {
        return executeCallsCount > 0
    }
    var executeReturnValue: CompanyModel?
    var executeClosure: (() -> CompanyModel?)?

    func execute() -> CompanyModel? {
        executeCallsCount += 1
        if let executeClosure = executeClosure {
            return executeClosure()
        } else {
            return executeReturnValue
        }
    }

}
class ResetCompanyUseCaseMock: ResetCompanyUseCase {




    //MARK: - execute

    var executeCallsCount = 0
    var executeCalled: Bool {
        return executeCallsCount > 0
    }
    var executeClosure: (() -> Void)?

    func execute() {
        executeCallsCount += 1
        executeClosure?()
    }

}
