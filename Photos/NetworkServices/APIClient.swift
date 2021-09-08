//
//  APIClient.swift
//  Photos
//
//  Created by Casandra Grullon on 9/8/21.
//

import Foundation

class APIClient {
    static func fetchPhotos(completion: @escaping(Result<[Photo], Error>) -> ()) {
        let endpoint = "http://jsonplaceholder.typicode.com/photos"
        guard let url = URL(string: endpoint) else { return }
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let results = try JSONDecoder().decode([Photo].self, from: data)
                    completion(.success(results))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        dataTask.resume()
    }
}
