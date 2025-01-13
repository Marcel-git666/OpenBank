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
    var filteredAccounts: [Account] = []
    var searchText: String = ""
    var filter: FilterType = .all
    private let networkManager: NetworkManaging
    
    init(networkManager: NetworkManaging = NetworkManager.shared) {
        self.networkManager = networkManager
    }
    
    func fetchAccounts() async throws {
        do {
            let endpoint = AccountEndpoint()
            let response: AccountsResponse = try await networkManager.fetch(from: endpoint)
            accounts = response.accounts
            applyFilter()
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
    
    func applyFilter() {
            // Aplikace filtrování a hledání
            filteredAccounts = accounts.filter { account in
                switch filter {
                case .all:
                    return true
                case .positive:
                    return account.balance > 0
                case .negative:
                    return account.balance <= 0
                }

            }.filter { account in
                // Hledání v názvu
                searchText.isEmpty || account.name.localizedCaseInsensitiveContains(searchText)
            }
        }

        func setFilter(_ newFilter: FilterType) {
            filter = newFilter
            applyFilter()
        }

        func setSearchText(_ text: String) {
            searchText = text
            applyFilter()
        }

        enum FilterType {
            case all
            case positive
            case negative
        }
}
