//
//  MovieRepoCacheDecorator.swift
//  Movie
//
//  Created by Bai xinrui on 2/28/20.
//  Copyright © 2020 Bai xinrui. All rights reserved.
//

import Foundation
import RxSwift

class MovieRepoCacheDecorator: MovieDecorator {
    var inner: MovieRepository
    var cache: MovieCache
    
    init(inner: MovieRepository, cache: MovieCache) {
        self.inner = inner
        self.cache = cache
    }
    
    func getAll() -> [Movie] {
        return []
    }
    
    func get(identifier: String) -> Single<[Movie]> {
        if cache.isCacheValid(for: identifier) {
            return cache.get(id: identifier)
        } else {
            return inner.get(identifier: identifier)
                .do(onSuccess:{ [weak self] bunchOfMovies in
                    guard let self = self else {
                        return
                    }
                    self.cache.store(content: bunchOfMovies, for: identifier)
                })
        }
    }
}
