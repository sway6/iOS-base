//
//  MockMovieDetailCache.swift
//  MovieTests
//
//  Created by Bai xinrui on 2/29/20.
//  Copyright © 2020 Bai xinrui. All rights reserved.
//

import Foundation
@testable import Movie
@testable import RxSwift

class MockMovieDetailCache: MovieDetailLocalDataSource {
    var testDict: [String: MovieDetail] = [:]
    
    func get(id: String) -> Single<MovieDetail> {
        return Single.just(MovieDetail())
    }
    
    func store(content: MovieDetail, for id: String) {
        testDict[id] = content
    }
    
    func isCacheValid(for id: String) -> Bool {
        return true
    }
}
