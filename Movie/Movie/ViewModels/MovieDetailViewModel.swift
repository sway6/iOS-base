//
//  MovieDetailViewModel.swift
//  Movie
//
//  Created by Bai xinrui on 2/24/20.
//  Copyright © 2020 Bai xinrui. All rights reserved.
//

import Foundation
import Alamofire

class MovieDetailViewModel {
    weak var delegate: MovieDetailViewModelDelegate?
    private var movie: Movie
    private var movieDetail: MovieDetail
    
    init(movie: Movie) {
        self.movie = movie
        self.movieDetail = MovieDetail(imageURL: "", details: [])
    }
    
    func movieAvatar() -> URL? {
         return URL(string: movieDetail.imageURL)
    }
    
    func numberOfInfoDetails() -> Int {
        return movieDetail.details.count
    }
    
    func details(at indexPath: IndexPath) -> String {
        guard indexPath.row < movieDetail.details.count else {
            return ""
        }
        let infoPair = movieDetail.details[indexPath.row]
        return "\(infoPair.infoType)\(infoPair.content)"
    }
    
    func fetchMovieDetail() {
        let getMovieDetailEndPoint = GetMovieDetail(movieID: movie.id)
        
        // Fetch movies based on keywords
        AF.request(getMovieDetailEndPoint.getPath(), method: .get)
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
                        self.movieDetail.imageURL = "\(Constants.imagePrefix)\(imageURL)"
                    } else {
                        self.movieDetail.imageURL = "https://image.tmdb.org/t/p/w500/rb5HHy0J4yZYlBA1tqL1akWo6WQ.jpg"
                    }
                    if let language = jsonDict["original_language"] as? String {
                        self.movieDetail.details.append(MovieInfoPair(infoType: "Language: ", content: language))
                    }
                    if let title = jsonDict["original_title"] as? String {
                        self.movieDetail.details.append(MovieInfoPair(infoType: "Title: ", content: title))
                    }
                    if let date = jsonDict["release_date"] as? String {
                        self.movieDetail.details.append(MovieInfoPair(infoType: "Date: ", content: date))
                    }
                    if let overview = jsonDict["overview"] as? String {
                        self.movieDetail.details.append(MovieInfoPair(infoType: "Overview: ", content: overview))
                    }
                    
                }
                
                // refresh the movie list UI
                DispatchQueue.main.async {
                    guard let delegate = self.delegate else {
                        return
                    }
                    delegate.movieDetailFetchingCompleted()
                }
        }
    }
}
