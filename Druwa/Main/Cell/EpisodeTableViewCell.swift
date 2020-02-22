//
//  EpisodeTableViewCell.swift
//  Druwa
//
//  Created by leeyang on 31/01/2020.
//  Copyright © 2020 leeyang. All rights reserved.
//

import UIKit

class EpisodeTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = .gray400
        collectionView.backgroundColor = .gray400
        selectionStyle = .none
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
//        collectionView.collectionViewLayout = nil
    }
}
