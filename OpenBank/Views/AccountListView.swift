//
//  AccountListView.swift
//  OpenBank
//
//  Created by Marcel Mravec on 13.01.2025.
//

import SwiftUI

struct AccountListView: View {
    let accounts: [Account] // Později propojené s VM

    var body: some View {
        NavigationView {
            ZStack {
                Color.green
                    .opacity(0.3)
                    .edgesIgnoringSafeArea(.all)
                List(accounts) { account in
                    VStack(alignment: .leading) {
                        Text(account.name).bold()
                        Text(account.balance.formatted(.currency(code: account.currency ?? "CZK")))
                    }
                    .listRowBackground(Color.yellow.opacity(0.4))
                }
                .scrollContentBackground(.hidden)
            }
            .navigationTitle("Accounts")
        }
    }
}

#Preview {
    AccountListView(accounts: [Account.sampleData])
}

