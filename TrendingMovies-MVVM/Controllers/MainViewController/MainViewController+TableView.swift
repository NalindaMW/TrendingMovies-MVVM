//
//  MainViewController+TableView.swift
//  TrendingMovies-MVVM
//
//  Created by Nalinda Wickramarathna on 2023-04-13.
//

import Foundation
import UIKit

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.backgroundColor = .clear
        
        self.registerCells()
    }
    
    func registerCells() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func reloadTapbleView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = self.cellDataSource[indexPath.row].title
        return cell
    }
    
    
}
