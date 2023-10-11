//
//  CompanyProfileView.swift
//  MyBillingApp
//
//  Created by Javier Galera Garrido on 3/9/23.
//

import AppKit
import CoreData
import PhotosUI
import SwiftUI

struct CompanyProfileView: View {
    @State private var companyName: String = ""
    @State private var photoCompany: PhotosPickerItem?
    @State private var companyImage: Image?
    
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
                
                PhotosPicker(constants.logoPickerButton,
                             selection: $photoCompany,
                             matching: .images)
                
                Spacer()
            }
            .onChange(of: photoCompany) { _ in
                Task {
                    if let data = try? await photoCompany?.loadTransferable(type: Data.self) {
                        if let nsImage = NSImage(data: data) {
                            companyImage = Image(nsImage: nsImage)
                            return
                        }
                    }
                }
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
