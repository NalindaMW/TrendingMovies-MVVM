//
//  APICaller.swift
//  TrendingMovies-MVVM
//
//  Created by Nalinda Wickramarathna on 2023-04-15.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case canNotPassData
}

public class APICaller {
    
    static func getTrendingMovies(completion: @escaping (_ result: Result<TrendingMoviesModel, NetworkError>) -> Void) {
        
        let urlString = NetworkConstant.shared.serverAddress + "trending/movie/day?api_key=" + NetworkConstant.shared.apiKey
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.urlError))
            return
        }
        
        URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, error in
            
            if error == nil, let data = dataResponse {
                let resultData = try? JSONDecoder().decode(TrendingMoviesModel.self, from: data)
                if let result = resultData {
                    completion(.success(result))
                }
            } else {
                completion(.failure(.canNotPassData))
            }
        }.resume()
    }
}
