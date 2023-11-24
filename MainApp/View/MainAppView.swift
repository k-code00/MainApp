//
//  MainAppView.swift
//  MainApp
//
//  Created by Kojo on 22/11/2023.
//

import SwiftUI
import FindMyIPLib

struct MainAppView: View {
    @StateObject private var viewModel = MainAppViewModel()

    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
            } else {
                Text(viewModel.ipInformation)
                if let errorMessage = viewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                }
            }
            Button("Find My IP") {
                viewModel.fetchIPInformation()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .padding()
    }
}
