//
//  ContentView.swift
//  ImageTestSwiftUI
//
//  Created by Александр Карпов on 01.03.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var images: [Int] = [100, 241, 23, 43, 5, 66, 7, 82, 200, 103, 25, 600, 55, 1, 8, 12, 4]
    @State private var gridLayout: [GridItem] = Array(repeating: .init(.flexible()), count: 4)
    
    var body: some View {
//        NavigationStack {
//            ScrollView(.vertical, showsIndicators: false) {
//                LazyVGrid(columns: gridLayout) {
//                    ForEach(images, id: \.self) { image in
//                        NavigationLink(destination: DesignImageView(image: image)) {
//                            ImageGridItemView(idImage: image)
//                                .cornerRadius(8)
//                        }
//
//                    }
//                }
//                .padding()
//                .padding(.bottom, 30)
//            }
//            .navigationTitle("Project")
//        }
        
        
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: gridLayout) {
                    ForEach(images, id: \.self) { image in
                        NavigationLink(destination: DesignImageView(image: image)) {
                            ImageView(urlString: "https://picsum.photos/id/\(image)/200/300")
                                .cornerRadius(8)
                        }

                    }
                }
                .padding()
                .padding(.bottom, 30)
            }
            .navigationTitle("Project")
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
