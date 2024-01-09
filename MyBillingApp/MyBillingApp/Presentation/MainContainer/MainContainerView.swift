//
//  MainContainerView.swift
//  MyBillingApp
//
//  Created by Javier Galera Garrido on 19/12/23.
//

import SwiftUI

struct MainContainerView: View {
    @State private var selection = 0
    
    struct Constants {
        
    }
    
    var body: some View {
        TabView(selection: $selection) {
            Text(MainContainerConstants.fistTabDescription).tabItem { Text(MainContainerConstants.fistTabTitle) }.tag(1)
            Text(MainContainerConstants.secondTabDescription).tabItem { Text(MainContainerConstants.secondTabTitle) }.tag(2)
            Text(MainContainerConstants.thirdTabDescription).tabItem { Text(MainContainerConstants.thirdTabTitle) }.tag(2)
        }
    }
}

extension MainContainerView {
    enum MainContainerConstants {
        static let fistTabTitle = "Clientes"
        static let fistTabDescription = "Usa esta sección para añadir/eliminar clientes a la Base de datos"
        static let secondTabTitle = "Tarifas"
        static let secondTabDescription = "Usa esta sección para añadir/eliminar tarifas a la Base de datos"
        static let thirdTabTitle = "Facturas"
        static let thirdTabDescription = "En desarrollo..."
    }
}

#Preview {
    MainContainerView()
}
