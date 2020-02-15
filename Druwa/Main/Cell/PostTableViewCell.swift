//
//  PostTableViewCell.swift
//  Druwa
//
//  Created by leeyang on 31/01/2020.
//  Copyright © 2020 leeyang. All rights reserved.
//

import UIKit

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
        summaryLabel.font = .boldSystemFont(ofSize: 14.0)
        summaryLabel.textColor = .gray050
        dramaButton.setTitle("드라마 보러가기", for: .selected)
        dramaButton.setTitle("드라마 보러가기", for: .normal)
        dramaButton.setTitle("드라마 보러가기", for: .disabled)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
