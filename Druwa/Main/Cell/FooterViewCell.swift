//
//  FooterViewCell.swift
//  Druwa
//
//  Created by leeyang on 03/02/2020.
//  Copyright © 2020 leeyang. All rights reserved.
//

import UIKit

class FooterViewCell: UITableViewCell {

    @IBOutlet weak var footerButton: DruwaButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = .gray400
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        footerButton.titleLabel?.text = ""
    }
    
}
