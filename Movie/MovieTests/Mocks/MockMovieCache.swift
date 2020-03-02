//
//  MockMovieCache.swift
//  MovieTests
//
//  Created by Bai xinrui on 2/29/20.
//  Copyright © 2020 Bai xinrui. All rights reserved.
//

import Foundation
@testable import Movie

class MockMovieCache: MovieCache {
    
    var testCache: [String: [Movie]] = [:]
    
    func get(id: String) -> [Movie]? {
        return testCache[id]
    }
    
    func store(content: [Movie], for id: String) {
        testCache[id] = content
    }
}
