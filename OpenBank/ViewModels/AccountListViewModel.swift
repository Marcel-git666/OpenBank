//
//  AccountListViewModel.swift
//  OpenBank
//
//  Created by Marcel Mravec on 13.01.2025.
//

import Foundation

@Observable
final class AccountListViewModel {
    var accounts: [Account] = []
    var error: String?

    private let networkManager: NetworkManaging

    init(networkManager: NetworkManaging = NetworkManager.shared) {
        self.networkManager = networkManager
    }

    func fetchAccounts() async throws {
        
    }
}
