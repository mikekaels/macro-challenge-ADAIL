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
    
    var persons: [User] = [User]()
    var selectedPerson: String?
    
    let screenWidth = UIScreen.main.bounds.width - 10
    let screenHeight = UIScreen.main.bounds.height / 2
    
    var selectedPersonRow = 0
    
    let scrollView: UIScrollView = {
        let s = UIScrollView()
        s.translatesAutoresizingMaskIntoConstraints = false
        return s
    }()
    
    let scrollViewContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let profileImage: UIImageView = UIImageView()
        .configure { v in
            v.image = Asset.Images.profile.image
            v.layer.cornerRadius = 25
            v.heightAnchor.constraint(equalToConstant: 50).isActive = true
            v.widthAnchor.constraint(equalToConstant: 50).isActive = true
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let personTextField: UITextField = UITextField()
        .configure { t in
            t.backgroundColor = .white
            t.layer.cornerRadius = 13
            t.layer.masksToBounds = true
            t.heightAnchor.constraint(equalToConstant: 40).isActive = true
            t.isEnabled = true
            t.clipsToBounds = true
            t.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 40))
            t.leftViewMode = .always
            t.rightViewMode = .always
            t.isExclusiveTouch = true
            t.isUserInteractionEnabled = true
            t.translatesAutoresizingMaskIntoConstraints = false
//            t.addTarget(self, action: #selector(remindMeAtSelected), for: .allEditingEvents)
        }
    
    let amountTextField: UITextField = UITextField()
        .configure { t in
            t.backgroundColor = .white
            t.keyboardType = .numberPad
            t.layer.cornerRadius = 13
            t.layer.masksToBounds = true
            t.heightAnchor.constraint(equalToConstant: 40).isActive = true
            t.isEnabled = true
            t.clipsToBounds = true
            t.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 40))
            t.leftViewMode = .always
            t.rightViewMode = .always
            t.isExclusiveTouch = true
            t.isUserInteractionEnabled = true
            t.translatesAutoresizingMaskIntoConstraints = false
//            t.addTarget(self, action: #selector(remindMeAtSelected), for: .allEditingEvents)
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0)).configure { v in
                v.backgroundColor = .red
                v.widthAnchor.constraint(equalToConstant: 40).isActive = true
                v.heightAnchor.constraint(equalToConstant: t.frame.height).isActive = true
                v.translatesAutoresizingMaskIntoConstraints = false
            }
            t.leftView = view
            let rp = UILabel()
                .configure { l in
                    l.text = "Rp"
                    l.textColor = .systemGray3
                    l.center = view.center
                    l.translatesAutoresizingMaskIntoConstraints = false
                }
            
            view.addSubview(rp)
            rp.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            rp.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        }
    
    let paymentDateLabel: UILabel = UILabel()
        .configure { l in
            l.text = "Date"
            l.textColor = .systemGray3
            l.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let paymentDate: UIDatePicker = {
        let d = UIDatePicker()
        d.datePickerMode = .dateAndTime
        d.preferredDatePickerStyle = .compact
        d.timeZone = NSTimeZone.local
        d.backgroundColor = UIColor.clear
        d.translatesAutoresizingMaskIntoConstraints = false
        return d
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        // Do any additional setup after loading the view.
        
        fetchUsers()
        
        view.addSubview(personTextField)
        personTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        personTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        personTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        personTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        
        view.addSubview(amountTextField)
        amountTextField.topAnchor.constraint(equalTo: personTextField.bottomAnchor, constant: 10).isActive = true
        amountTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        amountTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        amountTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        
        let stackView: UIStackView = UIStackView()
            .configure { v in
                v.spacing = 20
                v.distribution = .fill
                v.axis = .horizontal
                v.heightAnchor.constraint(equalToConstant: 50).isActive = true
                v.translatesAutoresizingMaskIntoConstraints = false
                v.addArrangedSubview(paymentDateLabel)
                v.addArrangedSubview(UIView().configure(completion: { v in
                    v.addSubview(paymentDate)
                    paymentDate.centerXAnchor.constraint(equalTo: v.centerXAnchor).isActive = true
                    paymentDate.centerYAnchor.constraint(equalTo: v.centerYAnchor).isActive = true
                }))
            }
        
        
        
        view.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: amountTextField.bottomAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addTapped))
    }
    
    @objc func addTapped() {
        
        let user = Core().getID()
        
        guard let id = selectedPerson else {
            return
        }
        
        guard let total = amountTextField.text else {
            return
        }
        
        let date = paymentDate.date
        
        presentor?.addDebt(userId: user, friendId: id, totalDebt: Int(total) ?? 0, date: date)
    }
    
    @objc func buttonTapped() {
        
    }
    
    @objc func personSelected() {
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width: screenWidth, height: screenHeight)
        let pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        pickerView.delegate = self
        pickerView.dataSource = self
        
        pickerView.selectRow(selectedPersonRow, inComponent: 0, animated: false)
        vc.view.addSubview(pickerView)
        pickerView.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor).isActive = true
        pickerView.centerYAnchor.constraint(equalTo: vc.view.centerYAnchor).isActive = true
        
        let alert = UIAlertController(title: "Remind me before", message: "", preferredStyle: .actionSheet)
        
        alert.popoverPresentationController?.sourceView = personTextField
        alert.popoverPresentationController?.sourceRect = personTextField.bounds
        
        alert.setValue(vc, forKey: "contentViewController")
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        
        alert.addAction(UIAlertAction(title: "Select", style: .default , handler: { UIAlertAction in
            self.selectedPersonRow = pickerView.selectedRow(inComponent: 0)
            let selectedPerson = Array(self.persons)[self.selectedPersonRow]
            self.personTextField.text = selectedPerson.name
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func fetchUsers() {
        presentor?.fetchUsers(groupId: Core().getGroupID())
    }

}

extension AddDebtVC: AddDebtPresenterToViewProtocol {
    func didCreateDebt(debt: DebtHistory) {
        DispatchQueue.main.async {
            self.presentor?._dismiss(from: self)
        }
    }
    
    func didFetchUsers(users: [User]) {
        self.persons = users
        
        DispatchQueue.main.async {
            print("USERS",users)
            
            var actions: [UIAction] = [UIAction]()
            
            self.persons.forEach { user in
                actions.append(UIAction(title: user.name, image: nil, handler: { _ in
                    self.personTextField.text = user.name
                    self.selectedPerson = user.id
                }))
            }
            
            let remindmeTexfieldItems = UIMenu(title: "Friends", options: .displayInline, children: actions)
            
            self.personTextField.rightView = UIButton()
                .configure { b in
                    b.setTitleColor(.green, for: .normal)
                    
                    b.setImage(UIImage(systemName: "chevron.down"), for: .normal)

                    b.addTarget(self, action: #selector(self.buttonTapped), for: .touchUpInside)
                    
                    b.showsMenuAsPrimaryAction = true
                    b.menu = remindmeTexfieldItems
                    b.translatesAutoresizingMaskIntoConstraints = false
                    b.widthAnchor.constraint(equalToConstant: 50).isActive = true
                }
        }
    }
    
}

extension AddDebtVC: UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 30))
        label.text = persons[row].name
        label.sizeToFit()
        return label
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return persons.count
        } else {
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 60
    }
    
    
    // Text Field
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == personTextField {
            self.view.endEditing(true)
        }
    }
}
