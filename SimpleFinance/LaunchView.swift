//
//  LaunchView.swift
//  SimpleFinance
//
//  Created by Rushabh Varia on 9/1/21.
//

import SwiftUI

struct LaunchView: View {
    @State private var userName: String = ""
        @State private var password: String = ""
        
        @State private var showError = false
        
        //@Binding var signInSuccess: Bool
        
        var body: some View {
            VStack {
                HStack {
                    Text("User name")
                    TextField("type here", text: $userName)
                }.padding()
                
                HStack {
                    Text(" Password")
                    TextField("type here", text: $password)
                        .textContentType(.password)
                }.padding()
                
                Button(action: {
                    // Your auth logic
                    if(self.userName == self.password) {
                        self.signInSuccess = true
                    }
                    else {
                        self.showError = true
                    }
                    
                }) {
                    Text("Sign in")
                }
                
                if showError {
                    Text("Incorrect username/password").foregroundColor(Color.red)
                }
            }
        }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
