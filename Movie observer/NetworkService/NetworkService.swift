//
//  NetworkService.swift
//  Movie observer
//
//  Created by Dmitry Sachkov on 02.06.2021.
//

import Foundation
import UIKit

class NetworkService {
    
    static let shared = NetworkService()
    var imageCache = NSCache<NSString, UIImage>()
    
    // MARK: - Fetch Data
    func fetchData<T: Decodable>(urlStr: String, memberType: T.Type, completionHandler: @escaping (T) -> ()) {
        guard let url = URL(string: urlStr) else { return }
        URLSession.shared.dataTask(with: url) {data, _, error in
            DispatchQueue.main.async {
                guard let data = data else { return }
                do {
                    let json = try JSONDecoder().decode(T.self, from: data)
                    completionHandler(json)
                }
                catch let jsonError {
                    print("Failed to decode json \(jsonError)")
                }
            }
        }.resume()
    }
    
    // MARK: - Get image data
    func getImageAlbum(urlStr: String, completion: @escaping ((UIImage?) -> Void)) {
        
        guard let url = URL(string: urlStr) else { return }
        
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
            completion(cachedImage)
        } else {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
            //Handle Error
                if let error = error {
                    print("Data Task Error: \(error.localizedDescription)")
                return
            }
            guard let image = UIImage(data: data!) else { return }
            self.imageCache.setObject(image, forKey: url.absoluteString as NSString)
            DispatchQueue.main.async {
                completion(image)
                }
            }.resume()
        }
    }
}
