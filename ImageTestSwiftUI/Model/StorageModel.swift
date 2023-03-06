//
//  StorageModel.swift
//  ImageTestSwiftUI
//
//  Created by Александр Карпов on 06.03.2023.
//

import SwiftUI
import FirebaseStorage

struct StorageModel {
    
    @AppStorage("schoolId") var schoolId: String = ""
    
    
    func filePath() -> [String] {
        var urls: [String] = []
        var finalUrls: [String] = []
        
        let storageReference = Storage.storage().reference(forURL: "gs://imagetestswiftui.appspot.com/\((schoolId))/portraits/mini")
        storageReference.listAll { (res, error) in
            if let error = error {
                // ...
                print((error.localizedDescription))
            }

            guard let result = res else {
                fatalError()
            }

            for prefix in result.prefixes {
                // The prefixes under storageReference.
                print((prefix))
                // You may call listAll(completion:) recursively on them.
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
                }

                urls.append("\(item)")
//                    print((item))
//                    print(urls)
            }
        }
        
        for url in urls {

            let storage = Storage.storage().reference(forURL: url)
            storage.downloadURL { url, error in
                if error != nil {
                    print((error?.localizedDescription)!)
                    return
                }

                finalUrls.append("\(url!)")
            }

        }
        
        print(finalUrls)

        return finalUrls
    }
    
}
