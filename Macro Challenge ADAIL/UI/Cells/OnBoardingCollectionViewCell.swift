//
//  OnBoardingCollectionViewCell.swift
//  Macro Challenge ADAIL
//
//  Created by Sukma Risfa Sam Bima Yudha on 12/11/21.
//

import Foundation
import UIKit

class OnBoardingCollectionViewCell: UICollectionViewCell {
    static let identifier = "OnBoarding"
    
    let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillProportionally
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = L10n.onB1Title
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 34)
        label.textColor = UIColor(displayP3Red: 10/255, green: 122/255, blue: 255/255, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return label
    }()
    
    let imageView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 400).isActive = true
        return view
    }()
    
    let image: UIImageView = {
        let image = UIImage(named: "oB1")
        let view = UIImageView(image: image)
        view.frame.origin.x = -20
        view.frame.origin.y = 20
        return view
    }()
    
    let descLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = L10n.onB1Desc
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 17)
        label.textColor = UIColor(displayP3Red: 10/255, green: 122/255, blue: 255/255, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        return label
    }()
    
    let blackView: UILabel = {
        let label = UILabel()
        label.text = " "
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.clipsToBounds = true
        contentView.frame.origin.y = -30
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        self.contentView.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 35).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -35).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50).isActive = true
        setupStackView()
    }
    
    func setupStackView() {
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(imageView)
        imageView.addSubview(image)
        stackView.addArrangedSubview(descLabel)
        stackView.addArrangedSubview(blackView)
    }
    
    func setItem(_ item: OnBoardingItem) {
        titleLabel.text = item.title
        image.image = item.image
        descLabel.text = item.Desc
    }
}
