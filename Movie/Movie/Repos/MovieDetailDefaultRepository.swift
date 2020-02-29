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
        var movieDetail = MovieDetail(imageURL: "", details: [])
        
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
                if let result = response.value {
                    guard let jsonDict = result as? NSDictionary else {
                        return
                    }
                    
                    if let imageURL = jsonDict["poster_path"] as? String {
                        movieDetail.imageURL = "\(Constants.imagePrefix)\(imageURL)"
                    } else {
                        movieDetail.imageURL = "https://image.tmdb.org/t/p/w500/rb5HHy0J4yZYlBA1tqL1akWo6WQ.jpg"
                    }
                    if let language = jsonDict["original_language"] as? String {
                        movieDetail.details.append(MovieInfoPair(infoType: "Language: ", content: language))
                    }
                    if let title = jsonDict["original_title"] as? String {
                        movieDetail.details.append(MovieInfoPair(infoType: "Title: ", content: title))
                    }
                    if let date = jsonDict["release_date"] as? String {
                        movieDetail.details.append(MovieInfoPair(infoType: "Date: ", content: date))
                    }
                    if let overview = jsonDict["overview"] as? String {
                        movieDetail.details.append(MovieInfoPair(infoType: "Overview: ", content: overview))
                    }
                }
                
                completion(movieDetail)
        }
        
    }
}
