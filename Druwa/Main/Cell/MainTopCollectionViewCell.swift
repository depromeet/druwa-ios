//
//  MainTopCollectionViewCell.swift
//  Druwa
//
//  Created by leeyang on 31/01/2020.
//  Copyright © 2020 leeyang. All rights reserved.
//

import UIKit

class MainTopCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var dramaName: UILabel!
    @IBOutlet weak var genreName: UILabel!
    @IBOutlet weak var producitonName: UILabel!
    @IBOutlet weak var episodeName: UILabel!
    @IBOutlet weak var gradationView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = .gray400
        dramaName.textColor = .gray0
        dramaName.font = .systemFont(ofSize: 12.0)
        producitonName.textColor = .gray0
        producitonName.font = .boldSystemFont(ofSize: 24.0)
        genreName.textColor = .gray050
        genreName.layer.borderColor = UIColor.gray300.cgColor
        genreName.layer.borderWidth = 1.0
        genreName.font = .systemFont(ofSize: 10.0)
        episodeName.textColor = .gray050
        episodeName.font = .systemFont(ofSize: 12.0)
        
        var colors = [UIColor]()
        colors.append(.clear)
        colors.append(.gray400)
        let gradientLayer = CAGradientLayer(frame: contentView.frame, colors: colors, startPoint: CGPoint(x: 0.5, y:0.3), endPoint: CGPoint(x:0.5, y:0.9))
        gradationView.image = gradientLayer.createGradientImage()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        dramaName.text = ""
        genreName.text = ""
        producitonName.text = ""
        episodeName.text = ""
    }
}
