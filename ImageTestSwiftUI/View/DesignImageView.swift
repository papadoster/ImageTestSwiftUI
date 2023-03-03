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
    @State private var renderedImage = Image(systemName: "photo")
    @Environment(\.displayScale) var displayScale
    
    var body: some View {
        VStack {
            DesignMiniView(image: image, secondName: secondName, firstName: firstName)
                .padding(5)
            
            VStack(alignment: .leading) {
                TextField("Фамилия", text: $secondName)
                    .padding(.horizontal)
                TextField("Имя", text: $firstName)
                    .padding(.horizontal)
                
                Button {
                    let imageName = image
                    let firstNameB = firstName
                    let secondNameB = secondName
                    
                    let renderer = ImageRenderer(content: DesignView(image: imageName, secondName: secondNameB, firstName: firstNameB))
                    
                    
                    renderer.scale = 1.0
                    
                    if let uiImage = renderer.uiImage {
                        DispatchQueue.global(qos: .utility).async {
                            UIImageWriteToSavedPhotosAlbum(uiImage, nil, nil, nil)
                        }
                    }
                } label: {
                    Text("Finish")
                }
                .padding()
                
                
//                ShareLink("Export", item: renderedImage, preview: SharePreview(Text("image-\(image)-\(secondName)"), image: renderedImage))
//                    .padding(.horizontal)
            }
//            .onChange(of: isFinish) { _ in render() }
            .padding(.top)
            
            
            
        }
    }
    
//    @MainActor func render() {
//        let imageName = image
//        let firstNameB = firstName
//        let secondNameB = secondName
//        let renderer = ImageRenderer(content: DesignView(image: imageName, secondName: secondNameB, firstName: firstNameB))
//
//        renderer.scale = 1.0
//
//        if let uiImage = renderer.uiImage {
//            renderedImage = Image(uiImage: uiImage)
//        }
//    }
}

struct DesignImageView_Previews: PreviewProvider {
    static var previews: some View {
        DesignImageView(image: 1)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

//extension View {
//    func snapshot() -> UIImage {
//        let controller = UIHostingController(rootView: self)
//        let view = controller.view
//
//        let targetSize = controller.view.intrinsicContentSize
//        view?.bounds = CGRect(origin: .zero, size: targetSize)
//        view?.backgroundColor = .clear
//
//        let renderer = UIGraphicsImageRenderer(size: targetSize)
//
//        return renderer.image { _ in
//            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
//        }
//    }
//}
