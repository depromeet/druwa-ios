//
//  HeaderViewCell.swift
//  Druwa
//
//  Created by leeyang on 03/02/2020.
//  Copyright © 2020 leeyang. All rights reserved.
//

import UIKit

class HeaderViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: HeaderLabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = .gray400
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = ""
    }
    
}
