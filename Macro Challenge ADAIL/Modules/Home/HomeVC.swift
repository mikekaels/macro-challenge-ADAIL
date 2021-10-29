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
        label.text = L10n.welcomeTitle
        label.textAlignment = .center
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let newExpenses: UIButton = {
        let newExpensesButton = UIButton()
        newExpensesButton.setTitle("Create New Expenses", for: .normal)
        newExpensesButton.setTitleColor(.white, for: .normal)
        //MARK: PROGRESS
        newExpensesButton.addTarget(self, action: #selector(goToNewExpenses(_:)), for: .touchUpInside)
        newExpensesButton.layer.cornerRadius = 11
        newExpensesButton.backgroundColor = .systemBlue
        newExpensesButton.translatesAutoresizingMaskIntoConstraints = false
        return newExpensesButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.title = Constants().tab1Title
        self.view.addSubview(textLabel)
        textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        self.view.addSubview(newExpenses)
        newExpenses.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        newExpenses.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 130).isActive = true
        newExpenses.heightAnchor.constraint(equalToConstant: 50).isActive = true
        newExpenses.widthAnchor.constraint(equalToConstant: view.bounds.width - 200).isActive = true
    }
    

}

extension HomeVC: HomePresenterToViewProtocol {
    @objc func goToNewExpenses(_ sender : Any) {
        print("Go To New Expenses")
    }
}
