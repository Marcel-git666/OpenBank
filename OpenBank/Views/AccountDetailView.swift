//
//  AccountDetailView.swift
//  OpenBank
//
//  Created by Marcel Mravec on 13.01.2025.
//

import SwiftUI

struct AccountDetailView: View {
    let account: Account?
    var body: some View {
        if let account {
            VStack {
                Text(account.name)
                    .font(.largeTitle)
                    .padding()
                Text("Account description: \(account.description ?? "-")")
                Spacer()
            }
            .navigationTitle("Detail")
        } else {
            Text("Choose an account for details.")
                .foregroundColor(.secondary)
                .font(.headline)
        }
    }
}

#Preview {
    AccountDetailView(account: Account.sampleData)
}
