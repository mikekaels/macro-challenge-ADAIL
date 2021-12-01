//
//  ListsVC.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 25/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class ListsVC: UIViewController {
    var presentor: ListsViewToPresenterProtocol?
    public var delegate: ListsDelegate!
    
    var bills: [Any] = [Any]()
    var state: String?
    var upcoming: [Expanses] = [Expanses]()
    
    let totalLabel: UILabel = UILabel()
        .configure { v in
            v.text = "Total: "
            v.font = UIFont.systemFont(ofSize: 15, weight: .medium)
            v.textAlignment = .left
            v.textColor = .label
            v.numberOfLines = 0
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let amountLabel: UILabel = UILabel()
        .configure { v in
            v.text = "Rp 446.000"
            v.font = UIFont.systemFont(ofSize: 25, weight: .medium)
            v.textAlignment = .left
            v.textColor = .label
            v.numberOfLines = 0
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let tableView: UITableView = UITableView()
        .configure { v in
            v.backgroundColor = .secondarySystemBackground
            v.separatorStyle = .none
            
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        title = "Lists"
        // Do any additional setup after loading the view.
        
        setupViews()
        
        switch state {
        case "UpcomingBills":
            tableView.register(CardViewTableViewCell.self, forCellReuseIdentifier: "UpcomingBillsCell")
        case "FriendsDebt":
            tableView.register(FriendsDebtTableViewCell.self, forCellReuseIdentifier: "FriendsDebtCell")
        default:
            break
        }
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func setupViews() {
        view.addSubview(tableView)
        
        
        switch state {
        case "FriendsDebt", "MyDebt":
            view.addSubview(totalLabel)
            view.addSubview(amountLabel)
            
            totalLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
            totalLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
            
            amountLabel.topAnchor.constraint(equalTo: totalLabel.bottomAnchor, constant: 10).isActive = true
            amountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
            tableView.topAnchor.constraint(equalTo: amountLabel.bottomAnchor, constant: 20).isActive = true
        default:
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        }
        
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
        fetchUpcoming()
    }
    
    func fetchUpcoming() {
        presentor?.fetchUpcoming()
    }
}

extension ListsVC: ListsPresenterToViewProtocol {
    func didFetchUpcoming(data: [Expanses]) {
        self.upcoming = data
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
}

extension ListsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch state {
        case "UpcomingBills":
            return upcoming.count
        case "FriendsDebt":
            return 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch state {
        case "UpcomingBills":
            let cell = tableView.dequeueReusableCell(withIdentifier: "UpcomingBillsCell", for: indexPath) as! CardViewTableViewCell
            let data = upcoming[indexPath.row]
            cell.itemLabel.text = data.transactionName
            cell.dateLabel.text = data.paymentDate.toString()
            cell.priceLabel.text = String(data.totalTransaction).currencyFormatting()
            cell.image.image = UIImage(systemName: data.icon)
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
        case "FriendsDebt":
            let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsDebtCell", for: indexPath) as! FriendsDebtTableViewCell
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
