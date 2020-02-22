//
//  MainTopCell.swift
//  Druwa
//
//  Created by leeyang on 31/01/2020.
//  Copyright © 2020 leeyang. All rights reserved.
//

import UIKit

class MainTopCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var gradationView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = .gray400
        pageControl.pageIndicatorTintColor = .gray100
        pageControl.currentPageIndicatorTintColor = .main200
        collectionView.backgroundColor = .clear
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func changeCurrentPage(_ index: Int) {
        pageControl.currentPage = index
    }
}

