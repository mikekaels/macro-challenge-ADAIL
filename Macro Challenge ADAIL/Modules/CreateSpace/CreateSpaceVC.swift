//
//  CreateSpaceVC.swift
//  Macro Challenge ADAIL
//
//  Created by Sukma Risfa Sam Bima Yudha on 15/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class CreateSpaceVC: UIViewController {
    var presentor: CreateSpaceViewToPresenterProtocol?
    public var delegate: CreateSpaceDelegate!
    
    let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .systemBlue
        lbl.text = "Co-Living"
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.widthAnchor.constraint(equalToConstant: 150).isActive = true
        return lbl
    }()
    
    let nameTextField: UITextField = {
        let field = UITextField()
        field.backgroundColor = .white
        field.placeholder = "Name"
        field.leftViewMode = .always
        field.borderStyle = .none
        return field
    }()
    
    let line1: UIView = {
        let ln = UIView()
        ln.backgroundColor = UIColor(red: 60/255, green: 60/255, blue: 67/255, alpha: 37)
        return ln
    }()
    
    let addressLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .systemBlue
        lbl.text = "Address"
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.widthAnchor.constraint(equalToConstant: 150).isActive = true
        return lbl
    }()
    
    let addressTextField: UITextField = {
        let field = UITextField()
        field.backgroundColor = .white
        field.placeholder = "Address"
        field.leftViewMode = .always
        field.borderStyle = .none
        return field
    }()
    
    let line2: UIView = {
        let ln = UIView()
        ln.backgroundColor = UIColor(red: 60/255, green: 60/255, blue: 67/255, alpha: 37)
        return ln
    }()
    
    let aboutLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "About my Co-Living"
        lbl.textColor = .systemBlue
        lbl.textAlignment = .left
        lbl.font = .systemFont(ofSize: 20)
        return lbl
    }()
    
    let aboutTextField: UITextView = {
        let field = UITextView()
        field.backgroundColor = .white
        field.text = "Description of your Co-Living Space"
        field.font = .systemFont(ofSize: 17, weight: .regular)
        return field
    }()
    
    let createButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .systemBlue
        btn.setTitle("Create Co-Living Space", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.layer.cornerRadius = 8
        return btn
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        view.backgroundColor = .secondarySystemBackground
        self.navigationController?.navigationBar.prefersLargeTitles = false
        setNameTextField()
        setAddressTextField()
        setAbout()
        setCreateButton()
        
    }
    
    func setNameTextField() {
        view.addSubview(nameTextField)
        nameTextField.leftView = nameLabel
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        nameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        nameTextField.addSubview(line1)
        line1.translatesAutoresizingMaskIntoConstraints = false
        line1.bottomAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        line1.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor).isActive = true
        line1.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor).isActive = true
        line1.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
    }
    
    func setAddressTextField() {
        view.addSubview(addressTextField)
        addressTextField.leftView = addressLabel
        addressTextField.translatesAutoresizingMaskIntoConstraints = false
        addressTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        addressTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        addressTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        addressTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        addressTextField.addSubview(line2)
        line2.translatesAutoresizingMaskIntoConstraints = false
        line2.bottomAnchor.constraint(equalTo: addressTextField.bottomAnchor).isActive = true
        line2.leadingAnchor.constraint(equalTo: addressTextField.leadingAnchor).isActive = true
        line2.trailingAnchor.constraint(equalTo: addressTextField.trailingAnchor).isActive = true
        line2.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
    }
    
    func setAbout() {
        view.addSubview(aboutLabel)
        aboutLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutLabel.topAnchor.constraint(equalTo: line2.bottomAnchor, constant: 50).isActive = true
        aboutLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        aboutLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        aboutLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        view.addSubview(aboutTextField)
        aboutTextField.translatesAutoresizingMaskIntoConstraints = false
        aboutTextField.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor, constant: 5).isActive = true
        aboutTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        aboutTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        aboutTextField.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        aboutTextField.delegate = self
    }
    
    func setCreateButton() {
        view.addSubview(createButton)
        createButton.addTarget(self, action: #selector(didTapCreate), for: .touchUpInside)
        createButton.translatesAutoresizingMaskIntoConstraints = false
        createButton.topAnchor.constraint(equalTo: aboutTextField.bottomAnchor, constant: 15).isActive = true
        createButton.centerXAnchor.constraint(equalTo: aboutTextField.centerXAnchor).isActive = true
        createButton.widthAnchor.constraint(equalToConstant: 315).isActive = true
        createButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc func didTapCreate() {
        print("Create Co-Living Space")
        presentor?.router?.goToProfile(from: self)
    }
}

extension CreateSpaceVC: CreateSpacePresenterToViewProtocol {
    
}

extension CreateSpaceVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        aboutTextField.text = ""
    }
}
