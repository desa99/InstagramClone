//
//  SignInHeaderView.swift
//  InstagramClone
//
//  Created by Desanka MIlakovic on 6.5.21..
//

import UIKit

class SignInHeaderView: UIView {
    
    private var gradientLayer:CALayer?
    
    private let imageView: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "logo-signIn")
       // image.backgroundColor = .red
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        createGradient()
        addSubview(imageView)
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func createGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.systemBlue.cgColor, UIColor.systemRed.cgColor]
        gradientLayer.frame = layer.bounds
        layer.addSublayer(gradientLayer)
        self.gradientLayer = gradientLayer
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer?.frame = layer.bounds
        imageView.frame = CGRect(x: width/4, y: 20, width: width/2, height: height-40)
       
    }
}
