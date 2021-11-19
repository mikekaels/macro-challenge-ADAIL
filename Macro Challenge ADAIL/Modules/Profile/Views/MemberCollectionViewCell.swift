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
    
    let image: UIImageView = {
        let img = UIImage(named: "Group Image")
        let imgView = UIImageView(image: img)
        return imgView
    }()
    
    let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Name"
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        self.contentView.addSubview(image)
        image.center = contentView.center
        
        self.contentView.addSubview(nameLabel)
        nameLabel.center = image.center
        nameLabel.frame.origin.y = image.frame.origin.y - image.frame.height
    }
    
    func setItem(_ item: Member) {
        image.image = item.image
        nameLabel.text = item.name
    }
}
