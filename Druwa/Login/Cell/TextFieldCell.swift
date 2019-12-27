//
//  TextFieldCell.swift
//  Druwa
//
//  Created by leeyang on 27/12/2019.
//  Copyright © 2019 leeyang. All rights reserved.
//

import UIKit

class TextFieldCell: UITableViewCell {

    var placeholder: String = "" {
        didSet {
            print(placeholder)
            textField.placeholder = placeholder
        }
    }
    @IBOutlet weak var textField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        textField.placeholder = ""
    }
}
