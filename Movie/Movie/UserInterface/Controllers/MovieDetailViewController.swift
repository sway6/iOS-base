//
//  MovieDetailViewController.swift
//  Movie
//
//  Created by Bai xinrui on 2/24/20.
//  Copyright © 2020 Bai xinrui. All rights reserved.
//

import UIKit
import Foundation

class MovieDetailViewController: UIViewController {
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var detailTableView: UITableView!
    
    var viewModel: MovieDetailViewModel
    
    init(viewModel: MovieDetailViewModel) {
         self.viewModel = viewModel
         super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieImageView.contentMode = .scaleToFill
        viewModel.delegate = self
        detailTableView.delegate = self
        detailTableView.dataSource = self
        detailTableView.rowHeight = UITableViewAutomaticDimension
        detailTableView.estimatedRowHeight = 600
        let nib = UINib(nibName: "DetailCell", bundle: nil)
        detailTableView.register(nib,
                                forCellReuseIdentifier: DetailCell.cellID)
        viewModel.fetchMovieDetail()
    }
}

extension MovieDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfInfoDetails()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailCell.cellID) as? DetailCell else {
            return UITableViewCell()
        }
        
        cell.setUpTitle(viewModel.details(at: indexPath))
        return cell
    }
}

extension MovieDetailViewController: MovieDetailViewModelDelegate {
    func movieDetailFetchingCompleted() {
        if let avatarURL = viewModel.movieAvatar() {
            movieImageView.load(url: avatarURL)
        } else {
            movieImageView.backgroundColor = UIColor.black
        }
        detailTableView.reloadData()
    }
}

