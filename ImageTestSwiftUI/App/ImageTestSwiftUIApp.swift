//
//  ImageTestSwiftUIApp.swift
//  ImageTestSwiftUI
//
//  Created by Александр Карпов on 01.03.2023.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
      let db = Firestore.firestore()
      print(db)
    return true
  }
}

@main
struct ImageTestSwiftUIApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @AppStorage("isSignIn") var isSignIn: Bool = false
    @AppStorage("schoolId") var schoolId: String = ""
    
    var body: some Scene {
        WindowGroup {
            if isSignIn {
                ContentView(schoolName: schoolId)
            } else {
                LogInView()
            }
        }
    }
}
