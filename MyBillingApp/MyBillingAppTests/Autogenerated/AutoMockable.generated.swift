// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable line_length
// swiftlint:disable variable_name

import Foundation
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif
























class FakeModelMock: FakeModel {




    //MARK: - createThis

    var createThisAsdfFdasCallsCount = 0
    var createThisAsdfFdasCalled: Bool {
        return createThisAsdfFdasCallsCount > 0
    }
    var createThisAsdfFdasReceivedArguments: (asdf: String, fdas: Int)?
    var createThisAsdfFdasReceivedInvocations: [(asdf: String, fdas: Int)] = []
    var createThisAsdfFdasReturnValue: String!
    var createThisAsdfFdasClosure: ((String, Int) -> String)?

    func createThis(asdf: String, fdas: Int) -> String {
        createThisAsdfFdasCallsCount += 1
        createThisAsdfFdasReceivedArguments = (asdf: asdf, fdas: fdas)
        createThisAsdfFdasReceivedInvocations.append((asdf: asdf, fdas: fdas))
        if let createThisAsdfFdasClosure = createThisAsdfFdasClosure {
            return createThisAsdfFdasClosure(asdf, fdas)
        } else {
            return createThisAsdfFdasReturnValue
        }
    }

    //MARK: - deleteThis

    var deleteThisAsdfFdasCallsCount = 0
    var deleteThisAsdfFdasCalled: Bool {
        return deleteThisAsdfFdasCallsCount > 0
    }
    var deleteThisAsdfFdasReceivedArguments: (asdf: String, fdas: Int)?
    var deleteThisAsdfFdasReceivedInvocations: [(asdf: String, fdas: Int)] = []
    var deleteThisAsdfFdasReturnValue: String!
    var deleteThisAsdfFdasClosure: ((String, Int) -> String)?

    func deleteThis(asdf: String, fdas: Int) -> String {
        deleteThisAsdfFdasCallsCount += 1
        deleteThisAsdfFdasReceivedArguments = (asdf: asdf, fdas: fdas)
        deleteThisAsdfFdasReceivedInvocations.append((asdf: asdf, fdas: fdas))
        if let deleteThisAsdfFdasClosure = deleteThisAsdfFdasClosure {
            return deleteThisAsdfFdasClosure(asdf, fdas)
        } else {
            return deleteThisAsdfFdasReturnValue
        }
    }

}
