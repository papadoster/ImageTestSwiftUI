//
//  ContentView.swift
//  ImageTestSwiftUI
//
//  Created by Александр Карпов on 01.03.2023.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import FirebaseStorage

struct ContentView: View {
    
    @AppStorage("schoolId") var schoolId: String = "409a"
    @AppStorage("isSignIn") var isSignIn: Bool = false
    let schoolName: String

    @State private var gridLayout: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    @State private var filepaths: [String : String] = [:]
    @State private var filepathsKeys: [String] = []
    @State private var filepathsUrls: [String] = []
    
    func filePath(_ sch: String) {
        
        var finalUrls: [String: String] = [:]
        
        let storageReference = Storage.storage().reference(forURL: "gs://imagetestswiftui.appspot.com/\((sch))/portraits/mini")
        storageReference.listAll { (res, error) in
            if let error = error {
                // ...
                print((error.localizedDescription))
            }

            guard let result = res else {
                fatalError()
            }

            for item in result.items {
                // The items under storageReference.
                let storage = Storage.storage().reference(forURL: "\(item)")
                storage.downloadURL { url, error in
                    if error != nil {
                        print((error?.localizedDescription)!)
                        return
                    }

//                    finalUrls.append("\(url!)")
                    var itemString = "\(item)"
                    var stringArr = itemString.components(separatedBy: "/")
                    var nameOfPhoto = stringArr.last
                        finalUrls["\(nameOfPhoto!)"] = ("\(url!)")
                        print(finalUrls)
                        filepaths = finalUrls
                    filepathsKeys = [String](filepaths.keys)
                    filepathsUrls = [String](filepaths.values)
                }
            }
        }
    }
    
    
    
    var body: some View {

        
        
        NavigationStack {
            
            if !filepaths.isEmpty {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: gridLayout) {
                        ForEach(filepathsKeys, id: \.self) { image in
                            NavigationLink(destination: DesignControllerView(image: filepaths[image]!, imageName: image)) {
                                ImageView(urlString: filepaths[image])
                                    .cornerRadius(8)
                                
                            }
                            
                        }
                    }
                    .padding()
                    .padding(.bottom, 30)
                }
                .navigationTitle(schoolName)
                .toolbar {
                    Button {
                        do {
                           try Auth.auth().signOut()
                        } catch {
                            print("Error signing out: %@")
                        }
                        isSignIn = false
                        schoolId = ""
                        
                    } label: {
                        Text("Log Out")
                    }

                }
                
            } else {

                ProgressView()

            }
             
        }
        .onAppear {
            filePath(schoolName)
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(schoolName: "409a")
    }
}
