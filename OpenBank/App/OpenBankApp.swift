//
//  OpenBankApp.swift
//  OpenBank
//
//  Created by Marcel Mravec on 13.01.2025.
//

import SwiftUI

@main
struct OpenBankApp: App {
    let viewModel = AccountListViewModel()
    let transactionViewModel = TransactionViewModel()
    var body: some Scene {
        WindowGroup {
            MainSplitView(viewModel: viewModel, transactionViewModel: transactionViewModel)
        }
    }
}
