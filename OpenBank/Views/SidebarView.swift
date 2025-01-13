//
//  SidebarView.swift
//  OpenBank
//
//  Created by Marcel Mravec on 13.01.2025.
//

import SwiftUI

struct SidebarView: View {
    @Bindable var viewModel: AccountListViewModel

    var body: some View {
        List {
            Section(header: Text("Filters")) {
                Button("All Accounts") {
                    // Logika pro zobrazení všech účtů
                }
                Button("Positive Balances") {
                    // Logika pro filtrování účtů s kladným zůstatkem
                }
                Button("Negative Balances") {
                    // Logika pro filtrování účtů se záporným zůstatkem
                }
            }
        }
        .navigationTitle("Menu")
    }
}

#Preview {
    SidebarView(viewModel: AccountListViewModel())
}
