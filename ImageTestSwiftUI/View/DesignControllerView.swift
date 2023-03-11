//
//  DesignImageView.swift
//  ImageTestSwiftUI
//
//  Created by Александр Карпов on 01.03.2023.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

struct DesignControllerView: View {
    
    var image: String
    var imageName: String
    @State private var isFinish: Bool = false
    @State private var secondName: String = ""
    @State private var firstName: String = ""
    @State private var quote: String = ""
    
    @State private var secondNameSaved: String = ""
    @State private var firstNameSaved: String = ""
    @State private var quoteSaved: String = ""
    
    @State private var renderedImage = Image(systemName: "photo")
    @Environment(\.displayScale) var displayScale
    
    let db = Firestore.firestore()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                
                DesignMiniView(image: image, secondName: secondNameSaved.isEmpty ?  secondName : secondNameSaved, firstName: firstNameSaved.isEmpty ? firstName : firstNameSaved, quote: quoteSaved.isEmpty ? quote : quoteSaved)
                    .padding()
                    .padding(.top, 100)
                
                VStack(alignment: .leading) {
                    TextField("Фамилия", text: $secondName)
                        .padding(.horizontal)
                    TextField("Имя", text: $firstName)
                        .padding(.horizontal)
                    TextField("Цитата", text: $quote)
                        .padding(.horizontal)
            
                    
                    HStack {
                        Spacer()
//                        Button {
//                            let imageName = image
//                            let firstNameB = firstName
//                            let secondNameB = secondName
//
//                            let renderer = ImageRenderer(content: DesignBigView(image: imageName, secondName: secondNameB, firstName: firstNameB, quote: quote))
//
//
//                            renderer.scale = 1.0
//
//                            if let uiImage = renderer.uiImage {
//                                DispatchQueue.global(qos: .utility).async {
//                                    UIImageWriteToSavedPhotosAlbum(uiImage, nil, nil, nil)
//                                }
//                            }
//                        } label: {
//                            Text("Готово")
//                                .font(.system(.title))
//                                .foregroundColor(.white)
//                                .padding(.horizontal, 20)
//                                .padding(.vertical, 10)
//                        }
//                        .background(Color.blue)
//                        .cornerRadius(30)
//                    .padding()
                        
                        
                        Button {
                            
                            if firstName != "" && secondName != "" {
                                if let school = Auth.auth().currentUser?.email {
                                    db.collection(school).document(imageName).setData([
                                        "ImageName" : imageName,
                                        "ImageURL" : image,
                                        "FirstName" : firstName,
                                        "SecondName" : secondName,
                                        "quote" : quote
                                    ]) { error in
                                        if let e = error {
                                            print("error with save data in FStore \(e)")
                                        } else {
                                            print("Sucsessfully saved data")
                                        }
                                    }
                                }
                            }
                            
                            
                        } label: {
                            Text("Сохранить")
                                .font(.system(.title))
                                .foregroundColor(.white)
                                .padding(.horizontal, 30)
                                .padding(.vertical, 10)
                        }
                        .background(Color.green)
                        .cornerRadius(30)
                        .padding()
                        
                        Spacer()
                    }
                    
                }
                .padding(.top)
                
            }
        }
    }
}

struct DesignControllerView_Previews: PreviewProvider {
    static var previews: some View {
        DesignControllerView(image: "https://firebasestorage.googleapis.com:443/v0/b/imagetestswiftui.appspot.com/o/409a%2Fportraits%2Fmini%2F1201.jpg?alt=media&token=f63afc39-14b9-47cd-8b4d-bc410f771e2e", imageName: "1201")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
