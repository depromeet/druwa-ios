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
        setupButton()
    }
      
    
    private func setupButton() {
        titleLabel?.font = .boldSystemFont(ofSize: 20.0)
        setTitleColor(.gray050, for: .disabled)
        setTitleColor(.gray0, for: .normal)
        setTitleColor(.gray0, for: .selected)
        setBackgroundColor(color: .gray300, forUIControlState: .disabled)
        setBackgroundColor(color: .main400, forUIControlState: .normal)
        setBackgroundColor(color: .sub500, forUIControlState: .selected)
        layer.masksToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }

    var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable public var cornerRadius: CGFloat = 8.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
}

class FooterButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupButton()
    }
      
    
    private func setupButton() {
        titleLabel?.font = .systemFont(ofSize: 16.0)
        setTitleColor(UIColor(red: 80.0/255.0, green: 80.0/255.0, blue: 80.0/255.0, alpha: 1.0), for: .selected)
        setTitleColor(UIColor(red: 80.0/255.0, green: 80.0/255.0, blue: 80.0/255.0, alpha: 1.0), for: .normal)
        setBackgroundColor(color: .gray350, forUIControlState: .disabled)
        setBackgroundColor(color: .gray350, forUIControlState: .normal)
        setBackgroundColor(color: .gray350, forUIControlState: .selected)
    }
    
    
    var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable public var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
}

class TapButton: UIButton {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupButton()
    }
    
    private func setupButton() {
        titleLabel?.font = .systemFont(ofSize: 14.0, weight: .semibold)
        setTitleColor(.gray200, for: .normal)
        setTitleColor(.gray0, for: .selected)
        setBackgroundColor(color: .gray500, forUIControlState: .normal)
        setBackgroundColor(color: .gray400, forUIControlState: .selected)
    }
    
    var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable public var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
}
