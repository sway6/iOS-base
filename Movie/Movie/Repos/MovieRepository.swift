//
//  MovieRepository.swift
//  Movie
//
//  Created by Bai xinrui on 2/28/20.
//  Copyright © 2020 Bai xinrui. All rights reserved.
//

import Foundation

protocol MovieRepository {
    func getAll() -> [Movie]
    func get(identifier: String, completion: ([Movie]) -> Void)
}
