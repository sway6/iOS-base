//
//  MovieDetailRepoCacheDecorator.swift
//  Movie
//
//  Created by Bai xinrui on 2/29/20.
//  Copyright © 2020 Bai xinrui. All rights reserved.
//

import Foundation

class MovieDetailRepoCacheDecorator: MovieDetailDecorator {
    var cache: MovieDetailCache
    var inner: MovieDetailRepository
    
    init(inner: MovieDetailRepository, cache: MovieDetailCache) {
        self.inner = inner
        self.cache = cache
    }
    
    func getAll() -> [MovieDetail] {
        return []
    }
    
    func get(identifier: String, completion: @escaping (MovieDetail) -> Void) {
        guard let cachedMovieDetail = cache.get(id: identifier) else {
            return inner.get(identifier: identifier) { [weak self] movieDetail in
                guard let self = self else {
                    return
                }
                self.cache.store(content: movieDetail, for: identifier)
                completion(movieDetail)
            }
        }
        
        completion(cachedMovieDetail)
    }
    
}
