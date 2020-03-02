//
//  SearchViewModel.swift
//  Movie
//
//  Created by Bai xinrui on 2/24/20.
//  Copyright © 2020 Bai xinrui. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

class SearchViewModel {
    weak var delegate: SearchViewModelDelegate?
    var movies = [Movie]()
    var movieDetailCache: MovieDetailCache
    let disposeBag = DisposeBag()
    
    lazy var movieRepo: MovieRepository = {
        let repo = MovieDefaultRepository()
        let cache = MovieDefaultCache()
        return MovieRepoCacheDecorator(inner: repo, cache: cache)
    }()
    
    init(movieDetailCache: MovieDetailCache) {
        self.movieDetailCache = movieDetailCache
    }
    
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
        movieRepo.get(identifier: keyword)
            .observeOn(MainScheduler.instance)
            .subscribe(
                onSuccess: { [weak self] bunchOfMovies in
                    guard let self = self else { return }
                    guard let delegate = self.delegate else { return }
                    self.movies = bunchOfMovies
                    delegate.onMovieLoadComplete()
                },
                onError: { _ in
                    print("search keyword faild on searchViewModel")
                })
        .disposed(by: disposeBag)
    }
    
    func getMovieDetailsCache() -> MovieDetailCache {
        return movieDetailCache
    }
}

// private function
extension SearchViewModel {
    private func clearMovies() {
        movies = []
    }
}
