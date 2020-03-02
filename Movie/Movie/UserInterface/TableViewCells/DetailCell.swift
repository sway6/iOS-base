//
//  DetailCell.swift
//  Movie
//
//  Created by Bai xinrui on 2/25/20.
//  Copyright © 2020 Bai xinrui. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell {

    static let cellID = "detailCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        clear()
    }
    
    func setUpTitle(_ title: String) {
        titleLabel.text = title
    }
}

// private functions
extension DetailCell {
    func clear() {
        titleLabel.text = ""
    }
}
