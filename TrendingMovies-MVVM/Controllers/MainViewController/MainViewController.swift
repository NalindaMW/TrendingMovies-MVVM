//
//  MainViewController.swift
//  TrendingMovies-MVVM
//
//  Created by Nalinda Wickramarathna on 2023-04-13.
//

import UIKit

class MainViewController: UIViewController {

    //@IBOutlets:
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //ViewModel:
    var viewModel: MainViewModel = MainViewModel()
    
    //Variables:
    var cellDataSource: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configView()
        self.bindViewModel()
        viewModel.getTrendingMovies()
    }

    func configView() {
        self.title = "Main View"
        
        self.setupTableView()
    }
    
    func bindViewModel() {
        self.viewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self, let isLoading = isLoading else {
                return
            }
            
            DispatchQueue.main.async {
                if isLoading {
                    self.activityIndicator.isHidden = false
                    self.activityIndicator.startAnimating()
                } else {
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.isHidden = true
                }
            }
        }
        
        self.viewModel.cellDataSource.bind { [weak self] movies in
            guard let self = self, let movies = movies else {
                return
            }
            
            self.cellDataSource = movies
            self.reloadTapbleView()
        }
    }

}
