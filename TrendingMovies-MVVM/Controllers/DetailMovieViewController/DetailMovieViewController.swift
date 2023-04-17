//
//  DetailMovieViewController.swift
//  TrendingMovies-MVVM
//
//  Created by Nalinda Wickramarathna on 2023-04-16.
//

import UIKit

class DetailMovieViewController: UIViewController {

    //IBOutlets:
    @IBOutlet weak var lblMovieTitle: UILabel!
    
    //View Model
    var viewModel: DetailMovieViewModel
    
    init(viewModel: DetailMovieViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "DetailMovieViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureView()
    }

    func configureView() {
        self.title = "Movie Details"
        self.lblMovieTitle.text = viewModel.movieTitle
    }
}
