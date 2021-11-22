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
        newExpensesButton.backgroundColor = .systemGray6
        newExpensesButton.translatesAutoresizingMaskIntoConstraints = false
        return newExpensesButton
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let scrollViewContainer: UIStackView = {
        let view = UIStackView()
        
        view.axis = .vertical
        view.spacing = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let greetingLabel: UILabel = UILabel().configure { v in
        v.text = "Hello Mike"
        v.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        v.textAlignment = .left
        v.textColor = .systemGray
        v.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let profileContainer: UIView = UIView()
        .configure { v in
            v.layer.cornerRadius = 15
            v.layer.masksToBounds = true
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    let profileButton: UIButton = UIButton()
        .configure { v in
            v.setImage(UIImage(named: Asset.Icons.groceries.name), for: .normal)
            v.widthAnchor.constraint(equalToConstant: 25).isActive = true
            v.heightAnchor.constraint(equalToConstant: 25).isActive = true
            v.translatesAutoresizingMaskIntoConstraints = false
            v.addTarget(self, action: #selector(profileTapped), for: .touchUpInside)
        }
    
    let upcomingContainer: UIView = UIView()
        .configure { v in
            v.layer.cornerRadius = 15
            v.backgroundColor = Asset.Colors.blueLight.color
            v.layer.masksToBounds = true
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let upcomingStackView: UIStackView = UIStackView()
        .configure { v in
            v.axis = .vertical
            v.distribution = .fill
        }
    
    let upcomingDesc: UILabel = UILabel()
        .configure { v in
            v.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi nec justo velit. "
            v.font = UIFont.systemFont(ofSize: 12, weight: .medium)
            v.textAlignment = .left
            v.textColor = .label
            v.numberOfLines = 0
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let createExpanseButton: UIButton = UIButton()
        .configure { v in
            v.setTitle("Create expanses", for: .normal)
            v.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
            v.backgroundColor = .systemBlue
            v.layer.cornerRadius = 10
            v.widthAnchor.constraint(equalToConstant: 120).isActive = true
            v.heightAnchor.constraint(equalToConstant: 30).isActive = true
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let upcomingCardView: CardView = CardView(to: ExpansesRouter().createModule())
        .configure { v in
            v.image.image = Asset.Images.cards1.image
        }
    
    let friendsOweCardView: CardView = CardView(to: ExpansesRouter().createModule())
        .configure { v in
            v.image.image = Asset.Images.cards2.image
        }

    let myOweCardView: CardView = CardView(to: ExpansesRouter().createModule())
        .configure { v in
            v.image.image = Asset.Images.cards3.image
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Hello Mike"
        self.title = Constants().tab1Title
        self.view.backgroundColor = .secondarySystemBackground
        profileContainer.widthAnchor.constraint(equalToConstant: 50).isActive = true
        profileContainer.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        profileContainer.addSubview(profileButton)
        profileButton.centerXAnchor.constraint(equalTo: profileContainer.centerXAnchor).isActive = true
        profileButton.centerYAnchor.constraint(equalTo: profileContainer.centerYAnchor).isActive = true
        
        scrollViewContainer.addArrangedSubview(UIStackView(arrangedSubviews: [greetingLabel, profileContainer]).configure(completion: { v in
            v.axis = .horizontal
            v.distribution = .equalSpacing
            v.translatesAutoresizingMaskIntoConstraints = false
        }))
        scrollViewContainer.addArrangedSubview(upcomingCardView)
        scrollViewContainer.addArrangedSubview(friendsOweCardView)
        scrollViewContainer.addArrangedSubview(myOweCardView)
        
        setupScrollView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideNavigationBar(animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        showNavigationBar(animated: animated)
    }
    
    func setupScrollView() {
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        //        scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        //        scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 50).isActive = true
        scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        // Important!
        scrollViewContainer.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.90).isActive = true
        //        scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -50).isActive = true
        scrollViewContainer.spacing = 20
    }
    
    
    @objc func profileTapped() {
        
    }
}

extension HomeVC: HomePresenterToViewProtocol {
    @objc func goToNewExpenses(_ sender : Any) {
        print("Go To New Expenses")
    }
}
