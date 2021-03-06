//
//  ImageLoader.swift
//  UsanovTestApp
//
//  Created by Алексей Усанов on 05.07.2020.
//  Copyright © 2020 Алексей Усанов. All rights reserved.
//

import Foundation
import UIKit

class ImageLoader {
    
    var task: URLSessionDownloadTask!
    var session: URLSession!
    var cache: NSCache<NSString, UIImage>!
    
    init() {
        session = URLSession.shared
        task = URLSessionDownloadTask()
        self.cache = NSCache()
    }
    
    func obtainImageWithPath(imagePath: String, completionHandler: @escaping (UIImage) -> ()) {
        if let image = self.cache.object(forKey: imagePath as NSString) {
            DispatchQueue.main.async {
                completionHandler(image)
            }
        } else {
            let placeholder = UIImage()
            DispatchQueue.main.async {
                completionHandler(placeholder)
            }
            if let url: URL = URL(string: imagePath) {
                task = session.downloadTask(with: url, completionHandler: { (location, response, error) in
                    if let data = try? Data(contentsOf: url) {
                        let img: UIImage! = UIImage(data: data)
                        self.cache.setObject(img, forKey: imagePath as NSString)
                        DispatchQueue.main.async {
                            completionHandler(img)
                        }
                    }
                })
            }
            task.resume()
        }
    }
}
