//
//  ImageGridItemView.swift
//  ImageTestSwiftUI
//
//  Created by Александр Карпов on 01.03.2023.
//

import SwiftUI
import NukeUI

struct ImageGridItemView: View {
    
    var idImage: Int
    var url: URL {
        URL(string: "https://picsum.photos/id/\(idImage)/200/300")!
    }
    
    @StateObject private var imageTwo = FetchImage()
        
    
    var body: some View {
//        AsyncImage(url: URL(string: "https://picsum.photos/id/\(idImage)/200/300")) { phase in
//
//            switch phase {
//            case .success(let image):
//                image
//                    .resizable()
//                    .scaledToFit()
//            case .empty:
//                Image(systemName: "photo.circle.fill")
//            case .failure(_):
//                Image(systemName: "ant.circle.fill")
//            default:
//                fatalError()
//            }
//        }
        
//        AsyncImage(url: URL(string: "https://picsum.photos/id/\(idImage)/200/300")) { image in
//            image
//                .resizable()
//                .scaledToFit()
//        } placeholder: {
//            ProgressView()
//        }
        ZStack {
            imageTwo.view?
                .resizable()
                .scaledToFit()
        }
        .onAppear {
            imageTwo.load(url)
            
        }
        .onChange(of: url) { imageTwo.load($0) }
//        .onDisappear { imageTwo.reset() }
    }
        
}

struct ImageGridItemView_Previews: PreviewProvider {
    static var previews: some View {
        ImageGridItemView(idImage: 1)
            .padding()
    }
}
