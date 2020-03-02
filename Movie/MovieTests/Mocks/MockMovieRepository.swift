//
//  MockMovieRepository.swift
//  MovieTests
//
//  Created by Bai xinrui on 2/29/20.
//  Copyright © 2020 Bai xinrui. All rights reserved.
//

import Foundation
@testable import Movie

let movie1 = Movie(id: "1", title: "1 title")
let movie2 = Movie(id: "2", title: "2 title")
let movie3 = Movie(id: "3", title: "3 title")
let movie4 = Movie(id: "4", title: "4 title")

class MockMovieRepository: MovieRepository {
    let testDict: [String : [Movie]] =
        ["key1" : [movie1],
         "key2" : [movie1, movie2],
         "key3" : [movie1, movie2, movie3],
         "key4" : [movie1, movie2, movie3, movie4]]
    
    let bunchOfMovies = [movie1, movie2, movie3, movie4]
    
    func getAll() -> [Movie] {
        return bunchOfMovies
    }
    
    func get(identifier: String, completion: @escaping ([Movie]) -> Void) {
        guard let movies = testDict[identifier] else {
            return
        }
        completion(movies)
    }
}
