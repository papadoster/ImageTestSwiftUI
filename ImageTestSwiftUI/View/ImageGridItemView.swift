//
//  ImageGridItemView.swift
//  ImageTestSwiftUI
//
//  Created by Александр Карпов on 01.03.2023.
//

import SwiftUI

struct ImageGridItemView: View {
    
    var idImage: Int
    
    var body: some View {
        AsyncImage(url: URL(string: "https://picsum.photos/id/\(idImage)/200/300")) { phase in
            
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
            case .empty:
                Image(systemName: "photo.circle.fill")
            case .failure(_):
                Image(systemName: "ant.circle.fill")
            default:
                fatalError()
            }
        }
    }
}

struct ImageGridItemView_Previews: PreviewProvider {
    static var previews: some View {
        ImageGridItemView(idImage: 1)
            .padding()
    }
}
