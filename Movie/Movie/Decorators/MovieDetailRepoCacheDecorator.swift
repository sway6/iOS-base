//
//  MovieDetailRepoCacheDecorator.swift
//  Movie
//
//  Created by Bai xinrui on 2/29/20.
//  Copyright © 2020 Bai xinrui. All rights reserved.
//

import Foundation

class MovieDetailRepoCacheDecorator: MovieDetailDecorator {
    var remoteDataSource: MovieDetailRemoteDataSource
    var localDataSource: MovieDetailLocalDataSource
    
    init(remoteDataSource: MovieDetailRemoteDataSource, cache: MovieDetailLocalDataSource) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource = cache
    }
    
    func getAll() -> [MovieDetail] {
        return []
    }
    
    func get(identifier: String, completion: @escaping (MovieDetail) -> Void) {
        guard let cachedMovieDetail = localDataSource.get(id: identifier) else {
            return remoteDataSource.get(identifier: identifier) { [weak self] movieDetail in
                guard let self = self else {
                    return
                }
                self.localDataSource.store(content: movieDetail, for: identifier)
                completion(movieDetail)
            }
        }
        
        print("hit movie detail cache")
        completion(cachedMovieDetail)
    }
    
}
