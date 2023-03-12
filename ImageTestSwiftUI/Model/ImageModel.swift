//
//  Model.swift
//  ImageTestSwiftUI
//
//  Created by Александр Карпов on 04.03.2023.
//


import Foundation
import SwiftUI

class UrlImageModel: ObservableObject {
    @Published var image: UIImage?
    var urlString: String?
    var imageName: String?
    var imageCache = ImageCache.getImageCache()
    var imageMemory = ImageMemory.getImageMemory()
    
    init(urlString: String?, imageName: String?) {
        self.urlString = urlString
        self.imageName = imageName
        loadImage()
    }
    
    func loadImage() {
        if loadImageFromMemory() {
            print("Memory hit")
            return
        }
        
        print("Cache miss, loading from url")
        loadImageFromUrl()
    }
    
    func loadImageFromCache() -> Bool {
        guard let urlString = urlString else {
            return false
        }
        
        guard let cacheImage = imageCache.get(forKey: urlString) else {
            return false
        }
        
        image = cacheImage
        return true
    }
    
    func loadImageFromMemory() -> Bool {
        guard let urlString = imageName else {
            return false
        }
        
        guard let memoryImage = imageMemory.get(name: urlString) else {
            return false
        }
        
        image = memoryImage
        return true
    }
    
    func loadImageFromUrl() {
        
        guard let urlString = urlString else {
            return
        }
        
        let url = URL(string: urlString)!
        let task = URLSession.shared.dataTask(with: url, completionHandler: getImageFromResponse(data:response:error:))
        task.resume()
    }
    
    
    func getImageFromResponse(data: Data?, response: URLResponse?, error: Error?) {
        guard error == nil else {
            print("Error: \(error!)")
            return
        }
        guard let data = data else {
            print("No data found")
            return
        }
        
        DispatchQueue.main.async {
            guard let loadedImage = UIImage(data: data) else {
                return
            }
            
            self.imageCache.set(forKey: self.urlString!, image: loadedImage)
            //-
            self.imageMemory.set(image: loadedImage, imageName: self.imageName!)
            //-
            self.image = loadedImage
        }
    }
}

class ImageCache {
    var cache = NSCache<NSString, UIImage>()
    
    func get(forKey: String) -> UIImage? {
        return cache.object(forKey: NSString(string: forKey))
    }
    
    func set(forKey: String, image: UIImage) {
        cache.setObject(image, forKey: NSString(string: forKey))
    }
}

class ImageMemory {
    
    var path: [String: URL] = [:]
    
    func getDocumentsDirectory() throws -> URL {
         return try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
    }
    
    
    func set(image: UIImage, imageName: String) {
        
        if let data = image.jpegData(compressionQuality: 1.0) {
            
            do {
                let documents = try? getDocumentsDirectory()
                
                let filename = documents!.appendingPathComponent(imageName)
                
                try? data.write(to: filename)
                
                print(filename)
                path[imageName] = filename
                
            } catch let error {
                print("something went wrong: \(error)")
            }
            
        }
    }
    
    func get(name: String) -> UIImage? {
        
//        if let urlPath = path[name] {
//            let image = UIImage(contentsOfFile: urlPath.path)
//            return image
//        }
        
        do {
            let documents = try? getDocumentsDirectory()
            
            let filename = documents!.appendingPathComponent(name)
            let image = UIImage(contentsOfFile: filename.path())
            
            print(filename)
            return image
        } catch let error {
            print("something went wrong: \(error)")
        }
        
        return nil
    }
    
}

extension ImageMemory {
    private static var imageMemory = ImageMemory()
    static func getImageMemory() -> ImageMemory {
        return imageMemory
    }
}

extension ImageCache {
    private static var imageCache = ImageCache()
    static func getImageCache() -> ImageCache {
        return imageCache
    }
}
