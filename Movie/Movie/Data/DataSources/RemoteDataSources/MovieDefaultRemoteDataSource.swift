//
//  MovieDefaultRepository.swift
//  Movie
//
//  Created by Bai xinrui on 2/29/20.
//  Copyright © 2020 Bai xinrui. All rights reserved.
//

import Foundation
import RxSwift
import RxAlamofire

class MovieDefaultRemoteDataSource: MovieRemoteDataSource {
    func getAll() -> [Movie] {
        return []
    }
    
    func get(identifier: String) -> Single<[Movie]> {
        let movieEndPoint = FetchMovieGroups(keyword: identifier)
        return
            RxAlamofire
                .requestJSON(.get, movieEndPoint.getPath())
                .asSingle()
                .map { [weak self] (r, json) -> [Movie] in
                    guard let self = self else {
                        return [Movie]()
                    }
                    
                    let status = r.statusCode
                    switch(status) {
                    case 200:
                        print("fetch movies success")
                    default:
                        print("error with response status: \(status)")
                    }
                    
                    // decode JSON value
                    guard let jsonDict = json as? [String : Any] else {
                        return [Movie]()
                    }
                    guard let jsonArray = jsonDict["results"] as? [Any] else {
                        return [Movie]()
                    }
                    
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: jsonArray, options: [])
                        let bunchOfMovies = try JSONDecoder().decode([Movie].self, from: jsonData)
                        return bunchOfMovies
                    } catch {
                        print("fail to decode Mives from http response")
                    }
                    return [Movie]()
        }
    }
}
