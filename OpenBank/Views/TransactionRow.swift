//
//  TransactionRow.swift
//  OpenBank
//
//  Created by Marcel Mravec on 13.01.2025.
//

import SwiftUI

struct TransactionRow: View {
    let transaction: Transaction

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(transaction.typeDescription)
                .font(.headline)

            HStack {
                Text("Částka: \(transaction.amount.value, specifier: "%.2f") \(transaction.amount.currency)")
                Spacer()
                Text("Datum: \(transaction.processingDate)")
            }
            .font(.subheadline)
            .foregroundColor(.secondary)
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(8)
    }
}

#Preview {
    TransactionRow(transaction: Transaction.sampleData[0])
}
