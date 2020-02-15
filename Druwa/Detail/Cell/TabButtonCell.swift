//
//  TabButtonCell.swift
//  Druwa
//
//  Created by 양혜리 on 07/02/2020.
//  Copyright © 2020 leeyang. All rights reserved.
//

import UIKit

class TabButtonCell: UITableViewCell {

    @IBOutlet weak var commentButtton: TapButton!
    @IBOutlet weak var reviewButton: TapButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        commentButtton.setTitleColor(.gray0, for: .normal)
        reviewButton.setTitleColor(.gray0, for: .normal)
        commentButtton.titleLabel?.font = .boldSystemFont(ofSize: 14.0)
        reviewButton.titleLabel?.font = .boldSystemFont(ofSize: 14.0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
