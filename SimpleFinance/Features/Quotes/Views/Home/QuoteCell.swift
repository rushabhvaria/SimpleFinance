//
//  QuoteCell.swift
//  SimpleFinance
//
//  Created by Rushabh Varia on 8/24/21.
//

import SwiftUI

struct QuoteCell: View {
    var quote: Quote
        
    var body: some View {
        HStack{
            Text(quote.symbol)
                .font(.body)
                .bold()
            
            Spacer()
            
            Spacer()
            
            VStack {
                Text(getShortVal(for: quote.price))
                    .bold()
                
                
                Text(getShortVal(for: quote.changePercent)+"%")
                    .padding(.horizontal)
                    .frame(width: 100)
                    .background(RoundedRectangle(cornerRadius: 5).fill( Double(quote.change)! > 0.0 ? Color.green : Color.red), alignment: .trailing)
            }
        }
    }
    
    private func getShortVal(for val: String) -> String {
        let dec = (val as NSString).floatValue
        return NSString(format: "%.2f", dec) as String
    }
}

struct QuoteCell_Previews: PreviewProvider {
    static var previews: some View {
        QuoteCell(quote: Quote(symbol: "AAPL", open: "135.90", high: "136.39", low: "133.77", price: "135.13", change: "-0.26", changePercent: "-0.19%"))
    }
}
