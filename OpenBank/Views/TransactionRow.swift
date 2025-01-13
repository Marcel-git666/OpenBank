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
                .foregroundColor(.primary) // Hlavní barva pro název transakce

            HStack {
                Text("Ammount: \(transaction.amount.value, specifier: "%.2f") \(transaction.amount.currency)")
                    .foregroundColor(transaction.amount.value > 0 ? .green : .red) // Zelená pro příjem, červená pro výdaj
                Spacer()
                Text("Date: \(transaction.processingDate)")
            }
            .font(.subheadline)
            .foregroundColor(.secondary) // Sekundární barva pro detailní informace
        }
        .padding()
        .background(Color(UIColor.secondarySystemBackground)) // Světle šedé pozadí
        .cornerRadius(8)
    }
}

#Preview {
    TransactionRow(transaction: Transaction.sampleData[0])
}

