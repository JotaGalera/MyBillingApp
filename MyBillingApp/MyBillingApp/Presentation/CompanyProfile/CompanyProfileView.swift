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
    @StateObject var viewModel: CompanyProfileViewModel
    @State private var photoCompany: PhotosPickerItem? = nil
    @State var companyName: String = ""
    @State var companyImage: Data? = nil
    
    private let constants = CompanyProfileViewConstants()
    
    init() {
        _viewModel = StateObject(wrappedValue: CompanyProfileViewModel())
    }

    var body: some View {
        if viewModel.isCompanyConfigured {
            VStack {
                HStack {
                    Spacer()
                    Text(companyName)
                    
                    Spacer()
                    if let data = companyImage {
                        Image(nsImage: NSImage(data: data)!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 500, height: 500)
                    }
                }
                
                Button {
                    viewModel.resetCompanyData()
                    refreshCompanyData()
                } label: {
                    Text("Reset Company Data")
                }

            }
            .onAppear {
                refreshCompanyData()
            }
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
                
                if showSaveButton() {
                    HStack {
                        Spacer()
                        Text(companyName)
                        
                        Spacer()
                        if let data = companyImage {
                            Image(nsImage: NSImage(data: data)!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 500, height: 500)
                        }
                    }
                        
                    Button {
                        viewModel.createCompanyData(name: companyName, image: companyImage)
                        refreshCompanyData()
                    } label: {
                        Text("Save Information")
                    }
                }
                
            }
            .onAppear {
                refreshCompanyData()
            }
            .onChange(of: photoCompany) { _ in
                Task {
                    if let data = try? await photoCompany?.loadTransferable(type: Data.self) {
                        companyImage = data
                    }
                }
            }
        }
    }
    
    private func refreshCompanyData() {
        companyName = viewModel.companyModel?.name ?? ""
        companyImage = viewModel.companyModel?.image
    }
        
    private func showSaveButton() -> Bool {
        return !companyName.isEmpty && companyImage != nil
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
