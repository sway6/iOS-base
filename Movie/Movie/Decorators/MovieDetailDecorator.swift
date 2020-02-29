//
//  MovieDetailDecorator.swift
//  Movie
//
//  Created by Bai xinrui on 2/28/20.
//  Copyright © 2020 Bai xinrui. All rights reserved.
//

import Foundation

protocol MovieDetailDecorator {
    var inner: MovieDetailRepository { get }
    var cache: MovieDetailCache { get }
}

extension MovieDetailDecorator {
    func get(identifier: Int, completion: ([MovieDetail]) -> Void) {
        inner.get(identifier: identifier, completion: completion)
    }
}
