//
//  SearchViewController.swift
//  Movie
//
//  Created by Bai xinrui on 2/24/20.
//  Copyright © 2020 Bai xinrui. All rights reserved.
//

import UIKit
import Foundation

class SearchViewController: UIViewController {
    @IBOutlet weak var searchBox: UISearchBar!
    @IBOutlet weak var movieTableView: UITableView!
    
    let viewModel = SearchViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension SearchViewController: SearchViewModelDelegate {
    func onMovieLoadComplete() {
        movieTableView.reloadData()
    }
}
