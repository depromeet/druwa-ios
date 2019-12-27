 //
//  ProfileVIew.swift
//  Druwa
//
//  Created by leeyang on 27/12/2019.
//  Copyright © 2019 leeyang. All rights reserved.
//

import UIKit
import SnapKit

class ProfileVIew: UIView {

    var profileImageView: UIImageView = {
        let imageView: UIImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        addSubview(profileImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImageView.snp.makeConstraints {
            $0.width.height.equalTo(40.0)
            $0.centerX.centerY.equalToSuperview()
        }
    }
}
