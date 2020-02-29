//
//  MovieRepoCacheDecorator.swift
//  Movie
//
//  Created by Bai xinrui on 2/28/20.
//  Copyright © 2020 Bai xinrui. All rights reserved.
//

import Foundation

protocol MovieRepoCacheDecorator: MovieDecorator {
    var inner: MovieRepository { get }
    var cache: MovieCache { get }
}

extension MovieRepoCacheDecorator {
    func get(identifier: String, completion: ([Movie]) -> Void) {
        inner.get(identifier: identifier, completion: completion)
    }
}
