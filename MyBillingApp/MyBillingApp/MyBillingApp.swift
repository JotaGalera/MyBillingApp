//
//  MyBillingApp.swift
//  MyBillingApp
//
//  Created by Javier Galera Garrido on 3/9/23.
//

import SwiftUI

@main
struct MyBillingAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
