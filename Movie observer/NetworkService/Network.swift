//
//  Network.swift
//  Movie observer
//
//  Created by Dmitry Sachkov on 05.06.2021.
//

import Foundation

class Network {
    static let shared = Network()
    
    private var dataTask: URLSessionDataTask?
    
    //MARK: - Get albums data
    func fetchData(url: String, completion: @escaping (Result<DataModels, Error>) -> Void) {
        guard let urlString = URL(string: url) else { return}
        
        //MARK: - URLSession
        dataTask = URLSession.shared.dataTask(with: urlString) { (data, response, error) in
            
           //Handle Error
            if let error = error {
                completion(.failure(error))
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            guard let response  = response as? HTTPURLResponse else {
                //Handle Error
                print("Empty Response")
                return
            }
            print("Response status code: \(response.statusCode)")
            guard let data = data else {
                print("Empty Data")
                return
            }
            do {
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(DataModels.self, from: data)
               //Back to the main thread
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                }
            }
            catch let error {
                completion(.failure(error))
            }
        }
        dataTask?.resume()
    }
}
