//
//  MovieDetailDefaultCache.swift
//  Movie
//
//  Created by Bai xinrui on 2/29/20.
//  Copyright © 2020 Bai xinrui. All rights reserved.
//

import Foundation
import RxSwift

class MovieDetailDefaultLocalDataSource: MovieDetailLocalDataSource {
    var cache = [String: MovieDetail]()
    
    func get(id: String) -> Single<MovieDetail> {
        let movieDetail = cache[id] ?? MovieDetail()
        return Single.just(movieDetail)
    }
    
    func store(content: MovieDetail, for id: String) {
        cache[id] = content
    }
    
    func isCacheValid(for id: String) -> Bool {
        return cache[id] != nil
    }
}
