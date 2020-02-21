//
//  EpisodeCollectionViewCell.swift
//  Druwa
//
//  Created by leeyang on 31/01/2020.
//  Copyright © 2020 leeyang. All rights reserved.
//

import UIKit
import Kingfisher

class EpisodeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var imageVIew: UIImageView!
    @IBOutlet weak var productionName: UILabel!
    @IBOutlet weak var dramaName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = .gray400
        backView.backgroundColor = .gray300
        productionName.textColor = .gray050
        productionName.font = .systemFont(ofSize: 12.0)
        dramaName.textColor = .gray0
        dramaName.font = .systemFont(ofSize: 14.0)
    }

    func configuationInit(product: String, drama: String, imageURL: String) {
        productionName.text = product
        dramaName.text = drama
        imageVIew.kf.setImage(with: URL(string:imageURL)!)
    }
}
