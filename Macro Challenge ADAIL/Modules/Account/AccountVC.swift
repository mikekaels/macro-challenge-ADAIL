//
//  AccountVC.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 26/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class AccountVC: UIViewController {
    var presentor: AccountViewToPresenterProtocol?
    public var delegate: AccountDelegate!
    
    let accountFields = ["Name", "Email", "Phone"]
    let bankFields = ["Bank Name", "Acc Number"]
    
    let scrollView: UIScrollView = {
        let s = UIScrollView()
        s.translatesAutoresizingMaskIntoConstraints = false
        return s
    }()
    
    let scrollViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .center
        view.spacing = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let tableView: UITableView = UITableView(frame: CGRect.zero, style: .insetGrouped)
        .configure { v in
            v.register(TextFieldTableViewCell.self, forCellReuseIdentifier: "TextfieldCell")
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let profileImage: UIImageView = UIImageView()
        .configure { v in
            v.image = Asset.Images.profile.image
            v.layer.cornerRadius = 25
            v.contentMode = .scaleAspectFill
            v.heightAnchor.constraint(equalToConstant: 100).isActive = true
            v.widthAnchor.constraint(equalToConstant: 100).isActive = true
            v.translatesAutoresizingMaskIntoConstraints = false
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .secondarySystemBackground
        
//        setupScrollView()
        setupViews()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveTapped))
    }
    
    @objc func saveTapped() {
        print("save")
        self.dismiss(animated: true, completion: nil)
    }
    
    func setupViews() {
//        scrollViewContainer.addArrangedSubview(profileImage)
//        scrollViewContainer.addArrangedSubview(tableView)
        view.addSubview(profileImage)
        profileImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        profileImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 20).isActive = true
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 3/3.1).isActive = true
        tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: 400).isActive = true
    }
    
    func setupScrollView() {
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 40).isActive = true
        scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        scrollViewContainer.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.90).isActive = true
        scrollViewContainer.spacing = 20
    }

}

extension AccountVC: AccountPresenterToViewProtocol {
    
}

extension AccountVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Account"
        case 1:
            return "Bank"
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        case 1:
            return 2
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TextfieldCell", for: indexPath) as! TextFieldTableViewCell
        switch indexPath[0] {
        case 0:
            cell.label.text = accountFields[indexPath.row]
            switch indexPath.row {
            case 1:
                cell.textField.keyboardType = .emailAddress
            case 2:
                cell.textField.keyboardType = .numberPad
            default:
                break
            }
        case 1:
            cell.label.text = bankFields[indexPath.row]
            switch indexPath.row {
            case 1:
                cell.textField.keyboardType = .numberPad
            default:
                break
            }
        default:
            cell.label.text = ""
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}


