//
//  MovieDefaultCache.swift
//  Movie
//
//  Created by Bai xinrui on 2/29/20.
//  Copyright © 2020 Bai xinrui. All rights reserved.
//

import Foundation

class MovieDefaultCache: MovieCache {
    var cache = [String: [Movie]]()
    
    func get(id: String) -> [Movie]? {
        return cache[id]
    }
    
    func store(content: [Movie], for id: String) {
        cache[id] = content
    }
}
