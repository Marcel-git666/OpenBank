//
//  TransactionViewModelTests.swift
//  OpenBankTests
//
//  Created by Marcel Mravec on 13.01.2025.
//

import Testing
@testable import OpenBank

struct TransactionViewModelTests {
    
    @Test("Fetch account details successfully")
    func testFetchAccountDetailsSuccess() async throws {
        // Arrange
        let mockManager = MockNetworkManager()
        let viewModel = TransactionViewModel(networkManager: mockManager)
        
        // Act
        try await viewModel.fetchAccountDetails(accountNumber: "000000-2906478309")
        
        // Assert
        #expect(viewModel.selectedAccountDetails != nil)
        #expect(viewModel.selectedAccountDetails?.description == Account.sampleData.description, "Description should match sample data")
        #expect(viewModel.error == nil, "Error should be nil when fetch succeeds")
    }
    
    @Test("Handle fetch account details error")
    func testFetchAccountDetailsFailure() async {
        // Arrange
        let mockManager = MockNetworkManager(shouldFail: true)
        let viewModel = TransactionViewModel(networkManager: mockManager)
        
        // Act
        do {
            try await viewModel.fetchAccountDetails(accountNumber: "000000-2906478309")
        } catch {
            #expect(viewModel.selectedAccountDetails == nil)
            #expect(viewModel.error != nil, "Error should not be nil when fetch fails")
        }
    }
    
}
