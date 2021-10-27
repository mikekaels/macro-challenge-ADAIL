//
//  SignInVC.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 27/10/21.
//

import UIKit

class SignInVC: UIViewController {
    var presentor: SignInViewToPresenterProtocol?
    public var delegate: SignInDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sign In"
        view.backgroundColor = .systemMint
        // Do any additional setup after loading the view.
    }

}

extension SignInVC: SignInPresenterToViewProtocol {
    
}

extension SignInVC: ProfileDelegate {
    
}
