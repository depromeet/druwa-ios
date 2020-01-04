
//
//  ButtonView.swift
//  Druwa
//
//  Created by leeyang on 01/01/2020.
//  Copyright © 2020 leeyang. All rights reserved.
//

import UIKit
import SnapKit

class ButtonView: UIView {
    
    var button: UIButton = {
        let button: UIButton = UIButton(type: .custom)
        button.backgroundColor = .red
        button.setTitle("회원가입하기", for: .normal)
        button.setTitle("회원가입하기", for: .highlighted)
        button.backgroundColor = .green
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addSubview(button)
    }
       
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    override func layoutSubviews() {
        super.layoutSubviews()
        button.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
//            $0.center.equalToSuperview()
//            $0.top.bottom.equalToSuperview()
            $0.height.equalTo(45.0)
        }
    }
}
