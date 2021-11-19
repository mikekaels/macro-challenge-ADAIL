//
//  FriendsDebtVC.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 19/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class FriendsDebtVC: UIViewController {
    var presentor: FriendsDebtViewToPresenterProtocol?
    public var delegate: FriendsDebtDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        title = "Detail Yudha's Debt"
        // Do any additional setup after loading the view.
    }

}

extension FriendsDebtVC: FriendsDebtPresenterToViewProtocol {
    
}
