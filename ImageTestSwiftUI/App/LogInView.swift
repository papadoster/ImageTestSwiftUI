//
//  LogInView.swift
//  ImageTestSwiftUI
//
//  Created by Александр Карпов on 05.03.2023.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

struct LogInView: View {
    
    @State private var loginTextField: String = ""
    @State private var passwordTextField: String = ""
    @State private var showAlert: Bool = false
    @AppStorage("isSignIn") var isSignIn: Bool = false
    @AppStorage("schoolId") var schoolId: String = ""
    
    var body: some View {
        VStack {
            Text("Добро Пожаловать!")
                .font(.system(.largeTitle, design: .default, weight: .heavy))
                .multilineTextAlignment(.center)
                .padding()
            Text("Введитe идентификатор класса и пароль")
                .font(.headline)
                .frame(width: 250)
                .multilineTextAlignment(.center)
                .padding(.bottom, 20)
                
            
            VStack {
                GroupBox{
                    TextField(text: $loginTextField, prompt: Text("Идентификатор")) {
                        //                    Text("Username")
                    }
                }
                GroupBox{
                    SecureField(text: $passwordTextField, prompt: Text("Пароль")) {
                        //                    Text("Password")
                    }
                }
            }
            .padding(.horizontal, 40)
            .padding(.vertical)
            
            Button {
                var fillEmail: String?
                var fillPassword: String?
                if loginTextField != "" {
                    fillEmail = "\(loginTextField)@gmail.com"
                }
                fillPassword = passwordTextField
                
                if let email = fillEmail, let password = fillPassword {
                    Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                        if let e = error {
                            print(e.localizedDescription)
                            
                        } else {
                            isSignIn = true
                            schoolId = loginTextField
                        }
                    }
                }
                
            } label: {
                Text("Вход")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.horizontal, 30)
                    .padding(.vertical, 15)
                    .background(
                        Color.yellow
                    )
                    .cornerRadius(10)
            }

        }
        .padding()

    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
