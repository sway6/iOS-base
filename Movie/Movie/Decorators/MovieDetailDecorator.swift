//
//  MovieDetailDecorator.swift
//  Movie
//
//  Created by Bai xinrui on 2/29/20.
//  Copyright © 2020 Bai xinrui. All rights reserved.
//

import Foundation

protocol MovieDetailDecorator: MovieDetailRepository {
    var inner: MovieDetailRepository { get }
}
