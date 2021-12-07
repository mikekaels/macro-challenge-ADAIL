//
//  CardView.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 17/11/21.
//

import UIKit

enum CardState {
    case upcomingBills
    case friendsDebt
}

class CardView: UIView {
    
    var cellTo: UIViewController?
    var card: CardState
    
    var upcomingBills: [Expanses] = [Expanses]()
    var friendsDebt: [Debt] = [Debt]()
    var friendsData: [User] = [User]()
    
    let upcomingDesc: UILabel = UILabel()
        .configure { v in
            v.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi nec justo velit. "
            v.font = UIFont.systemFont(ofSize: 12, weight: .medium)
            v.textAlignment = .left
            v.textColor = .label
            v.numberOfLines = 0
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let image: UIImageView = UIImageView()
        .configure(completion: { i in
            i.image = Asset.Images.cards1.image
            i.widthAnchor.constraint(equalToConstant: 100).isActive = true
            i.heightAnchor.constraint(equalToConstant: 90).isActive = true
            i.translatesAutoresizingMaskIntoConstraints = false
        })
    
    let createExpanseButton: UIButton = UIButton()
        .configure { v in
            
            v.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
            v.backgroundColor = .systemBlue
            v.layer.cornerRadius = 10
            v.widthAnchor.constraint(equalToConstant: 120).isActive = true
            v.heightAnchor.constraint(equalToConstant: 30).isActive = true
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let tableView: UITableView = UITableView()
        .configure { t in
            t.backgroundColor = .clear
            t.register(CardViewTableViewCell.self, forCellReuseIdentifier: "UpcomingBillsCell")
            t.register(FriendsDebtTableViewCell.self, forCellReuseIdentifier: "FriendsDebtCell")
            t.isScrollEnabled = false
//            t.allowsSelection = false
            t.separatorStyle = .none
            t.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let button: UIButton = UIButton()
        .configure { v in
            v.setTitle("See All", for: .normal)
            v.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
            v.setTitleColor(.systemBlue, for: .normal)
            v.translatesAutoresizingMaskIntoConstraints = false
            
            v.addTarget(self, action: #selector(seeAllPressed), for: .touchUpInside)
        }
    
    init(to cellTo: UIViewController, for card: CardState) {
        self.cellTo = cellTo
        self.card = card
        super.init(frame: .zero)
        setupView()
        
        switch card {
        case .upcomingBills:
            createExpanseButton.setTitle("Create expanses", for: .normal)
            createExpanseButton.addTarget(self, action: #selector(mainButtonPressed), for: .touchUpInside)
            
        case .friendsDebt:
            createExpanseButton.setTitle("Add friend's debt", for: .normal)
            createExpanseButton.addTarget(self, action: #selector(mainButtonPressed), for: .touchUpInside)
        default:
            break
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        tableView.delegate = self
        tableView.dataSource = self
        layer.cornerRadius = 15
        backgroundColor = .clear
        layer.masksToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        
        heightAnchor.constraint(equalToConstant: 320).isActive = true
        
        let stackViewww: UIStackView = UIStackView(arrangedSubviews: [
            UIStackView(arrangedSubviews: [upcomingDesc, createExpanseButton])
                .configure(completion: { b in
                    b.axis = .vertical
                    b.alignment = .leading
                    b.distribution = .fillProportionally
                    b.translatesAutoresizingMaskIntoConstraints = false
        }),
            image
        ]).configure(completion: { s in
            s.distribution = .fillProportionally
            s.translatesAutoresizingMaskIntoConstraints = false
        })
        
        
        
        addSubview(stackViewww)
        stackViewww.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stackViewww.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        stackViewww.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 3/3.5).isActive = true
        
        addSubview(tableView)
        addSubview(button)
        tableView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 3/3.3).isActive = true
        tableView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo:  stackViewww.bottomAnchor, constant: 10).isActive = true
        tableView.bottomAnchor.constraint(equalTo: button.topAnchor, constant: 10).isActive = true
        
        
        button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        button.rightAnchor.constraint(equalTo: rightAnchor, constant: -25).isActive = true
    }
    
    @objc func mainButtonPressed() {
        switch card {
        case .upcomingBills:
            let vc = ExpansesRouter().createModule()
            vc.title = "Create Repeat bills"
            parentViewController?.navigationController?.pushViewController(vc, animated: true)
            
        case .friendsDebt:
            let vc = AddDebtRouter().createModule()
            vc.title = "Add Friend's Debt"
            parentViewController?.navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
    
    @objc func seeAllPressed() {
        switch card {
        case .upcomingBills:
            let vc = ListsRouter().createModule()
            vc.title = "Upcoming bills List"
            vc.state = "UpcomingBills"
            parentViewController?.navigationController?.pushViewController(vc, animated: true)
            
        case .friendsDebt:
            let vc = ListsRouter().createModule()
            vc.title = "Friends Debt List"
            vc.state = "FriendsDebt"
            vc.friendsDebt = self.friendsDebt
            vc.friendsData = self.friendsData
            parentViewController?.navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
}

extension CardView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if card == .upcomingBills && upcomingBills.count <= 3 {
            return upcomingBills.count
        } else if card == .friendsDebt && friendsDebt.count <= 3 {
            return friendsDebt.count
        } else {
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if card == .upcomingBills {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UpcomingBillsCell", for: indexPath) as! CardViewTableViewCell
            let data = upcomingBills[indexPath.row]
            cell.itemLabel.text = data.transactionName
            cell.dateLabel.text = data.paymentDate.toString()
            cell.priceLabel.text = String(data.totalTransaction).currencyFormatting()
            cell.image.image = UIImage(systemName: data.icon)
            
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            cell.parent = HomeVC()
            return cell
        } else if card == .friendsDebt {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsDebtCell", for: indexPath) as! FriendsDebtTableViewCell
            
            let data = friendsData[indexPath.row]
            let debt = friendsDebt[indexPath.row]
//            
            cell.itemLabel.text = data.name
            cell.priceLabel.text = String(debt.total).currencyFormatting()
            
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            cell.parent = HomeVC()
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        parentViewController?.navigationController?.pushViewController(self.cellTo!, animated: true)
    }
}
