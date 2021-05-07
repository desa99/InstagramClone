//
//  IGTextField.swift
//  InstagramClone
//
//  Created by Desanka MIlakovic on 6.5.21..
//

import UIKit

class IGTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        leftViewMode = .always
        autocorrectionType = .no
        layer.borderWidth = 1
        layer.cornerRadius = 8
        layer.borderColor = UIColor.secondaryLabel.cgColor
        backgroundColor = .secondarySystemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
