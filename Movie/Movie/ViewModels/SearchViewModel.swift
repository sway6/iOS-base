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
    private var movies = [Movie]()
    
    init() {}
    
    func numberOfMovies() -> Int {
        return movies.count
    }
    
    func getMovie(at indexPath: IndexPath) -> Movie? {
        guard indexPath.row < movies.count else {
            return nil
        }
        return movies[indexPath.row]
    }
    
    func searchMovie(by keyword: String) {
        clearMovies()
        let fetchMoviEndPoint = FetchMovieGroups(keyword: keyword)
        
        // Fetch movies based on keywords
        AF.request(fetchMoviEndPoint.getPath(), method: .get)
            .responseJSON  { [weak self] response in
                guard let self = self else {
                    return
                }
                if let status = response.response?.statusCode {
                    switch(status){
                    case 200:
                        print("fetch movies success")
                    default:
                        print("error with response status: \(status)")
                    }
                }
                // decode JSON value
                if let result = response.value {
                    let jsonDict = result as! NSDictionary
                    guard let jsonArray = jsonDict["results"] as? [[String: Any]] else {
                          return
                    }
                    jsonArray.forEach {
                        let id = $0["id"] as? Int ?? 0
                        let title = $0["name"] as? String ?? ""
                        self.movies.append(Movie(id: "\(id)", title: title))
                    }
                }
                
                // refresh the movie list UI
                DispatchQueue.main.async {
                    guard let delegate = self.delegate else {
                        return
                    }
                    delegate.onMovieLoadComplete()
                }
        }
    }
}

// private function
extension SearchViewModel {
    private func clearMovies() {
        movies = []
    }
}
