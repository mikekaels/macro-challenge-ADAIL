//
//  Button.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 27/10/21.
//

import UIKit

final class Button: UIButton {
    
    private let activityIndicator = UIActivityIndicatorView()
    
    var isLoading = false {
        didSet {
            if isLoading {
                activityIndicator.startAnimating()
            } else {
                activityIndicator.stopAnimating()
            }
            alpha = isLoading ? 0.8 : 1
            isUserInteractionEnabled = !isLoading
        }
    }
    
    convenience init(_ isMain: Bool = false) {
        self.init()
        
        if isMain {
//            backgroundColor = Asset
//                .Colors
//                .e42E2C
//                .color
//            setTitleColor(.white,
//                          for: .normal)
        } else {
            backgroundColor = .white
//            setTitleColor(Asset
//                            .Colors
//                            .e42E2C
//                            .color,
//                          for: .normal)
        }
    }
    
    override init(frame: CGRect =  .zero) {
        super.init(frame: frame)
        commonInit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        activityIndicator.frame = bounds
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layer.cornerRadius = rect.height / 2
        layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        activityIndicator.hidesWhenStopped = true
        addSubview(activityIndicator)
        
        
//        titleLabel?.font = FontFamily
//            .RedHatText
//            .medium
//            .font(size: 16)
    }
}
