//
//  IconCollectionViewCell.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 22/11/21.
//

import UIKit

class IconCollectionViewCell: UICollectionViewCell {
    let background = UIView()
        .configure { v in
            v.backgroundColor = .white
            v.layer.cornerRadius = 8
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let image: UIImageView = UIImageView()
        .configure { v in
            v.image = Asset.Icons.iFood.image
            v.translatesAutoresizingMaskIntoConstraints = false
            v.heightAnchor.constraint(equalToConstant: 30).isActive = true
            v.widthAnchor.constraint(equalToConstant: 30).isActive = true
        }
    
    let iconLabel: UILabel = UILabel()
        .configure { v in
            v.text = "Food"
            v.textAlignment = .center
            v.font = UIFont.systemFont(ofSize: 12, weight: .light)
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    func setupCell() {
        
        addSubview(background)
        background.topAnchor.constraint(equalTo: topAnchor).isActive = true
        background.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        background.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        background.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        
        background.addSubview(image)
        image.centerXAnchor.constraint(equalTo: background.centerXAnchor).isActive = true
        image.topAnchor.constraint(equalTo: background.topAnchor, constant: 5).isActive = true
        
        background.addSubview(iconLabel)
        iconLabel.centerXAnchor.constraint(equalTo: background.centerXAnchor).isActive = true
        iconLabel.widthAnchor.constraint(equalTo: background.widthAnchor).isActive = true
        iconLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 5).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
