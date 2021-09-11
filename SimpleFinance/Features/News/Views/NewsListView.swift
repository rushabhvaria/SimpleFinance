//
//  NewsListView.swift
//  SimpleFinance
//
//  Created by Rushabh Varia on 8/24/21.
//

import SwiftUI
import BetterSafariView

struct NewsListView: View {
    
    @ObservedObject var newsManager: NewsDownloadManager
    @State private var showOnSafari = false
    @State private var selectedArticle: News?
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(newsManager.newsArticles) { article in
                    VStack(alignment: .leading) {
                        HStack(alignment: .top) {
                            VStack(alignment: .leading) {
                                Text(article.title)
                                    .bold()
                                    .foregroundColor(.white)
                                    .fixedSize(horizontal: false, vertical: true)
                                
                                Spacer()
                                
                                Text(getPublishedTime(for: article))
                                    .foregroundColor(.white .opacity(0.4))
                                    .fixedSize(horizontal: false, vertical: true)
                                
                            }
                            
                            Spacer()
                            
                            AsyncImage.init(url: URL(string: article.imageUrl)!) {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.white.opacity(0.2))
                            } image: { (img) -> Image in
                                Image(uiImage: img)
                                    .resizable()
                            }
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .cornerRadius(10)
                            
                            
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            selectedArticle = article
                            showOnSafari.toggle()
                        }
                        .sheet(isPresented: $showOnSafari, content: {
                            loadNews(for: selectedArticle ?? article)
                        })
                        
                        RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.2))
                            .padding(.horizontal, 50)
                            .frame(height: 1)
                    }
                }
            }
        }
    }
    
    private func loadNews(for article: News) -> some View {
        return SafariView(url: URL(string: article.url.replacingOccurrences(of: "http://", with: "https://"))!)
    }
    
    
    ///To convert API result date (ISO8601) to `Date`, this property should not be inside any methods
    let inDateFormatter = ISO8601DateFormatter()
    
    ///To convert `Date` to readable date format, this property should not be inside any methods
    let outDateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "MMM d"
        df.locale = Locale(identifier: "en_US_POSIX")
        return df
    }()
    
    private func getPublishedTime(for article: News) -> String {
        guard let nd = inDateFormatter.date(from: article.publishedAt) else { return "" }
        let formattedString = outDateFormatter.string(from: nd)
        return formattedString
    }
}
