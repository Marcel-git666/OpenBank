//
//  SidebarView.swift
//  OpenBank
//
//  Created by Marcel Mravec on 13.01.2025.
//

import SwiftUI

struct SidebarView: View {
    @Bindable var viewModel: AccountListViewModel
    @State private var searchInput: String = ""
    
    var body: some View {
        List {
            Section(header: Text("Filters")) {
                Button("All Accounts") {
                    viewModel.setFilter(.all)
                }
                Button("Positive Balances") {
                    viewModel.setFilter(.positive)
                }
                Button("Negative Balances") {
                    viewModel.setFilter(.negative)
                }
            }
            Section(header: Text("Search")) {
                HStack {
                    TextField("Search accounts...", text: $searchInput, onCommit: {
                        viewModel.setSearchText(searchInput)
                    })
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: {
                        viewModel.setSearchText(searchInput)
                    }) {
                        Text("Search")
                    }
                }
            }
        }
        .navigationTitle("Menu")
    }
}

#Preview {
    SidebarView(viewModel: AccountListViewModel())
}
