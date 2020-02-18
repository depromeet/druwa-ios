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
               var colors = [UIColor]()
        colors.append(.clear)
        colors.append(UIColor(red: 1, green: 1, blue: 1, alpha: 0.5))
         let gradientLayer = CAGradientLayer(frame: contentView.frame, colors: colors, startPoint: CGPoint(x: 0.5, y:0), endPoint: CGPoint(x:0.5, y:1))
         gradationView.image = gradientLayer.createGradientImage()
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

