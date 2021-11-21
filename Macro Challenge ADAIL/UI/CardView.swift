//
//  CardView.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 17/11/21.
//

import UIKit

class CardView: UIView {
    
    var cellTo: UIViewController?
    
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
    
    let tableView: UITableView = UITableView()
        .configure { t in
            t.backgroundColor = .clear
            t.register(CardViewTableViewCell.self, forCellReuseIdentifier: "CardViewCell")
            t.isScrollEnabled = false
//            t.allowsSelection = false
            t.separatorStyle = .none
            t.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let button: UIButton = UIButton()
        .configure { v in
            v.setTitle("See More", for: .normal)
            v.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
            v.setTitleColor(.systemBlue, for: .normal)
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    init(to cellTo: UIViewController) {
        self.cellTo = cellTo
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        tableView.delegate = self
        tableView.dataSource = self
        layer.cornerRadius = 15
        backgroundColor = Asset.blueLight.color
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
            UIImageView().configure(completion: { i in
                i.image = Asset.Images.upcomingImage.image
                i.widthAnchor.constraint(equalToConstant: 100).isActive = true
                i.heightAnchor.constraint(equalToConstant: 90).isActive = true
                i.translatesAutoresizingMaskIntoConstraints = false
            })
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
        
        
        button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        button.rightAnchor.constraint(equalTo: rightAnchor, constant: -25).isActive = true
    }
}

extension CardView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CardViewCell", for: indexPath) as! CardViewTableViewCell
        cell.textLabel?.text = "CardView Cell \(indexPath.row)"
        cell.backgroundColor = .clear
        cell.selectionStyle = .none
        cell.parent = HomeVC()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        parentViewController?.navigationController?.pushViewController(self.cellTo!, animated: true)
    }
}
