//
//  UIImageViewExtenison.swift
//  Movie
//
//  Created by Bai xinrui on 2/25/20.
//  Copyright © 2020 Bai xinrui. All rights reserved.
//

import UIKit
import Foundation

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
