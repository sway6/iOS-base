//
//  MockMovieDetailCache.swift
//  MovieTests
//
//  Created by Bai xinrui on 2/29/20.
//  Copyright © 2020 Bai xinrui. All rights reserved.
//

import Foundation
@testable import Movie

class MockMovieDetailCache: MovieDetailCache {
    var testDict: [String: MovieDetail] = [:]
    
    func get(id: String) -> MovieDetail? {
        return testDict[id]
    }
    
    func store(content: MovieDetail, for id: String) {
        testDict[id] = content
    }
}
