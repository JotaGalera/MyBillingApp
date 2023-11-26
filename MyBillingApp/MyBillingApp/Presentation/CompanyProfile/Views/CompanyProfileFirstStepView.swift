//
//  CompanyProfileFirstStepView.swift
//  MyBillingApp
//
//  Created by Javier Galera Garrido on 26/11/23.
//

import AppKit
import CoreData
import PhotosUI
import SwiftUI

struct CompanyProfileFirstStepView: View {
    @State private var photoCompany: PhotosPickerItem? = nil
    @EnvironmentObject var viewModel: CompanyProfileViewModel
    @Binding var companyName: String
    @Binding var companyImage: Data?
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(CompanyProfileViewConstants.titleView)
            Text(CompanyProfileViewConstants.descriptionView)
            
            TextField(CompanyProfileViewConstants.nameTextField,
                      text: $companyName)
            .padding(EdgeInsets(top: 0,
                                leading: 20,
                                bottom: 0,
                                trailing: 20))
            
            PhotosPicker(CompanyProfileViewConstants.logoPickerButton,
                         selection: $photoCompany,
                         matching: .images)
            
            Spacer()
            
            if showSaveButton() {
                HStack {
                    Spacer()
                    
                    Text(companyName)
                    
                    Spacer()
                    if let companyImage {
                        Image(nsImage: NSImage(data: companyImage)!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 500, height: 500)
                    }
                }
                    
                Button {
                    viewModel.createCompanyData(name: companyName,
                                                image: companyImage)
                } label: {
                    Text("Save Information")
                }
            }
            
        }
        .onAppear {
            companyName = viewModel.companyModel?.name ?? ""
            companyImage = viewModel.companyModel?.image
        }
        .onChange(of: photoCompany) { _ in
            Task {
                if let data = try? await photoCompany?.loadTransferable(type: Data.self) {
                    companyImage = data
                }
            }
        }
    }
    
    private func showSaveButton() -> Bool {
        return !companyName.isEmpty && companyImage != nil
    }
}

extension CompanyProfileFirstStepView {
    enum CompanyProfileViewConstants {
        static let titleView = "Bienvenido a My Billing App."
        static let descriptionView = "Comienza introduciendo tu nombre o el de tu empresa."
        static let nameTextField = "Introduce el nombre de la empresa:"
        static let logoPickerButton = "¿Tienes logo? Subelo aquí."
    }
}

struct CompanyProfileFirstStepView_Preview: PreviewProvider {
    static var previews: some View {
        CompanyProfileFirstStepView(companyName: .constant("CompanyNameMock"),
                                    companyImage: .constant(nil))
        .environmentObject(CompanyProfileViewModel())
    }
}
