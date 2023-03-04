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
        Image(uiImage: urlImageModel.image ?? ImageView.defaultImage!)
            .resizable()
            .scaledToFit()
    }
    
    static var defaultImage = UIImage(named: "NewsIcon")
}

struct UrlImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(urlString: nil)
    }
}