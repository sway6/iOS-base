//
//  MovieDefaultCache.swift
//  Movie
//
//  Created by Bai xinrui on 2/29/20.
//  Copyright © 2020 Bai xinrui. All rights reserved.
//

import Foundation
import RxSwift

class MovieDefaultLocalDataSource: MovieLocalDataSource {
    var cache = [String: [Movie]]()
    
    func get(id: String) -> Single<[Movie]> {
        let bunchOfMovies = cache[id] ?? []
        return Single<[Movie]>.create{ single in
            print("hit movie cache success")
            single(.success(bunchOfMovies))
            return Disposables.create()
        }
    }
    
    func store(content: [Movie], for id: String) {
        cache[id] = content
    }
    
    func isCacheValid(for id: String) -> Bool {
        return cache[id] != nil
    }
}
