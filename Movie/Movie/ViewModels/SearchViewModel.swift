//
//  SearchViewModel.swift
//  Movie
//
//  Created by Bai xinrui on 2/24/20.
//  Copyright © 2020 Bai xinrui. All rights reserved.
//

import Foundation
import Alamofire

class SearchViewModel {
    weak var delegate: SearchViewModelDelegate?
    private var movies: [Movie]
    
    init() {
        movies = []
    }
    
    func numberOfMovies() -> Int {
        return movies.count
    }
    
    func searchMovie(by keyword: String) {
        
    }
}
