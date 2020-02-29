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
    private var viewModel = SearchViewModel(movieDetailCache: MovieDetailDefaultCache())
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        searchBox.delegate = self
        movieTableView.delegate = self
        movieTableView.dataSource = self
        let nib = UINib(nibName: "MovieListTableViewCell", bundle: nil)
        movieTableView.register(nib,
                                forCellReuseIdentifier: MovieListTableViewCell.cellID)
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        guard let keyword = searchBox.text else {
            return
        }
        viewModel.searchMovie(by: keyword)
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfMovies()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieListTableViewCell.cellID) as? MovieListTableViewCell else {
            return UITableViewCell()
        }
        
        cell.setUpTitle(viewModel.getMovie(at: indexPath)?.title ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let movie = viewModel.getMovie(at: indexPath) else {
            return
        }
        let detailViewModel = MovieDetailViewModel(movie: movie, movieDetailCache: viewModel.getMovieDetailsCache())
        let controller = MovieDetailViewController(viewModel: detailViewModel)
        self.present(controller, animated: true, completion: nil)
    }
}

extension SearchViewController: SearchViewModelDelegate {
    func onMovieLoadComplete() {
        movieTableView.reloadData()
    }
}
