//
//  CardViewTableViewCell.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 17/11/21.
//

import UIKit

class CardViewTableViewCell: UITableViewCell {
    
    let background: UIView = UIView()
        .configure { v in
            v.backgroundColor = .white
            v.layer.cornerRadius = 10
            v.layer.masksToBounds = true
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let imageWrapper: UIView = UIView()
        .configure { v in
            v.backgroundColor = Asset.Colors.fff5Cd.color
            v.layer.cornerRadius = 17
            v.heightAnchor.constraint(equalToConstant: 35).isActive = true
            v.widthAnchor.constraint(equalToConstant: 35).isActive = true
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let image: UIImageView = UIImageView()
        .configure { v in
            v.layer.cornerRadius = 13
            v.layer.masksToBounds = true
            v.widthAnchor.constraint(equalToConstant: 25).isActive = true
            v.heightAnchor.constraint(equalToConstant: 25).isActive = true
            v.translatesAutoresizingMaskIntoConstraints = false
            v.image = Asset.Images.profileImage.image
        }
    
    let itemLabel: UILabel = UILabel()
        .configure { v in
            v.text = "Bayar kontrakan bu lili"
            v.font = UIFont.systemFont(ofSize: 14, weight: .light)
            v.textAlignment = .left
            v.textColor = .label
            v.numberOfLines = 0
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let dateLabel: UILabel = UILabel()
        .configure { v in
            v.text = "22 Desember 2021"
            v.font = UIFont.systemFont(ofSize: 11, weight: .light)
            v.textAlignment = .left
            v.textColor = .label
            v.numberOfLines = 0
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let timeLabel: UILabel = UILabel()
        .configure { v in
            v.text = "14.30"
            v.font = UIFont.systemFont(ofSize: 11, weight: .light)
            v.textAlignment = .right
            v.textColor = .label
            v.numberOfLines = 0
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let priceLabel: UILabel = UILabel()
        .configure { v in
            v.text = "Rp 2.000.000"
            v.font = UIFont.systemFont(ofSize: 12, weight: .bold)
            v.textAlignment = .left
            v.textColor = .label
            v.numberOfLines = 0
            v.translatesAutoresizingMaskIntoConstraints = false
        }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        addSubview(background)
        background.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        background.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        background.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        background.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        background.addSubview(imageWrapper)
        
        imageWrapper.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 10).isActive = true
        imageWrapper.centerYAnchor.constraint(equalTo: background.centerYAnchor).isActive = true
        
        imageWrapper.addSubview(image)
        image.centerXAnchor.constraint(equalTo: imageWrapper.centerXAnchor).isActive = true
        image.centerYAnchor.constraint(equalTo: imageWrapper.centerYAnchor).isActive = true
        
        background.addSubview(itemLabel)
        itemLabel.leadingAnchor.constraint(equalTo: imageWrapper.trailingAnchor, constant: 15).isActive = true
        itemLabel.topAnchor.constraint(equalTo: background.topAnchor, constant: 6).isActive = true
        
        background.addSubview(dateLabel)
        dateLabel.leadingAnchor.constraint(equalTo: imageWrapper.trailingAnchor, constant: 15).isActive = true
        dateLabel.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: -6).isActive = true
        
        background.addSubview(timeLabel)
        timeLabel.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -15).isActive = true
        timeLabel.topAnchor.constraint(equalTo: background.topAnchor, constant: 6).isActive = true
    
        background.addSubview(priceLabel)
        priceLabel.trailingAnchor.constraint(equalTo: background.trailingAnchor, constant: -15).isActive = true
        priceLabel.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: -6).isActive = true
    }

}
