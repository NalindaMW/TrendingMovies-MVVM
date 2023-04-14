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
    
    //ViewModel:
    var viewModel: MainViewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configView()
        viewModel.getTrendingMovies()
    }

    func configView() {
        self.title = "Main View 1"
        
        self.setupTableView()
    }

}
