//
//  MovieDetailDefaultRepository.swift
//  Movie
//
//  Created by Bai xinrui on 2/29/20.
//  Copyright © 2020 Bai xinrui. All rights reserved.
//

import Foundation
import Alamofire

class MovieDetailDefaultRepository: MovieDetailRepository {
    func getAll() -> [MovieDetail] {
        return []
    }
    
    func get(identifier: String, completion: @escaping (MovieDetail) -> Void) {
        let movieDetailEndPoint = GetMovieDetail(movieID: identifier)
        var movieDetail = MovieDetail()
        
        AF.request(movieDetailEndPoint.getPath(), method: .get)
            .responseJSON  { [weak self] response in
                guard let self = self else {
                    return
                }
                if let status = response.response?.statusCode {
                    switch(status){
                    case 200:
                        print("fetch movies success")
                    default:
                        print("error with response status: \(status)")
                    }
                }
                // decode JSON value
                if let jsonData = response.data {
                    do {
                        movieDetail = try JSONDecoder().decode(MovieDetail.self, from: jsonData)
                    } catch {
                        print("fail to decode MivesDetail from http response")
                    }
                }
                
                completion(movieDetail)
        }
        
    }
}
