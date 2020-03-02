//
//  MovieRepoCacheDecorator.swift
//  Movie
//
//  Created by Bai xinrui on 2/28/20.
//  Copyright © 2020 Bai xinrui. All rights reserved.
//

import Foundation
import RxSwift

class MovieRepoCacheDecorator: MovieDecorator {
    var remoteDataSource: MovieRemoteDataSource
    var localDataSource: MovieLocalDataSource
    
    init(remoteDataSource: MovieRemoteDataSource,
         cache: MovieLocalDataSource) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource = cache
    }
    
    func getAll() -> [Movie] {
        return []
    }
    
    func get(identifier: String) -> Single<[Movie]> {
        if localDataSource.isCacheValid(for: identifier) {
            return localDataSource.get(id: identifier)
        } else {
            return remoteDataSource.get(identifier: identifier)
                .do(onSuccess:{ [weak self] bunchOfMovies in
                    guard let self = self else {
                        return
                    }
                    self.localDataSource.store(content: bunchOfMovies, for: identifier)
                })
        }
    }
}
