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
    @IBOutlet weak var dramaButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = .gray400
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
