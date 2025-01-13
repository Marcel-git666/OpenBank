//
//  AccountListView.swift
//  OpenBank
//
//  Created by Marcel Mravec on 13.01.2025.
//

import SwiftUI

struct AccountListView: View {
    @Bindable var viewModel: AccountListViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.green
                    .opacity(0.3)
                    .edgesIgnoringSafeArea(.all)
                if viewModel.accounts.isEmpty {
                    VStack(spacing: 16) {
                        Text(viewModel.error ?? "No accounts available.")
                            .foregroundColor(.red)
                            .multilineTextAlignment(.center)
                            .padding()
                        Button(action: {
                            Task {
                                await refreshAccounts()
                            }
                        }) {
                            Text("Retry")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }
                    .padding()
                } else {
                    List(viewModel.accounts) { account in
                        VStack(alignment: .leading) {
                            Text(account.name).bold()
                            Text(account.balance.formatted(.currency(code: account.currency ?? "CZK")))
                        }
                        .listRowBackground(Color.yellow.opacity(0.4))
                    }
                    .scrollContentBackground(.hidden)
                }
            }
            .navigationTitle("Accounts")
            .refreshable {
                await refreshAccounts()
            }
        }
        .task {
            await refreshAccounts()
        }
    }
    
    private func refreshAccounts() async {
        do {
            try await viewModel.fetchAccounts()
        } catch {
            print("Failed to refresh accounts: \(error.localizedDescription)")
        }
    }
}

#Preview {
    AccountListView(viewModel: AccountListViewModel())
}

