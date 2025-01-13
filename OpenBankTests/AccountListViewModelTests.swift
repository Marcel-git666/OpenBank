//
//  AccountListViewModelTests.swift
//  OpenBankTests
//
//  Created by Marcel Mravec on 13.01.2025.
//

import Testing
@testable import OpenBank

struct AccountListViewModelTests {
    
    @Test func fetchAccounts() async throws {
        let mockManager = MockNetworkManager()
        let viewModel = AccountListViewModel(networkManager: mockManager)
        
        try await viewModel.fetchAccounts()
        
        #expect(viewModel.accounts.count == 1)
        #expect(viewModel.accounts.first?.name == "Ceska narodni banka")
        #expect(viewModel.error == nil)
    }
    
    @Test("Fetch accounts fails with error")
    func testFetchAccountsFailure() async throws {
        let mockManager = MockNetworkManager(shouldFail: true)
        let viewModel = AccountListViewModel(networkManager: mockManager)
        do {
            try await viewModel.fetchAccounts()
        } catch {
            #expect(viewModel.accounts.isEmpty, "Accounts should be empty when fetch fails")
            #expect(viewModel.error == "Invalid response received from the server.")
        }
    }
    
    @Test("Fetch accounts calls networkManager")
    func testFetchAccountsCallsNetworkManager() async throws {
        let mockManager = MockNetworkManager()
        let viewModel = AccountListViewModel(networkManager: mockManager)
        
        // Spusť fetchAccounts
        try await viewModel.fetchAccounts()
        
        // Ověř, že mockManager byl volán
        #expect(mockManager.wasFetchCalled == true)
    }

}
