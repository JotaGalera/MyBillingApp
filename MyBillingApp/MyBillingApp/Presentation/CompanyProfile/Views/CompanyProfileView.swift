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
    @State var companyName: String = ""
    @State var companyImage: Data? = nil
    
    init(viewModel: CompanyProfileViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        if viewModel.isCompanyConfigured {
            CompanyProfileSecondStepView(companyName: $companyName,
                                         companyImage: $companyImage)
            .environmentObject(viewModel)
        } else {
            CompanyProfileFirstStepView(companyName: $companyName,
                                        companyImage: $companyImage)
            .environmentObject(viewModel)
        }
    }
}

struct CompanyProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CompanyProfileView(viewModel: CompanyProfileViewModel())
    }
}

