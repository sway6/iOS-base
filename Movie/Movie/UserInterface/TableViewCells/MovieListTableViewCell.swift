//
//  MovieListTableViewCell.swift
//  Movie
//
//  Created by Bai xinrui on 2/24/20.
//  Copyright © 2020 Bai xinrui. All rights reserved.
//

import UIKit

class MovieListTableViewCell: UITableViewCell {

    @IBOutlet weak var movieTitleLabel: UILabel!
    
    static let cellID = "movieListTableViewCell"
    
    override func prepareForReuse() {
        super.prepareForReuse()
        clearCell()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUpTitle(_ title: String) {
        movieTitleLabel.text = title
    }
    
}

// Private functions
extension MovieListTableViewCell {
    func clearCell() {
        movieTitleLabel.text = ""
    }
}
