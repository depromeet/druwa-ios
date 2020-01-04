//
//  TitleCell.swift
//  Druwa
//
//  Created by leeyang on 27/12/2019.
//  Copyright © 2019 leeyang. All rights reserved.
//

import UIKit

class TitleCell: UITableViewCell {
    var titleString: String = "" {
        didSet {
            titleLabel.text = titleString
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = ""
    }
}
