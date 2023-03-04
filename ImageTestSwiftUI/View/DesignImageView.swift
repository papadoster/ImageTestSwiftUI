//
//  DesignImageView.swift
//  ImageTestSwiftUI
//
//  Created by Александр Карпов on 01.03.2023.
//

import SwiftUI

struct DesignImageView: View {
    
    var image: Int
    @State private var isFinish: Bool = false
    @State private var secondName: String = ""
    @State private var firstName: String = ""
    @State private var quote: String = ""
    @State private var renderedImage = Image(systemName: "photo")
    @Environment(\.displayScale) var displayScale
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                
                DesignMiniView(image: image, secondName: secondName, firstName: firstName, quote: quote)
                    .padding(5)
                    .padding(.top, 150)
                
                VStack(alignment: .leading) {
                    TextField("Фамилия", text: $secondName)
                        .padding(.horizontal)
                    TextField("Имя", text: $firstName)
                        .padding(.horizontal)
                    TextField("Цитата", text: $quote)
                        .padding(.horizontal)
            
                    
                    HStack {
                        Spacer()
                        Button {
                            let imageName = image
                            let firstNameB = firstName
                            let secondNameB = secondName
                            
                            let renderer = ImageRenderer(content: DesignView(image: imageName, secondName: secondNameB, firstName: firstNameB, quote: quote))
                            
                            
                            renderer.scale = 1.0
                            
                            if let uiImage = renderer.uiImage {
                                DispatchQueue.global(qos: .utility).async {
                                    UIImageWriteToSavedPhotosAlbum(uiImage, nil, nil, nil)
                                }
                            }
                        } label: {
                            Text("Готово")
                                .font(.system(.largeTitle))
                                .foregroundColor(.white)
                                .padding(.horizontal, 30)
                                .padding(.vertical, 10)
                        }
                        .background(Color.blue)
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

struct DesignImageView_Previews: PreviewProvider {
    static var previews: some View {
        DesignImageView(image: 1)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
