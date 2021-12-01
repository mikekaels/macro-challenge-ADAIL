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
        let img = UIImage(named: "profile")
        let imgView = UIImageView(image: img)
        return imgView
    }()
    
    let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Name"
        lbl.textAlignment = .center
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
        image.frame.size = CGSize(width: 60, height: 60)
        image.center = contentView.center
        image.frame.origin.y = 0

//        image.frame.origin = CGPoint(x: <#T##Double#>, y: <#T##Double#>)
        
        self.contentView.addSubview(nameLabel)
        nameLabel.frame.size = CGSize(width: contentView.frame.width, height: 50)
        nameLabel.center = image.center
        nameLabel.center.y = image.frame.height + 10

//        nameLabel.frame.origin.y = image.frame.size.height / 2
//        nameLabel.center.x = image.center.x
//        nameLabel.center.y = image.center.y - image.frame.height/2
    }
    
    func setItem(_ item: GroupUser) {
        nameLabel.text = item.name
    }
}
