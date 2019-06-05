//
//  CustomCollectionViewCell.swift
//  CollectionView
//
//  Created by Thiago B Claramunt on 04/06/19.
//  Copyright © 2019 Thiago B Claramunt. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(name: String, image: String) {
        self.nameLabel.text = name
    }
}
