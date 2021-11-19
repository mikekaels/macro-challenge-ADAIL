//
//  DescSpaceVC.swift
//  Macro Challenge ADAIL
//
//  Created by Sukma Risfa Sam Bima Yudha on 19/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class DescSpaceVC: UIViewController {
    var presentor: DescSpaceViewToPresenterProtocol?
    public var delegate: DescSpaceDelegate!
    
    let textFieldBG: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        return view
    }()
    
    let nameTxtField: UITextView = {
        let txt = UITextView()
        txt.text = "Anda sopan kami pun segan, tolong patuhi peraturan yang sudah disepakati dan jangan lupa bayar uang kontrakan"
        txt.textColor = .black
        txt.font = .systemFont(ofSize: 17)
        txt.frame = CGRect(x: 0, y: 0, width: 150, height: 50)
        return txt
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Desc Space"
        print("This is Desc Space")
        view.backgroundColor = .secondarySystemBackground
        navigationController?.navigationBar.prefersLargeTitles = false
        
        view.addSubview(textFieldBG)
        textFieldBG.translatesAutoresizingMaskIntoConstraints = false
        textFieldBG.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        textFieldBG.heightAnchor.constraint(equalToConstant: 140).isActive = true
        textFieldBG.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        textFieldBG.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        
        textFieldBG.addSubview(nameTxtField)
        nameTxtField.isEditable = true
        nameTxtField.translatesAutoresizingMaskIntoConstraints = false
        nameTxtField.topAnchor.constraint(equalTo: textFieldBG.topAnchor).isActive = true
        nameTxtField.leadingAnchor.constraint(equalTo: textFieldBG.leadingAnchor, constant: 15).isActive = true
        nameTxtField.trailingAnchor.constraint(equalTo: textFieldBG.trailingAnchor, constant: -15).isActive = true
        nameTxtField.bottomAnchor.constraint(equalTo: textFieldBG.bottomAnchor, constant: -15).isActive = true

    }

}

extension DescSpaceVC: DescSpacePresenterToViewProtocol {
    
}
