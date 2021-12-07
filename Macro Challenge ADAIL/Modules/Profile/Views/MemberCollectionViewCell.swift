//
//  MemberCollectionViewCell.swift
//  Macro Challenge ADAIL
//
//  Created by Sukma Risfa Sam Bima Yudha on 15/11/21.
//

import Foundation
import UIKit

class MemberCollectionViewCell: UICollectionViewCell {
    static let identifier = "Member"
    
    let imageWrapper: UIView = UIView()
        .configure { v in
            v.layer.cornerRadius = 15
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let image: UIImageView = {
        let v = UIImageView()
        v.image = UIImage(named: "profile")
        v.contentMode = .scaleToFill
        v.layer.cornerRadius = 30
        v.heightAnchor.constraint(equalToConstant: 40).isActive = true
        v.widthAnchor.constraint(equalToConstant: 40).isActive = true
        v.translatesAutoresizingMaskIntoConstraints = false
        
        return v
    }()
    
    let nameLabel: UILabel = {
        let l = UILabel()
        l.text = "Name"
        l.textAlignment = .center
        l.textColor = .black
        l.lineBreakMode = .byWordWrapping
        l.numberOfLines = 0
        l.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        contentView.addSubview(imageWrapper)
        imageWrapper.backgroundColor = .white
        imageWrapper.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        imageWrapper.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        imageWrapper.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        imageWrapper.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        
        imageWrapper.addSubview(image)
        image.topAnchor.constraint(equalTo: imageWrapper.topAnchor, constant: 10).isActive = true
        image.centerXAnchor.constraint(equalTo: imageWrapper.centerXAnchor).isActive = true
//
        imageWrapper.addSubview(nameLabel)
        nameLabel.widthAnchor.constraint(equalTo: imageWrapper.widthAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: imageWrapper.centerXAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 5).isActive = true
    }
    
    func setItem(_ item: GroupUser) {
        nameLabel.text = item.name
    }
}
