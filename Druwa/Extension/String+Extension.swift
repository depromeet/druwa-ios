//
//  String+Extension.swift
//  Druwa
//
//  Created by leeyang on 02/02/2020.
//  Copyright © 2020 leeyang. All rights reserved.
//

import Foundation

extension NSMutableAttributedString{
    func setColorForText(_ textToFind: String, with color: UIColor) {
        let range = self.mutableString.range(of: textToFind, options: .caseInsensitive)
        if range.location != NSNotFound {
            addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        }
    }
}
