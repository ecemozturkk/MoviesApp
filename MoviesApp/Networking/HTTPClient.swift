//
//  HTTPClient.swift
//  MoviesYoutube
//
//  Created by Ecem Öztürk on 29.06.2023.
//

import Foundation

public protocol HTTPClient {
    func sendRequest <T: Decodable> (endpoint: Endpoint,
                                     responseModel: T.Type,
                                     completion: @escaping (Result<T, RequestError>) -> Void )
}

public extension HTTPClient {
    func sendRequest <T: Decodable> (endpoint: Endpoint,
                                     responseModel: T.Type,
                                     completion: @escaping (Result<T, RequestError>) -> Void
    ) {
        let urlComponents = prepareURLComponents(with: endpoint)
        
        guard let url = urlComponents.url else {
            return completion(.failure(.invalidURL))
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.header
        
        if let body = endpoint.body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            do {
                guard let response = response as? HTTPURLResponse else {
                    return completion(.failure(.noResponse))
                }
                
                switch response.statusCode {
                case 200...299:
                    let decodedResponse = try JSONDecoder().decode(responseModel, from: data!)
                    return completion(.success(decodedResponse))
                case 401:
                    return completion(.failure(.unauthorized))
                default:
                    return completion(.failure(.unexpectedStatusCode))
                }
            } catch {
                return completion(.failure(.decode))
            }
        }
        .resume()
    }
    
    private func prepareURLComponents(with endpoint: Endpoint) -> URLComponents {
        var urlComponents = URLComponents()
        //urlcomponents'in parametre olarak gelen endpoint üzerinden doldurulması
        urlComponents.scheme = endpoint.scheme
        urlComponents.host = endpoint.host
        urlComponents.path = endpoint.path
        
        if let queryItems = endpoint.queryItems {
            urlComponents.queryItems = queryItems
        }
        
        return urlComponents
    }
}
