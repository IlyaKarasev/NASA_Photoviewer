//
//  APIManager.swift
//  NASA_photoviewer
//
//  Created by ILYA Karasev on 23.03.2021.
//

import Foundation

class APIManager {
    
    //MARK: get last photos from Curiosity rover
    func getPhotos(completion: ((Result<PhotoResponse, Error>) -> Void)?) {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.nasa.gov"
        urlComponents.path = "/mars-photos/api/v1/rovers/curiosity/latest_photos/"
        urlComponents.queryItems = [
            URLQueryItem(name: "page", value: "1"),
            URLQueryItem(name: "api_key", value: "bOjyJcXMb7zq6dSf2kgnZ59FuN49Pdl0VjCih7uv")
        ]
        
        guard let url = urlComponents.url else {
            print("__error: Could not create URL from components")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (responseData, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    completion?(.failure(error))
                } else if let jsonData = responseData {
                    do {
                        let photos = try JSONDecoder().decode(PhotoResponse.self, from: jsonData)
                        completion?(.success(photos))
                    } catch {
                        completion?(.failure(error))
                    }
                }
            }
        }
        task.resume()
    }
}
