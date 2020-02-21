//
//  FooterViewCell.swift
//  Druwa
//
//  Created by leeyang on 03/02/2020.
//  Copyright © 2020 leeyang. All rights reserved.
//

import UIKit

class FooterViewCell: UITableViewCell {

    @IBOutlet weak var footerButton: FooterButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = .gray400
        footerButton.setTitleColor(UIColor(red: 80.0/255.0, green: 80.0/255.0, blue: 80.0/255.0, alpha: 1.0), for: .selected)
        footerButton.setTitleColor(UIColor(red: 80.0/255.0, green: 80.0/255.0, blue: 80.0/255.0, alpha: 1.0), for: .normal)
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configurationButtonTitle(title: String) {
        footerButton.setTitle(title, for: .normal)
        footerButton.setTitle(title, for: .selected)
        footerButton.setTitle(title, for: .disabled)
    }
    
}
