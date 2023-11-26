//
//  CompanyProfileSecondStepView.swift
//  MyBillingApp
//
//  Created by Javier Galera Garrido on 26/11/23.
//

import SwiftUI

struct CompanyProfileSecondStepView: View {
    @EnvironmentObject var viewModel: CompanyProfileViewModel
    @Binding var companyName: String
    @Binding var companyImage: Data?
    
    var body: some View {
        VStack {
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
                viewModel.resetCompanyData()
            } label: {
                Text("Reset Company Data")
            }

        }
        .onAppear {
            companyName = viewModel.companyModel?.name ?? ""
            companyImage = viewModel.companyModel?.image
        }
    }
}

struct CompanyProfileSecondStepView_Previews: PreviewProvider {
    static var previews: some View {
        CompanyProfileSecondStepView(companyName: .constant("NameMock"),
                                     companyImage: .constant(nil))
        .environmentObject(CompanyProfileViewModel())
    }
}
