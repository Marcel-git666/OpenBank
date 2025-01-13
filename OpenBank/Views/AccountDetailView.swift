//
//  AccountDetailView.swift
//  OpenBank
//
//  Created by Marcel Mravec on 13.01.2025.
//

import SwiftUI

struct AccountDetailView: View {
    let account: Account?
    @Bindable var transactionViewModel: TransactionViewModel
    
    var body: some View {
        if let selectedAccountDetails = transactionViewModel.selectedAccountDetails {
            VStack {
                HStack {
                    Text(account?.name ?? selectedAccountDetails.name)
                        .font(.largeTitle)
                        .padding()
                    Spacer()
                    Text("\(account?.balance ?? selectedAccountDetails.balance) \(account?.currency ?? "CZK")")
                        .font(.largeTitle)
                        .padding()
                }
                Text("Account description: \(selectedAccountDetails.description ?? "-")")
                Spacer()
            }
            .navigationTitle("Detail")
            .onAppear() {
                Task {
                    try? await transactionViewModel.fetchAccountDetails(accountNumber: selectedAccountDetails.accountNumber)
                    print("Fetching details from onAppear...")
                }
            }
        } else {
            Text("Choose an account for details.")
                .foregroundColor(.secondary)
                .font(.headline)
        }
    }
}

#Preview {
    AccountDetailView(account: Account.sampleData, transactionViewModel: TransactionViewModel())
}
