//
//  NavigationBar.swift
//  Druwa
//
//  Created by leeyang on 01/02/2020.
//  Copyright © 2020 leeyang. All rights reserved.
//

import UIKit
import Kingfisher
import SnapKit

class NavigationBar: UIView {
    
    private lazy var leftButton: UIButton = {
        let button: UIButton = UIButton()
        addSubview(button)
        return button
    }()
    
    private lazy var rightButton: UIButton = {
        let button: UIButton = UIButton()
        addSubview(button)
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = .gray0
        label.font = .systemFont(ofSize: 17.0)
        addSubview(label)
        return label
    }()
    
//    convenience init() {
//        self.init()
//    }
//
//    init(left: String, right: String, title: String) {
//        super.init(frame: .zero)
//        self.leftButton.imageView?.image = UIImage(named: left)
//        self.rightButton.imageView?.image = UIImage(named: right)
//        self.titleLabel.text = title
//    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .gray400
    }
    
    func configurationLeftButton(image: String, target: Any) {
        leftButton.setImage(UIImage(named: image) , for: .normal)
        leftButton.setImage(UIImage(named: image) , for: .selected)
        leftButton.addTarget(target, action: #selector(pressedLeftButton), for: .touchUpInside)
        leftButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16.0)
            $0.centerY.equalToSuperview()
        }
    }
    
    func configurationRightButton(image: String, target: Any) {
        rightButton.setImage(UIImage(named: image) , for: .normal)
        rightButton.setImage(UIImage(named: image) , for: .selected)
        rightButton.addTarget(target, action: #selector(pressedRightButton), for: .touchUpInside)
        rightButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-16.0)
            $0.centerY.equalToSuperview()
        }
    }
    
    func configurationTitle(title: String, size: CGFloat, color: UIColor) {
        titleLabel.text = title
        titleLabel.font = .systemFont(ofSize: size)
        titleLabel.textColor = color
        titleLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    @objc func pressedLeftButton(sender: UIButton) {
        print("navigation bar click")
    }
    
    @objc func pressedRightButton(sender: UIButton) {
        print("navigation bar click2")
    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
}
