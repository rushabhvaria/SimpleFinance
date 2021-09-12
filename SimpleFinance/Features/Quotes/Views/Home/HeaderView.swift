//
//  HeaderView.swift
//  SimpleFinance
//
//  Created by Rushabh Varia on 8/24/21.
//

import SwiftUI

struct HeaderView: View {
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd"
        return formatter
    }()
    
    @Binding var stocks: [String]
    
    @State private var showSearch = false
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: -5) {
                Text("Simple Finance")
                    .foregroundColor(.white)
                    .bold()
                
                Text("\(Date(), formatter: dateFormatter)")
                    .foregroundColor(.gray)
                    .bold()
            }.font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
            Spacer()
            
            Button {
                showSearch.toggle()
            } label: {
                Image(systemName: "plus")
                    .font(.title)
                    .foregroundColor(.white)
            }.sheet(isPresented: $showSearch, onDismiss: {
                print(self.stocks)
                self.stocks = UserDefaultsManager.shared.savedSymbols
                
            }, content: {
                SearchView()
            })
        }
    }
}
