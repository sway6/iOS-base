//
//  MovieDefaultRepository.swift
//  Movie
//
//  Created by Bai xinrui on 2/29/20.
//  Copyright © 2020 Bai xinrui. All rights reserved.
//

import Foundation
import Alamofire

class MovieDefaultRepository: MovieRepository {
    func getAll() -> [Movie] {
        return []
    }
    
    func get(identifier: String,  completion: @escaping ([Movie]) -> Void) {
        let movieEndPoint = FetchMovieGroups(keyword: identifier)
        var bunchOfMovies = [Movie]()
        
        // Fetch movies based on keywords
        AF.request(movieEndPoint.getPath(), method: .get)
            .responseJSON  { response in
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
                    let jsonDict = result as! NSDictionary
                    guard let jsonArray = jsonDict["results"] as? [[String: Any]] else {
                        return
                    }
                    jsonArray.forEach {
                        let id = $0["id"] as? Int ?? 0
                        let title = $0["name"] as? String ?? ""
                        bunchOfMovies.append(Movie(id: "\(id)", title: title))
                    }
                }
                
                completion(bunchOfMovies)
        }
    }
}
