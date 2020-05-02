//
//  RecommendCell.swift
//  MyNetflix
//
//  Created by jeongminho on 2020/05/03.
//  Copyright © 2020 jeongminho. All rights reserved.
//

import UIKit

class RecommendCell: UICollectionViewCell {
    @IBOutlet weak var thumbnailImage: UIImageView!
    
    func updateUI(movie: DummyItem) {
        thumbnailImage.image = movie.thumbnail
    }
}
