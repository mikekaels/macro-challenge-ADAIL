//
//  RecordsTableViewCell.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 11/11/21.
//

import UIKit

class RecordsTableViewCell: UITableViewCell {
    
    let background: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.layer.cornerRadius = 7
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
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
            v.image = Asset.Images.profile.image
        }
    
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Groceries"
        label.textColor = .label
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "Rp 350.000"
        label.textColor = .label
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let chevron: UIImageView = {
        let i = UIImageView()
        i.image = UIImage(systemName: "chevron.right")
        i.tintColor = .gray
        i.frame.size.width = 10
        i.frame.size.height = 10
        i.contentMode = UIView.ContentMode.scaleAspectFit
        i.translatesAutoresizingMaskIntoConstraints = false
        return i
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.backgroundColor = .clear
        setupView()
    }
    
    
    func setupView() {
        
        addSubview(background)
        background.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        background.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        background.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 30).isActive = true
        background.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        background.addSubview(imageWrapper)
        
        imageWrapper.leadingAnchor.constraint(equalTo: background.leadingAnchor, constant: 10).isActive = true
        imageWrapper.centerYAnchor.constraint(equalTo: background.centerYAnchor).isActive = true
        
        imageWrapper.addSubview(image)
        image.centerXAnchor.constraint(equalTo: imageWrapper.centerXAnchor).isActive = true
        image.centerYAnchor.constraint(equalTo: imageWrapper.centerYAnchor).isActive = true
        
        
        background.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: background.topAnchor, constant: 5).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: imageWrapper.rightAnchor, constant: 10).isActive = true
        
        background.addSubview(priceLabel)
        priceLabel.leftAnchor.constraint(equalTo: imageWrapper.rightAnchor, constant: 10).isActive = true
        priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 3).isActive = true
        
        background.addSubview(chevron)
        chevron.centerYAnchor.constraint(equalTo: background.centerYAnchor).isActive = true
        chevron.rightAnchor.constraint(equalTo: background.rightAnchor, constant: -10).isActive = true
    }

}

extension UICollectionViewCell {
    func shadowDecorate() {
        let radius: CGFloat = 10
        contentView.layer.cornerRadius = radius
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = true
    
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 0.5
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: radius).cgPath
        layer.cornerRadius = radius
    }
}
