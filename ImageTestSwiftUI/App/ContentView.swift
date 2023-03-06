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
    
    @AppStorage("schoolId") var schoolId: String = ""
    let schoolName: String

    @State private var gridLayout: [GridItem] = Array(repeating: .init(.flexible()), count: 4)
    @State private var isFinishFilePathsGenerate: Bool = false
    
    
//    let storageModel = StorageModel()
    
    
//    let filepaths: [String] = ["https://firebasestorage.googleapis.com:443/v0/b/imagetestswiftui.appspot.com/o/409a%2Fportraits%2F0921.jpg?alt=media&token=b809d946-f63e-42d9-9012-11972179f8a0", "https://firebasestorage.googleapis.com:443/v0/b/imagetestswiftui.appspot.com/o/409a%2Fportraits%2F1318.jpg?alt=media&token=425a12aa-1731-4ed3-950b-2a561064908e", "https://firebasestorage.googleapis.com:443/v0/b/imagetestswiftui.appspot.com/o/409a%2Fportraits%2F1106.jpg?alt=media&token=88f72aae-da6e-4b6a-93e8-862607c0f0bb", "https://firebasestorage.googleapis.com:443/v0/b/imagetestswiftui.appspot.com/o/409a%2Fportraits%2F1201.jpg?alt=media&token=ea44e015-8d28-488c-8a99-f1903028681a", "https://firebasestorage.googleapis.com:443/v0/b/imagetestswiftui.appspot.com/o/409a%2Fportraits%2F0613.jpg?alt=media&token=45a214a2-cd7d-46fa-9c60-4dad4dc066e1", "https://firebasestorage.googleapis.com:443/v0/b/imagetestswiftui.appspot.com/o/409a%2Fportraits%2F0828.jpg?alt=media&token=1d354cdc-d698-4ed7-8790-c483970afb28", "https://firebasestorage.googleapis.com:443/v0/b/imagetestswiftui.appspot.com/o/409a%2Fportraits%2F0745.jpg?alt=media&token=dea74a8c-22aa-4115-a3d1-2dd1ee71f08a"]
    
    @State private var filepaths: [String] = []
    
    
   

    
//    var filepaths: [String] {
//        var urls: [String] = []
//        var finalUrls: [String] = []
//
//        let storageReference = Storage.storage().reference(forURL: "gs://imagetestswiftui.appspot.com/\(schoolName)/portraits/mini")
//        storageReference.listAll { (res, error) in
//            if let error = error {
//                // ...
//                print((error.localizedDescription))
//            }
//
//            guard let result = res else {
//                fatalError()
//            }
//
//            for prefix in result.prefixes {
//                // The prefixes under storageReference.
//                print((prefix))
//                // You may call listAll(completion:) recursively on them.
//            }
//            for item in result.items {
//                // The items under storageReference.
//                let storage = Storage.storage().reference(forURL: "\(item)")
//                storage.downloadURL { url, error in
//                    if error != nil {
//                        print((error?.localizedDescription)!)
//                        return
//                    }
//
//                    finalUrls.append("\(url!)")
//                    print(finalUrls)
//                }
//
//                urls.append("\(item)")
//                print((item))
//                print(urls)
//            }
//        }
//
//        for url in urls {
//
//            let storage = Storage.storage().reference(forURL: url)
//            storage.downloadURL { url, error in
//                if error != nil {
//                    print((error?.localizedDescription)!)
//                    return
//                }
//
//                finalUrls.append("\(url!)")
//            }
//
//        }
//
//        print(finalUrls)
//        isFinishFilePathsGenerate = true
//        return finalUrls
//
//    }
    
    func filePath(_ sch: String) {
        
        var finalUrls: [String] = []
        
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

                    finalUrls.append("\(url!)")
                    print(finalUrls)
                    filepaths = finalUrls
                }
            }
            
            if finalUrls.isEmpty {
                isFinishFilePathsGenerate = false
            } else {
                isFinishFilePathsGenerate = true
            }
            
//            filepaths = finalUrls
        }
            
        
        
            

    }
    
    
    
    var body: some View {

        
        
        NavigationStack {
            
            if filepaths.count != 0 {
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: gridLayout) {
                        ForEach(filepaths, id: \.self) { url in
                            NavigationLink(destination: DesignControllerView(image: url)) {
                                ImageView(urlString: url)
                                    .cornerRadius(8)
                                
                            }
                            
                        }
                    }
                    .padding()
                    .padding(.bottom, 30)
                }
                .navigationTitle(schoolName)
            } else {

                ProgressView()

                Button("go") {
                    print(filepaths.count)
                }

            }
             
        }
        .onAppear {
            filePath(schoolName)
        }
//        .onAppear {
//            var urls: [String] = []
//            var finalUrls: [String] = []
//
//            let storageReference = Storage.storage().reference(forURL: "gs://imagetestswiftui.appspot.com/\(schoolName)/portraits/mini")
//            storageReference.listAll { (res, error) in
//                if let error = error {
//                    // ...
//                    print((error.localizedDescription))
//                }
//
//                guard let result = res else {
//                    fatalError()
//                }
//
//                for prefix in result.prefixes {
//                    // The prefixes under storageReference.
//                    print((prefix))
//                    // You may call listAll(completion:) recursively on them.
//                }
//                for item in result.items {
//                    // The items under storageReference.
//                    let storage = Storage.storage().reference(forURL: "\(item)")
//                    storage.downloadURL { url, error in
//                        if error != nil {
//                            print((error?.localizedDescription)!)
//                            return
//                        }
//
//                        finalUrls.append("\(url!)")
//                        print(finalUrls)
//                    }
//
//                    urls.append("\(item)")
////                    print((item))
////                    print(urls)
//                }
//            }
//
//            for url in urls {
//
//                let storage = Storage.storage().reference(forURL: url)
//                storage.downloadURL { url, error in
//                    if error != nil {
//                        print((error?.localizedDescription)!)
//                        return
//                    }
//
//                    finalUrls.append("\(url!)")
//                }
//
//            }
//
//            print(finalUrls)
//            filepaths = finalUrls
//
//        }
        
        
    }
    

    
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(schoolName: "Project")
    }
}
