//
//  MockMovieDetailRepository.swift
//  MovieTests
//
//  Created by Bai xinrui on 2/29/20.
//  Copyright © 2020 Bai xinrui. All rights reserved.
//

import Foundation
@testable import Movie

let movieDetail1 = MovieDetail(imageURL: "u1", details: [])
let movieDetail2 = MovieDetail(imageURL: "u2", details: [])
let movieDetail3 = MovieDetail(imageURL: "u3", details: [])
let movieDetail4 = MovieDetail(imageURL: "u4", details: [])

class MockMovieDetailRepository: MovieDetailRepository {
    
    let testDict : [String : MovieDetail] =
        ["id1": movieDetail1,
         "id2": movieDetail2,
         "id3": movieDetail3,
         "id4": movieDetail4]
    
    func getAll() -> [MovieDetail] {
        return []
    }
    
    func get(identifier: String, completion: @escaping (MovieDetail) -> Void) {
        guard let movieDetail = testDict[identifier] else {
            return
        }
        completion(movieDetail)
    }
}
