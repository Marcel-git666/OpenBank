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
            Section(header: Text("Filters").font(.headline)) {
                Button(action: {
                    viewModel.setFilter(.all)
                }) {
                    Text("All Accounts")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue.opacity(0.2))
                        .cornerRadius(8)
                        .foregroundColor(.blue)
                }
                Button(action: {
                    viewModel.setFilter(.positive)
                }) {
                    Text("Positive Balances")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green.opacity(0.2))
                        .cornerRadius(8)
                        .foregroundColor(.green)
                }
                Button(action: {
                    viewModel.setFilter(.negative)
                }) {
                    Text("Negative or Zero Balances")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red.opacity(0.2))
                        .cornerRadius(8)
                        .foregroundColor(.red)
                }
            }
            
            Section(header: Text("Search").font(.headline)) {
                HStack {
                    TextField("Search accounts...", text: $searchInput, onCommit: {
                        viewModel.setSearchText(searchInput)
                    })
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.vertical, 4)
                    
                    Button(action: {
                        viewModel.setSearchText(searchInput)
                    }) {
                        Text("Search")
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(Color.blue.opacity(0.2))
                            .cornerRadius(8)
                            .foregroundColor(.blue)
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
