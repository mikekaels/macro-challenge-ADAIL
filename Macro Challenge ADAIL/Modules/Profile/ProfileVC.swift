//
//  ProfileVC.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 23/10/21.
//

import UIKit

class ProfileVC: UIViewController {
    var presentor: ProfileViewToPresenterProtocol?
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = Constants().tab3Title
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.title = Constants().tab3Title
        self.view.addSubview(textLabel)
        textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}

extension ProfileVC: ProfilePresenterToViewProtocol {
    
}
