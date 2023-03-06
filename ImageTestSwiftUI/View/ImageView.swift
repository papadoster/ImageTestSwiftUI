//
//  ImageView.swift
//  ImageTestSwiftUI
//
//  Created by Александр Карпов on 04.03.2023.
//

import SwiftUI

struct ImageView: View {
    @ObservedObject var urlImageModel: UrlImageModel
    
    init(urlString: String?) {
        urlImageModel = UrlImageModel(urlString: urlString)
    }
    
    var body: some View {
        if urlImageModel.image != nil {
            Image(uiImage: urlImageModel.image!)
                .resizable()
                .scaledToFit()
        } else {
            ProgressView()
        }
    }
    
    static var defaultImage = UIImage(named: "NewsIcon")
}

struct UrlImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(urlString: "https://firebasestorage.googleapis.com/v0/b/imagetestswiftui.appspot.com/o/409a%2Fportraits%2F0921.jpg?alt=media&token=b809d946-f63e-42d9-9012-11972179f8a0")
    }
}
