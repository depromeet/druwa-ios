//
//  PostTableViewCell.swift
//  Druwa
//
//  Created by leeyang on 31/01/2020.
//  Copyright © 2020 leeyang. All rights reserved.
//

import UIKit
import Kingfisher

class PostTableViewCell: UITableViewCell {
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var productionName: UILabel!
    @IBOutlet weak var DramaName: UILabel!
    @IBOutlet weak var likeCount: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var dramaButton: DruwaButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = .gray400
        productionName.font = .systemFont(ofSize: 12.0)
        productionName.textColor = .gray0
        DramaName.font = .boldSystemFont(ofSize: 20.0)
        DramaName.textColor = .gray0
        likeCount.font = .boldSystemFont(ofSize: 12.0)
        likeCount.textColor = .gray0
        summaryLabel.font = .systemFont(ofSize: 14.0, weight: .regular)
        summaryLabel.textColor = .gray050
        
        dramaButton.setTitle("드라마 보러가기", for: .selected)
        dramaButton.setTitle("드라마 보러가기", for: .normal)
        dramaButton.setTitle("드라마 보러가기", for: .disabled)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configurationInit(imageURL: String, productName: String, dramaName: String, like: String, summary: String, buttonName: String) {
        postImageView.kf.setImage(with: URL(string: imageURL)!)
        productionName.text = productName
        DramaName.text = dramaName
        likeCount.text = like
//        summaryLabel.text = summary
        dramaButton.setTitle(buttonName, for: .selected)
        dramaButton.setTitle(buttonName, for: .normal)
        dramaButton.setTitle(buttonName, for: .disabled)
        dramaButton.layer.cornerRadius = 4.0
        let attrString = NSMutableAttributedString(string: summary)
         let paragraphStyle = NSMutableParagraphStyle()
         paragraphStyle.lineSpacing = 5
         attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
         summaryLabel.attributedText = attrString
    }
}
