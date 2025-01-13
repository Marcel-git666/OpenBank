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
                    Text("\(account?.balance ?? selectedAccountDetails.balance, specifier: "%.2f") \(account?.currency ?? "CZK")")
                        .font(.largeTitle)
                        .padding()
                }
                Text("Account description: \(selectedAccountDetails.description ?? "-")")
                Divider()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        if let error = transactionViewModel.error {
                            Text("Chyba: \(error)")
                                .foregroundColor(.red)
                                .padding()
                        } else if transactionViewModel.transactions.isEmpty {
                            Text("Žádné transakce k zobrazení.")
                                .foregroundColor(.secondary)
                                .padding()
                        } else {
                            ForEach(transactionViewModel.transactions) { transaction in
                                TransactionRow(transaction: transaction)
                            }
                        }
                    }
                }
            }
            .task {
                do {
                    try await transactionViewModel.fetchTransactions(for: account?.accountNumber ?? "")
                } catch {
                    print("Error: \(error.localizedDescription)")
                }
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
