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

    var body: some View {
        NavigationSplitView(columnVisibility: $visibility) {
            SidebarView(viewModel: viewModel)
        } content: {
            AccountListView(viewModel: viewModel)
        } detail: {
            AccountDetailView(account: viewModel.selectedAccount)
        }
    }
}

#Preview {
    MainSplitView(viewModel: AccountListViewModel())
}
