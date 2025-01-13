//
//  Account.swift
//  OpenBank
//
//  Created by Marcel Mravec on 13.01.2025.
//

import Foundation

struct AccountsResponse: Decodable {
    let accounts: [Account]
}

struct Account: Codable, Identifiable, Hashable {
    var id: String {
        return iban
    }
    let accountNumber: String
    let bankCode: String
    let transparencyFrom: String
    let transparencyTo: String
    let publicationTo: String
    let actualizationDate: String
    let balance: Double
    let currency: String?
    let name: String
    let iban: String
    
    static var sampleData  = Account(accountNumber: "00000-0123456789", bankCode: "0800", transparencyFrom: "", transparencyTo: "", publicationTo: "", actualizationDate: "", balance: 2_000_000.99, currency: "CZK", name: "Ceska narodni banka", iban: "CZ 0800 0000 0012 3456 7890")
}
