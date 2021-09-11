//
//  QuoteManagerProtocol.swift
//  SimpleFinance
//
//  Created by Rushabh Varia on 8/24/21.
//

import Foundation

protocol QuoteManagerProtocol {
    var quotes: [Quote] {get set}
    func download(stocks: [String], completion: @escaping (Result<[Quote], NetworkError>) -> Void)
}
