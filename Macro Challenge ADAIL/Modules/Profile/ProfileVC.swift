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
    
    let bgImg: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ProfileTabBG")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let singUpButton: UIButton = {
        let b = UIButton()
        b.setTitle("Sign Up", for: .normal)
        b.heightAnchor.constraint(equalToConstant: 20).isActive = true
        b.setTitleColor(.systemBlue, for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.addTarget(self, action: #selector(signUpPressed), for: .touchUpInside)
        return b
    }()
    
    let signInButton: UIButton = {
        let b = UIButton()
        b.setTitle("Sign In", for: .normal)
        b.heightAnchor.constraint(equalToConstant: 20).isActive = true
        b.setTitleColor(.systemBlue, for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.addTarget(self, action: #selector(signInPressed), for: .touchUpInside)
        return b
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.title = Constants().tab3Title
        setupView()
    }
    
    @objc func signUpPressed() {
        print("SIGN UP PRESSED")
    }
    
    @objc func signInPressed() {
        print("SIGN IN PRESSED")
    }
    
    func setupView() {
        self.view.addSubview(textLabel)
        textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        self.view.addSubview(bgImg)
        bgImg.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bgImg.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        self.view.addSubview(singUpButton)
        singUpButton.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 50)
            .isActive = true
        singUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36)
            .isActive = true
        singUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -36)
            .isActive = true
        
        self.view.addSubview(signInButton)
        signInButton.topAnchor.constraint(equalTo: singUpButton.bottomAnchor, constant: 20)
            .isActive = true
        signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36)
            .isActive = true
        signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -36)
            .isActive = true
    }
}

extension ProfileVC: ProfilePresenterToViewProtocol {
    
}
