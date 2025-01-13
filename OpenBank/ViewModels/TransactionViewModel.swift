//
//  TransactionViewModel.swift
//  OpenBank
//
//  Created by Marcel Mravec on 13.01.2025.
//

import Foundation

@Observable
final class TransactionViewModel {
    var selectedAccount: Account? 
    var error: String?
    
    private let networkManager: NetworkManaging
    
    init(networkManager: NetworkManaging = NetworkManager.shared) {
        self.networkManager = networkManager
    }
    
    func fetchAccountDetails(accountNumber: String) async throws {
    }
}
