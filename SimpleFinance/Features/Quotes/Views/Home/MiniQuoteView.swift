//
//  MiniQuoteView.swift
//  SimpleFinance
//
//  Created by Rushabh Varia on 8/24/21.
//

import SwiftUI

struct MiniQuoteView: View {
    
    @ObservedObject var stockQuotes: StockQuoteManager
    //MockQuoteManager
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(stockQuotes.quotes) { quote in
                    VStack {
                        Text(quote.symbol)
                            .font(.subheadline)
                            .bold()
                        
                        Text(getShortVal(for: quote.price))
                            .font(.subheadline)
                        
                        Text(getShortVal(for: quote.changePercent)+"%")
                            .font(.subheadline)
                            .padding(.horizontal)
                            .frame(width: 100)
                            .background(RoundedRectangle(cornerRadius: 5).fill(Double(quote.change)! > 0.0 ? Color.green : Color.red), alignment: .trailing)
                    }.background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.2)))
                    .foregroundColor(Color.white)
                }
            }
        }
//        .onAppear{
//            stockQuotes.download(stocks: [], completion: { _ in })
//        }
    }
    private func getShortVal(for val: String) -> String {
        let dec = (val as NSString).floatValue
        return NSString(format: "%.2f", dec) as String
    }
}
