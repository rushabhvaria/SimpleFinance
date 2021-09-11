//
//  News.swift
//  SimpleFinance
//
//  Created by Rushabh Varia on 8/24/21.
//

import Foundation

struct News: Identifiable, Codable {
    var id: UUID {
        return UUID()
    }
    var title: String
    var url: String
    var urlToImage: String?
    var imageUrl: String {
        return urlToImage?.replacingOccurrences(of: "http://", with: "https://") ?? "https://www.apple.com/v/apple-news/h/images/shared/apple-news__6xg2yiktruqy_og.png"
    }
    var publishedAt: String
}
