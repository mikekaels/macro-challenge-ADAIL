//
//  SignUpVC.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 27/10/21.
//

import UIKit

class SignUpVC: UIViewController {
    var presentor: SignUpViewToPresenterProtocol?
    public var delegate: SignUpDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sign Up"
        view.backgroundColor = .systemRed
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

extension SignUpVC: SignUpPresenterToViewProtocol {
    
}

extension SignUpVC: ProfileDelegate {
    
}
