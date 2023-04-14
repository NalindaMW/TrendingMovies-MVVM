//
//  MainViewModel.swift
//  TrendingMovies-MVVM
//
//  Created by Nalinda Wickramarathna on 2023-04-13.
//

import Foundation

class MainViewModel {
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return 10
    }
    
    func getTrendingMovies() {
        APICaller.getTrendingMovies { result in
            switch result {
            case .success(let data):
                print("Top trending counts: \(data.results.count)")
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}
