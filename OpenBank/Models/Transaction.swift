//
//  Transaction.swift
//  OpenBank
//
//  Created by Marcel Mravec on 13.01.2025.
//

import Foundation

struct TransactionResponse: Decodable {
    let pageNumber: Int
    let pageSize: Int
    let pageCount: Int
    let nextPage: Int?
    let recordCount: Int
    let transactions: [Transaction]
}

struct TransactionAmount: Codable, Hashable {
    let value: Double
    let precision: Int
    let currency: String
}

struct TransactionParty: Codable, Hashable {
    let accountNumber: String
    let bankCode: String
    let iban: String
    let specificSymbol: String?
    let specificSymbolParty: String?
    let constantSymbol: String?
    let variableSymbol: String?
    let description: String?
    
    init(
        accountNumber: String,
        bankCode: String,
        iban: String,
        specificSymbol: String? = nil,
        specificSymbolParty: String? = nil,
        constantSymbol: String? = nil,
        variableSymbol: String? = nil,
        description: String? = nil
    ) {
        self.accountNumber = accountNumber
        self.bankCode = bankCode
        self.iban = iban
        self.specificSymbol = specificSymbol
        self.specificSymbolParty = specificSymbolParty
        self.constantSymbol = constantSymbol
        self.variableSymbol = variableSymbol
        self.description = description
    }
}

struct Transaction: Codable, Hashable, Identifiable {
    var id: UUID = UUID()
    let amount: TransactionAmount
    let type: String
    let dueDate: String
    let processingDate: String
    let sender: TransactionParty
    let receiver: TransactionParty
    let typeDescription: String
    
    private enum CodingKeys: String, CodingKey {
        case amount, type, dueDate, processingDate, sender, receiver, typeDescription
    }
}

extension Transaction {
    static let sampleData: [Transaction] = [
        Transaction(
            amount: TransactionAmount(value: 1.92, precision: 0, currency: "CZK"),
            type: "30500",
            dueDate: "2017-04-30T00:00:00",
            processingDate: "2017-05-01T00:00:00",
            sender: TransactionParty(
                accountNumber: "000000-0000000000",
                bankCode: "0800",
                iban: "CZ13 0800 0000 0029 0647 8309",
                specificSymbol: "0000000000",
                specificSymbolParty: "0000000000",
                constantSymbol: "0598",
                variableSymbol: nil,
                description: nil
            ),
            receiver: TransactionParty(
                accountNumber: "000000-2906478309",
                bankCode: "0800",
                iban: "CZ13 0800 0000 0029 0647 8309"
            ),
            typeDescription: "Úrok kredit"
        ),
    ]
}
