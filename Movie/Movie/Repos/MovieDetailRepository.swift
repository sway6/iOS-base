//
//  MovieDetailRepository.swift
//  Movie
//
//  Created by Bai xinrui on 2/28/20.
//  Copyright © 2020 Bai xinrui. All rights reserved.
//

import Foundation

protocol MovieDetailRepository {
    func getAll() -> [MovieDetail]
    func get(identifier: Int, completion: ([MovieDetail]) -> Void)
}