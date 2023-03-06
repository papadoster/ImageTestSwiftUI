//
//  TestImageFromFirebase.swift
//  ImageTestSwiftUI
//
//  Created by Александр Карпов on 06.03.2023.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage

struct TestImageFromFirebase: View {
    
    @State private var isShowing: Bool = false
    @State var url: String
        
    var body: some View {
        
        VStack {
            if url != "" {
                AsyncImage(url: URL(string: url)) { image in
                    image.resizable().scaledToFit()
                } placeholder: {
                    ProgressView()
                }
            } else {
                ProgressView()
            }
            
        }
//        .onAppear {
//            let storage = Storage.storage().reference(forURL: "gs://imagetestswiftui.appspot.com/409a/portraits/1201.jpg")
//            storage.downloadURL { url, error in
//                if error != nil {
//                    print((error?.localizedDescription)!)
//                    return
//                }
//                self.url = "\(url!)"
//                print("\(url!)")
//
//
//            }
//
//
//
//        }

    }
        
    
}



struct TestImageFromFirebase_Previews: PreviewProvider {
    static var previews: some View {
        TestImageFromFirebase(url: "https://firebasestorage.googleapis.com:443/v0/b/imagetestswiftui.appspot.com/o/409a%2Fportraits%2F0613.jpg?alt=media&token=45a214a2-cd7d-46fa-9c60-4dad4dc066e1")
    }
}
