//
//  DramaListCell.swift
//  Druwa
//
//  Created by leeyang on 24/01/2020.
//  Copyright © 2020 leeyang. All rights reserved.
//

import UIKit

class DramaListCell: UICollectionViewCell {

    @IBOutlet weak var dramaImageView: UIImageView!
    @IBOutlet weak var eposideName: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        eposideName.font = .systemFont(ofSize: 14.0)
        eposideName.textColor = .gray0
        titleLabel.font = .systemFont(ofSize: 14.0)
        titleLabel.textColor = .gray0
        contentView.backgroundColor = .gray500
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        dramaImageView.image = nil
        eposideName.text = nil
        titleLabel.text = nil
    }
}
