//
//  FakeModel.swift
//  MyBillingApp
//
//  Created by Javier Galera Garrido on 3/9/23.
//

import Foundation

protocol FakeModel: AutoMockable {
    func createThis(asdf: String, fdas: Int) -> String
    func deleteThis(asdf: String, fdas: Int) -> String
}
