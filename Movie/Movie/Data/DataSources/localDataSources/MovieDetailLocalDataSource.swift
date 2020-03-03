//
//  MovieDetailCache.swift
//  Movie
//
//  Created by Bai xinrui on 2/28/20.
//  Copyright © 2020 Bai xinrui. All rights reserved.
//

import Foundation
import RxSwift

protocol MovieDetailLocalDataSource {
    func get(id: String) -> Single<MovieDetail>
    func store(content: MovieDetail, for id: String)
    func isCacheValid(for id: String) -> Bool
}
