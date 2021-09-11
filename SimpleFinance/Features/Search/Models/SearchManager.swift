//
//  SearchManager.swift
//  SimpleFinance
//
//  Created by Rushabh Varia on 8/25/21.
//

import Foundation

final class SearchManager: ObservableObject {
    @Published var searches = [Search]()
    
    func searchStocks(keyword: String) {
        NetworkManager<SearchResponse>().fetch(from: URL(string: API.symbolSearchUrl(for: keyword))!) { (result) in
            switch result {
            case .failure(let err):
                print(err)
            
            case .success(let resp):
                DispatchQueue.main.async {
                    self.searches = resp.bestMatches
                }
            }
        }
    }
}
