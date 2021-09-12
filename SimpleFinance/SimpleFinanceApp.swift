//
//  SimpleFinanceApp.swift
//  SimpleFinance
//
//  Created by Rushabh Varia on 8/24/21.
//

import SwiftUI
import Firebase

@main
struct SimpleFinanceApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
