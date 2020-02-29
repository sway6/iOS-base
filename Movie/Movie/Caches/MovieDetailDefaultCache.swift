//
//  MovieDetailDefaultCache.swift
//  Movie
//
//  Created by Bai xinrui on 2/29/20.
//  Copyright © 2020 Bai xinrui. All rights reserved.
//

import Foundation

class MovieDetailDefaultCache: MovieDetailCache {
    var cache = [String: MovieDetail]()
    
    func get(id: String) -> MovieDetail? {
        return cache[id]
    }
    
    func store(content: MovieDetail, for id: String) {
        cache[id] = content
    }
}
