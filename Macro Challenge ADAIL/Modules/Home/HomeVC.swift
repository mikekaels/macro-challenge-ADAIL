//
//  HomeVC.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 22/10/21.
//

import UIKit

class HomeVC: UIViewController {
    var presentor: HomeViewToPresenterProtocol?
    
    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Home"
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.title = "Co-Living"
        self.view.addSubview(textLabel)
        textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    

}

extension HomeVC: HomePresenterToViewProtocol {
    
}
