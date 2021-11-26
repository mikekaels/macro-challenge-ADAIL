//
//  AddDebtVC.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 26/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class AddDebtVC: UIViewController {
    var presentor: AddDebtViewToPresenterProtocol?
    public var delegate: AddDebtDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
    }
    
    @objc func addTapped() {
        print("Ouww")
    }

}

extension AddDebtVC: AddDebtPresenterToViewProtocol {
    
}
