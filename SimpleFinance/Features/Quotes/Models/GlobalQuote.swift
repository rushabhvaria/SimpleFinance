//
//  GlobalQuote.swift
//  SimpleFinance
//
//  Created by Rushabh Varia on 8/24/21.
//

import Foundation

struct GlobalQuoteResponse: Codable {
    var quote: Quote
    
    private enum CodingKeys: String, CodingKey {
        case quote = "Global Quote"
    }
}
