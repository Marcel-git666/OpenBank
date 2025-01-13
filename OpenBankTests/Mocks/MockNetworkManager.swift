//
//  MockNetworkManager.swift
//  OpenBankTests
//
//  Created by Marcel Mravec on 13.01.2025.
//

import Foundation
@testable import OpenBank

final class MockNetworkManager: NetworkManaging {
    private let shouldFail: Bool
    var wasFetchCalled = false

    init(shouldFail: Bool = false) {
        self.shouldFail = shouldFail
    }

    func fetch<T: Decodable>(from endpoint: Endpoint) async throws -> T {
        wasFetchCalled = true
        if shouldFail {
            throw NetworkError.invalidResponse
        }

        let response = AccountsResponse(accounts: [Account.sampleData])
        return response as! T
    }
}
