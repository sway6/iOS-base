//
//  MovieRepoCacheDecorator.swift
//  Movie
//
//  Created by Bai xinrui on 2/28/20.
//  Copyright © 2020 Bai xinrui. All rights reserved.
//

import Foundation

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
    
    func get(identifier: String, completion: @escaping ([Movie]) -> Void) {
        guard let cachedMovie = cache.get(id: identifier) else {
            return inner.get(identifier: identifier) { [weak self] movieGroups in
                guard let self = self else {
                    return
                }
                self.cache.store(content: movieGroups, for: identifier)
                completion(movieGroups)
            }
        }
        print("hit movie cache")
        completion(cachedMovie)
    }
}
