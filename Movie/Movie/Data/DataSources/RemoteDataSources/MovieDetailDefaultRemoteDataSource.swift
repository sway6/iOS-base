//
//  MovieDetailDefaultRepository.swift
//  Movie
//
//  Created by Bai xinrui on 2/29/20.
//  Copyright © 2020 Bai xinrui. All rights reserved.
//

import Foundation
import RxSwift
import RxAlamofire

class MovieDetailDefaultRemoteDataSource: MovieDetailRemoteDataSource {
    func getAll() -> [MovieDetail] {
        return []
    }
    
    func get(identifier: String) -> Single<MovieDetail> {
        let movieDetailEndPoint = GetMovieDetail(movieID: identifier)
        var movieDetail = MovieDetail()
        return
            RxAlamofire.requestJSON(.get, movieDetailEndPoint.getPath())
                .asSingle()
                .map { [weak self] (r, json) -> MovieDetail in
                    guard let self = self else {
                        return MovieDetail()
                    }
                    let status = r.statusCode
                    
                    switch(status){
                    case 200:
                        print("fetch movies success")
                    default:
                        print("error with response status: \(status)")
                    }
                    
                    // decode JSON value
                    guard let jsonDict = json as? [String : Any] else {
                        return MovieDetail()
                    }
                    
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: jsonDict, options: [])
                        let movieDetail = try JSONDecoder().decode(MovieDetail.self, from: jsonData)
                        return movieDetail
                    } catch {
                        print("fail to decode Mives from http response")
                    }
                    return movieDetail
        }
    }
}
