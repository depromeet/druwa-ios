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
    
    private lazy var centerView: UIView = {
        let view: UIView = UIView(frame: .zero)
        view.backgroundColor = .clear
        addSubview(view)
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.textColor = .gray0
        label.font = .systemFont(ofSize: 17.0)
        centerView.addSubview(label)
        return label
    }()
    
    private lazy var titleButton: UIButton = {
        let button: UIButton = UIButton()
        button.titleLabel?.font = .systemFont(ofSize: 17.0)
        button.setTitleColor(.gray0, for: .normal)
        button.setTitleColor(.gray0, for: .selected)
        button.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        button.titleLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        button.imageView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        centerView.addSubview(button)
        return button
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .gray400
        configurationInit()
    }
    
    private func configurationInit() {
        centerView.snp.makeConstraints {
            $0.height.centerX.centerY.equalToSuperview()
            $0.width.equalTo(50.0)
        }
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
    
    func configurationTitleButton(title: String, size: CGFloat, color: UIColor, image: String, target: Any) {
        titleButton.setTitle(title, for: .normal)
        titleButton.setTitle(title, for: .selected)
        titleButton.titleLabel?.font = .systemFont(ofSize: size)
        titleButton.setTitleColor(color, for: .normal)
        titleButton.setTitleColor(color, for: .selected)
        rightButton.setImage(UIImage(named: image) , for: .normal)
        rightButton.setImage(UIImage(named: image) , for: .selected)
        titleButton.addTarget(target, action: #selector(pressedTitleButton), for: .touchUpInside)
        titleButton.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    
    @objc func pressedLeftButton(sender: UIButton) {
        print("navigation bar click")
    }
    
    @objc func pressedRightButton(sender: UIButton) {
        print("navigation bar click2")
    }
    
    @objc func pressedTitleButton(sender: UIButton) {
        print("navigation bar click")
    }

}
