//
//  HeaderLabel.swift
//  Druwa
//
//  Created by leeyang on 03/02/2020.
//  Copyright © 2020 leeyang. All rights reserved.
//

import UIKit

class HeaderLabel: UILabel {

    var padding : UIEdgeInsets = UIEdgeInsets(top: 0, left: 16.0, bottom: 0, right: 16.0)
    
    override func drawText(in rect: CGRect) {

        super.drawText(in: rect.inset(by: padding))
    }

    override func sizeThatFits(_ size: CGSize) -> CGSize
    {

        var adjSize = super.sizeThatFits(size)
        adjSize.width += padding.left + padding.right
        adjSize.height += padding.top + padding.bottom

        return adjSize
    }

}
