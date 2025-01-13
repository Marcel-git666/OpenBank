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
    var selectedAccount: Account? = nil
    private let networkManager: NetworkManaging
    
    init(networkManager: NetworkManaging = NetworkManager.shared) {
        self.networkManager = networkManager
    }
    
    func fetchAccounts() async throws {
        do {
            let endpoint = AccountEndpoint()
            let response: AccountsResponse = try await networkManager.fetch(from: endpoint)
            accounts = response.accounts
        } catch let networkError as NetworkError {
            accounts = []
            error = networkError.errorDescription
            throw networkError
        } catch {
            accounts = []
            self.error = error.localizedDescription
            throw NetworkError.invalidResponse 
        }
    }
}
