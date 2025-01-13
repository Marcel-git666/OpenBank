//
//  TransactionViewModel.swift
//  OpenBank
//
//  Created by Marcel Mravec on 13.01.2025.
//

import Foundation

@Observable
final class TransactionViewModel {
    var selectedAccountDetails: Account?
    var transactions: [Transaction] = []
    var error: String?
    
    private let networkManager: NetworkManaging
    
    init(networkManager: NetworkManaging = NetworkManager.shared) {
        self.networkManager = networkManager
    }
    
    func fetchAccountDetails(accountNumber: String) async throws {
        do {
            let endpoint = AccountDetailEndpoint(accountNumber: accountNumber)
            let accountDetails: Account = try await networkManager.fetch(from: endpoint)
            self.selectedAccountDetails = accountDetails
        } catch let networkError as NetworkError {
            selectedAccountDetails = nil
            error = networkError.errorDescription
            throw networkError
        } catch {
            selectedAccountDetails = nil
            self.error = error.localizedDescription
            throw NetworkError.invalidResponse
        }
    }
    
    func fetchTransactions(for accountNumber: String) async throws {
        self.transactions = []
        let endpoint = AccountTransactionsEndpoint(accountNumber: accountNumber)
        let response: TransactionResponse = try await networkManager.fetch(from: endpoint)
        self.transactions = response.transactions
    }
}
