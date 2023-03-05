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
                
            
            TextField("Идентификатор", text: $loginTextField)
                .frame(width: 200)
            TextField("Пароль", text: $passwordTextField)
                .frame(width: 200)
                .padding(.bottom)
            
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
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(
                        Color.yellow
                    )
                    .cornerRadius(20)
            }

        }
        .padding()
//        .alert(isPresented: showAlert, error: <#T##LocalizedError?#>) { <#LocalizedError#> in
//            <#code#>
//        } message: { <#LocalizedError#> in
//            <#code#>
//        }

    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
