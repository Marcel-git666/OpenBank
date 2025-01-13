# OpenBank

## Overview
OpenBank is a SwiftUI-based iOS application that uses the Česká spořitelna Transparent Accounts API to fetch and display information about transparent bank accounts.

## Features
- Fetch and display a list of transparent accounts.
- View details for a specific account.

### API Adaptation
Due to the sandbox API limitations, all account details and transactions return identical data regardless of the `accountNumber`. To handle this:

- Most account information (e.g., name, IBAN, balance) is directly sourced from `AccountListViewModel`, which contains preloaded data.
- The `description` is fetched separately using `TransactionViewModel` to demonstrate how detailed information could be loaded in a real-world scenario.

This design highlights the flexibility of the architecture and ensures the app remains functional despite API limitations.



## Setup
1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/OpenBank.git

2. Add your Environment.swift file with the following content:

   ```bash
	struct Environment {
    		static let baseURL = "https://api.csas.cz/webapi/api/v3/transparentAccounts"
    		static let apiKey = "your_api_key"
	}


## Credits
The `NetworkManager` implementation is inspired by [Gökhan Varış's article on Medium](https://medium.com/@gokhanvaris/creating-a-network-manager-in-swiftui-with-clean-code-principles-d767a0e93a9a).
