//
//  TextFieldTableViewCell.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 26/11/21.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell {

    let label: UILabel = UILabel()
        .configure { v in
            v.text = "Name"
            v.numberOfLines = 1
            v.textAlignment = .left
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let textField: UITextField = UITextField()
        .configure { v in
//            v.backgroundColor = .blue
            v.translatesAutoresizingMaskIntoConstraints = false
        }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        selectionStyle = .none
        
        
        addSubview(label)
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        label.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 3/10).isActive = true
        
        addSubview(textField)
        textField.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        textField.leadingAnchor.constraint(equalTo: label.trailingAnchor).isActive = true
        textField.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        textField.becomeFirstResponder()
        
        textField.delegate = self
        
    }

}

extension TextFieldTableViewCell: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
}
