//
//  MovieDetailViewModel.swift
//  Movie
//
//  Created by Bai xinrui on 2/24/20.
//  Copyright © 2020 Bai xinrui. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import RxCocoa

class MovieDetailViewModel {
    weak var delegate: MovieDetailViewModelDelegate?
    private var movie: Movie
    private var movieDetail: MovieDetail
    
    lazy var movieDetailRepo: MovieDetailRepoCacheDecorator = {
        let repo = MovieDetailDefaultRemoteDataSource()
        let cache = MovieDetailDefaultLocalDataSource()
        return MovieDetailRepoCacheDecorator(remoteDataSource: repo, cache: cache)
    }()
    
    init(movie: Movie, movieDetailCache: MovieDetailLocalDataSource) {
        self.movie = movie
        self.movieDetail = MovieDetail()
        movieDetailRepo.localDataSource = movieDetailCache
    }
    
    func movieAvatar() -> URL? {
         return URL(string: movieDetail.imageURL)
    }
    
    func numberOfInfoDetails() -> Int {
        return movieDetail.details.count
    }
    
    func details(at indexPath: IndexPath) -> String {
        guard indexPath.row < movieDetail.details.count else {
            return ""
        }
        let infoPair = movieDetail.details[indexPath.row]
        return "\(infoPair.infoType)\(infoPair.content)"
    }
    
    func fetchMovieDetail() {
        movieDetailRepo.get(identifier: "\(movie.id)") { [weak self] movieDetail in
            guard let self = self else {
                return
            }
            self.movieDetail = movieDetail
            
            // refresh the movie detail UI
            DispatchQueue.main.async {
                guard let delegate = self.delegate else {
                    return
                }
                delegate.movieDetailFetchingCompleted()
            }
        }
    }
}