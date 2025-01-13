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
                        .foregroundColor(.blue) // Zvýraznění názvu účtu
                        .padding()
                    Spacer()
                    Text("\(account?.balance ?? selectedAccountDetails.balance, specifier: "%.2f") \(account?.currency ?? "CZK")")
                        .font(.largeTitle)
                        .foregroundColor(.green) // Zvýraznění zůstatku
                        .padding()
                }
                Text("Account description: \(selectedAccountDetails.description ?? "-")")
                    .foregroundColor(.secondary) // Sekundární barva pro popis účtu
                    .padding(.horizontal)
                Divider()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        if let error = transactionViewModel.error {
                            Text("Error: \(error)")
                                .foregroundColor(.red) // Červená pro chybu
                                .padding()
                        } else if transactionViewModel.transactions.isEmpty {
                            Text("No transacions to show.")
                                .foregroundColor(.secondary) // Šedá pro prázdný stav
                                .padding()
                        } else {
                            ForEach(transactionViewModel.transactions) { transaction in
                                TransactionRow(transaction: transaction)
                                    .background(
                                        transaction.type == "Credit"
                                            ? Color.green.opacity(0.1) // Světle zelená pro příjmy
                                            : Color.red.opacity(0.1)   // Světle červená pro výdaje
                                    )
                                    .cornerRadius(8)
                            }
                        }
                    }
                    .padding()
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
            .onAppear {
                Task {
                    try? await transactionViewModel.fetchAccountDetails(accountNumber: selectedAccountDetails.accountNumber)
                    print("Fetching details from onAppear...")
                }
            }
            .background(Color(UIColor.systemGroupedBackground)) // Jemné pozadí pro celý detail
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
