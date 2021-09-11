//
//  ContentView.swift
//  SimpleFinance
//
//  Created by Rushabh Varia on 8/24/21.
//

import SwiftUI

struct ContentView: View {
    
    
    @State var signInSuccess = false
        
        var body: some View {
            return Group {
                if signInSuccess {
                    StocksAppView()
                }
                else {
                    LaunchView(signInSuccess: $signInSuccess)
                }
            }
        }
}
