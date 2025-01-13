//
//  AccountTransactionsEndpoint.swift
//  OpenBank
//
//  Created by Marcel Mravec on 13.01.2025.
//

import Foundation

struct AccountTransactionsEndpoint: Endpoint {
    let accountNumber: String
    
    var baseURL: URL {
        guard let url = URL(string: Environment.baseURL) else {
            fatalError("Invalid base URL in Environment")
        }
        return url
    }
    
    var path: String {
        "/transparentAccounts/\(accountNumber)/transactions"
    }
    
    var method: HTTPMethod {
        .get
    }
    
    var headers: [String: String]? {
        [
            "Content-Type": "application/json",
            "WEB-API-key": Environment.apiKey
        ]
    }
    
    var parameters: [String: Any]? {
        nil
    }
}
