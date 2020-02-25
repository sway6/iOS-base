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
    let viewModel = MovieDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MovieDetailViewController: MovieDetailViewModelDelegate {
    func movieDetailFetchingCompleted() {
        // todo: refresh UI
    }
}
