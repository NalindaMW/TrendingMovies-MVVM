//
//  MainViewModel.swift
//  TrendingMovies-MVVM
//
//  Created by Nalinda Wickramarathna on 2023-04-13.
//

import Foundation

class MainViewModel {
    
    var isLoading: Observable<Bool> = Observable(false)
    var cellDataSource: Observable<[Movie]> = Observable(nil)
    var dataSource: TrendingMoviesModel?
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return self.dataSource?.results.count ?? 0
    }
    
    func getTrendingMovies() {
        if self.isLoading.value ?? true {
            return
        }
        
        self.isLoading.value = true
        APICaller.getTrendingMovies { [weak self] result in
            self?.isLoading.value = false
            
            switch result {
            case .success(let data):
                print("Top trending counts: \(data.results.count)")
                self?.dataSource = data
                self?.mapCellData()
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func mapCellData() {
        self.cellDataSource.value = self.dataSource?.results ?? []
    }
}
