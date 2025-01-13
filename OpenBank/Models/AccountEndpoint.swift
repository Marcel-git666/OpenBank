//
//  AccountEndpoint.swift
//  OpenBank
//
//  Created by Marcel Mravec on 13.01.2025.
//

import Foundation

struct AccountEndpoint: Endpoint {
    
    var baseURL: URL {
        guard let url = URL(string: Environment.baseURL) else {
            fatalError("Invalid base URL in Environment")
        }
        return url
    }
    
    var path: String {
        "/transparentAccounts"
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
