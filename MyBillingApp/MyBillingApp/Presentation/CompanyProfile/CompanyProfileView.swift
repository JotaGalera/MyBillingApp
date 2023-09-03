//
//  CompanyProfileView.swift
//  MyBillingApp
//
//  Created by Javier Galera Garrido on 3/9/23.
//

import SwiftUI
import PhotosUI
import CoreData

struct CompanyProfileView: View {
    @State var companyName: String = ""
    @State var companyPhoto: [PhotosPickerItem] = []
    
    @Environment(\.managedObjectContext) private var viewContext
    private let constants = CompanyProfileViewConstants()
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Company.name, ascending: true)],
        animation: .default)
    private var companies: FetchedResults<Company>
    
    var body: some View {
        if wasCompanyConfigured() {
            // TODO: Show company Info
        } else {
            VStack {
                
                Spacer()
                
                Text(constants.titleView)
                Text(constants.descriptionView)
                
                TextField(constants.nameTextField,
                          text: $companyName)
                .padding(EdgeInsets(top: 0,
                                    leading: 20,
                                    bottom: 0,
                                    trailing: 20))
                
                PhotosPicker(selection: $companyPhoto,
                             maxSelectionCount: 1,
                             selectionBehavior: .default,
                             matching: .images,
                             preferredItemEncoding: .automatic) {
                    Text(constants.logoPickerButton)
                }
                
                Spacer()
            }
        }
    }
    
    private func wasCompanyConfigured() -> Bool {
        return companies.first != nil
    }
}

struct CompanyProfileViewConstants {
    let titleView = "Bienvenido a My Billing App."
    let descriptionView = "Comienza introduciendo tu nombre o el de tu empresa."
    let nameTextField = "Introduce el nombre de la empresa:"
    let logoPickerButton = "¿Tienes logo? Subelo aquí."
}

struct CompanyProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CompanyProfileView()
    }
}
