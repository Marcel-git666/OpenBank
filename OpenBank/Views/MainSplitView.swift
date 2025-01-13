//
//  MainSplitView.swift
//  OpenBank
//
//  Created by Marcel Mravec on 13.01.2025.
//

import SwiftUI

struct MainSplitView: View {
    @State private var visibility: NavigationSplitViewVisibility = .doubleColumn
    let viewModel: AccountListViewModel
    let transactionViewModel: TransactionViewModel

    var body: some View {
        NavigationSplitView(columnVisibility: $visibility) {
            SidebarView(viewModel: viewModel)
        } content: {
            AccountListView(viewModel: viewModel)
        } detail: {
            AccountDetailView(account: viewModel.selectedAccount, transactionViewModel: transactionViewModel)
        }
        .onChange(of: viewModel.selectedAccount) { newSelectedAccount in
            if let account = newSelectedAccount {
                Task {
                    try? await transactionViewModel.fetchAccountDetails(accountNumber: account.accountNumber)
                    print("Fetching details from onChange...")
                }
            }
        }
    }
}

#Preview {
    MainSplitView(viewModel: AccountListViewModel(), transactionViewModel: TransactionViewModel())
}
