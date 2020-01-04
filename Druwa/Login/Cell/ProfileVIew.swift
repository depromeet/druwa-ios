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
        imageView.image = UIImage(named: "art")
        return imageView
    }()
    
    var textLabel: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = .black
        label.text = "프로필"
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .red
        addSubview(profileImageView)
        addSubview(textLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        profileImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(4.0)
        }
        textLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-4.0)
            $0.top.equalTo(profileImageView.snp.bottom).offset(4.0)
        }
    }
}
