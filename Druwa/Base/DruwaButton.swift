//
//  DruwaButton.swift
//  Druwa
//
//  Created by leeyang on 03/02/2020.
//  Copyright © 2020 leeyang. All rights reserved.
//

import UIKit

class DruwaButton: UIButton {
    
    override func awakeFromNib() {
       super.awakeFromNib()
       //custom logic goes here
        setTitleColor(.gray050, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 16.0)
        titleLabel?.textAlignment = .center
    }
}
