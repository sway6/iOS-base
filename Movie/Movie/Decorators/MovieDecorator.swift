//
//  MovieDecorator.swift
//  Movie
//
//  Created by Bai xinrui on 2/28/20.
//  Copyright © 2020 Bai xinrui. All rights reserved.
//

import Foundation

protocol MovieDecorator {
    var inner: MovieRepository { get }
}

extension MovieDecorator {
    func get(identifier: String, completion: ([Movie]) -> Void) {
        inner.get(identifier: identifier, completion: completion)
    }
}
