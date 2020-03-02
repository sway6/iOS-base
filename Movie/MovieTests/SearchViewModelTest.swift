//
//  SearchViewModelTest.swift
//  MovieTests
//
//  Created by Bai xinrui on 2/29/20.
//  Copyright © 2020 Bai xinrui. All rights reserved.
//

import XCTest
@testable import Movie

class SearchViewModelTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testNumberOfMovies() {
        let viewModel = SearchViewModel(movieDetailCache: MockMovieDetailCache())
        
        let testCases : [([Movie], Int)] =
            [([movie1], 1),
             ([movie1, movie2], 2),
             ([movie1, movie2, movie3], 3),
             ([movie1, movie2, movie3, movie4], 4)]
        
        testCases.forEach {
            viewModel.movies = $0.0
            XCTAssertEqual(viewModel.numberOfMovies(), $0.1)
        }
    }
    
    func testGetMovie() {
        
    }
    
    func testSearchMovie() {
        
    }
    
    func testGetMovieDetailsCache() {
        
    }

}
