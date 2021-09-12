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
    
    @Binding var signInSuccess: Bool
    
    var body: some View {
        VStack {
            Image(systemName: "sheqelsign.square.fill").resizable()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
            HStack {
                TextField("Username", text: $userName)
            }.padding()
            
            HStack {
                SecureField("Password", text: $password)
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

//struct LaunchView_Previews: PreviewProvider {
//    static var previews: some View {
//        LaunchView()
//    }
//}
