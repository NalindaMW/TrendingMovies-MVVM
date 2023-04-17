//
//  DetailMovieViewModel.swift
//  TrendingMovies-MVVM
//
//  Created by Nalinda Wickramarathna on 2023-04-16.
//

import Foundation

class DetailMovieViewModel {
    
    var movie: Movie
    
    var movieTitle: String
    
    init(movie: Movie) {
        self.movie = movie
        
        self.movieTitle = movie.title
    }
}
