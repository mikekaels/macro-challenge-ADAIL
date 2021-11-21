//
//  FriendsDebtVC.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 19/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class FriendsDebtVC: UIViewController {
    var presentor: FriendsDebtViewToPresenterProtocol?
    public var delegate: FriendsDebtDelegate!
    
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
            v.image = Asset.Images.profileImage.image
            v.layer.cornerRadius = 25
            v.heightAnchor.constraint(equalToConstant: 50).isActive = true
            v.widthAnchor.constraint(equalToConstant: 50).isActive = true
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let totalTextfield: UITextField = UITextField()
        .configure { v in
            v.text = "35.000"
            v.backgroundColor = .white
            v.layer.cornerRadius = 13
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0)).configure { v in
                v.widthAnchor.constraint(equalToConstant: 40).isActive = true
                v.heightAnchor.constraint(equalToConstant: v.frame.height).isActive = true
                v.translatesAutoresizingMaskIntoConstraints = false
            }
            
            let rp = UILabel()
                .configure { l in
                    l.text = "Rp"
                    l.textColor = .systemGray3
                    l.center = view.center
                    l.translatesAutoresizingMaskIntoConstraints = false
                }
            
            v.leftViewMode = .always
            v.leftView = view
            
            view.addSubview(rp)
            rp.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            rp.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            
            //            v.heightAnchor.constraint(equalToConstant: 40).isActive = true
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let paidAllButton: UIButton = UIButton()
        .configure { v in
            v.setTitle("All Paid", for: .normal)
            v.setTitleColor(.blue, for: .normal)
            v.backgroundColor = Asset.blueLight.color
            
            v.layer.cornerRadius = 10
            v.heightAnchor.constraint(equalToConstant: 30).isActive = true
            v.widthAnchor.constraint(equalToConstant: 100).isActive = true
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let installPaymentLabel: UILabel = UILabel()
        .configure{ t in
            t.text = "Install payment"
            t.heightAnchor.constraint(equalToConstant: 20).isActive = true
            t.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let totalAmountInstallPaymentTextField: UITextField = UITextField()
        .configure { v in
            v.placeholder = "Total Amount"
            v.backgroundColor = .white
            v.layer.cornerRadius = 10
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0)).configure { v in
                v.widthAnchor.constraint(equalToConstant: 15).isActive = true
                v.heightAnchor.constraint(equalToConstant: v.frame.height).isActive = true
                v.translatesAutoresizingMaskIntoConstraints = false
            }
            
            v.leftViewMode = .always
            v.leftView = view
            
            v.heightAnchor.constraint(equalToConstant: 40).isActive = true
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let paymentDate: UIDatePicker = UIDatePicker()
        .configure { d in
            d.contentHorizontalAlignment = .left
            d.datePickerMode = .dateAndTime
            d.preferredDatePickerStyle = .compact
            d.timeZone = NSTimeZone.local
            d.backgroundColor = UIColor.clear
            d.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let submitButton: UIButton = UIButton()
        .configure { v in
            v.setTitle("submit", for: .normal)
            v.setTitleColor(.blue, for: .normal)
            v.backgroundColor = Asset.blueLight.color
            
            v.layer.cornerRadius = 10
            v.heightAnchor.constraint(equalToConstant: 30).isActive = true
            v.widthAnchor.constraint(equalToConstant: 100).isActive = true
            v.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let tableView: UITableView = UITableView()
        .configure { t in
            t.backgroundColor = .clear
            t.register(CardViewTableViewCell.self, forCellReuseIdentifier: "cell")
            t.register(UITableViewCell.self, forCellReuseIdentifier: "seeMore")
            t.isScrollEnabled = false
            t.separatorStyle = .none
            t.translatesAutoresizingMaskIntoConstraints = false
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        title = "Detail Yudha's Debt"
        // Do any additional setup after loading the view.
        setupViews()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setupViews() {
        self.setupScrollView()
        scrollViewContainer.addArrangedSubview(
            UIStackView(arrangedSubviews: [
                UIView().configure(completion: { s in
                    s.backgroundColor = .blue
                    s.layer.cornerRadius = 35
                    s.widthAnchor.constraint(equalToConstant: 70).isActive = true
                    s.heightAnchor.constraint(equalToConstant: 70).isActive = true
                    s.translatesAutoresizingMaskIntoConstraints = false
                    
                    s.addSubview(self.profileImage)
                    profileImage.centerXAnchor.constraint(equalTo: s.centerXAnchor).isActive = true
                    profileImage.centerYAnchor.constraint(equalTo: s.centerYAnchor).isActive = true
                }),
                UIStackView(arrangedSubviews: [
                    totalTextfield.configure(completion: { t in
                        t.heightAnchor.constraint(equalToConstant: 40).isActive = true
                        t.widthAnchor.constraint(equalToConstant: 500).isActive = true
                    }), paidAllButton.configure(completion: { t in
                    })])
                    .configure(completion: { v in
                        v.spacing = 10
                        v.alignment = .trailing
                        v.distribution = .fill
                        v.axis = .vertical
                        //                        v.backgroundColor = .yellow
                        //                        v.heightAnchor.constraint(equalToConstant: 100).isActive = true
                        v.translatesAutoresizingMaskIntoConstraints = false
                    })
            ]).configure(completion: { s in
                s.axis = .horizontal
                s.alignment = .center
                s.spacing = 20
                s.distribution = .fillProportionally
                s.heightAnchor.constraint(equalToConstant: 100).isActive = true
                s.translatesAutoresizingMaskIntoConstraints = false
                //                s.backgroundColor = .red
            })
        )
        
        scrollViewContainer.addArrangedSubview(
            UIStackView(arrangedSubviews: [
                installPaymentLabel,
                totalAmountInstallPaymentTextField
                    .configure(completion: { v in
                        
                    }),
                paymentDate,
                submitButton
            ]).configure(completion: { v in
                v.spacing = 10
                v.axis = .vertical
                v.distribution = .fill
            })
        )
        
        //        scrollViewContainer.addArrangedSubview(UIView().configure(completion: { v in
        //            v.addSubview(tableView)
        //            tableView.backgroundColor = .blue
        //            v.backgroundColor = .red
        //            v.translatesAutoresizingMaskIntoConstraints = false
        //            v.heightAnchor.constraint(equalToConstant: 200).isActive = true
        //
        //        }))
        
        scrollViewContainer.addArrangedSubview(tableView)
        tableView.heightAnchor.constraint(equalToConstant: 500).isActive = true
    }
    
    func setupScrollView() {
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20).isActive = true
        scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        scrollViewContainer.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.90).isActive = true
        scrollViewContainer.spacing = 20
    }
    
}

extension FriendsDebtVC: FriendsDebtPresenterToViewProtocol {
    
}

extension FriendsDebtVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Debt History"
        case 1:
            return "Paid History"
        default:
            return ""
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 3 {
            let cell = UITableViewCell(style: .default, reuseIdentifier: "seeMore")
            cell.textLabel?.text = "See More"
            cell.textLabel?.textAlignment = .right
            cell.textLabel?.textColor = .systemBlue
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CardViewTableViewCell
            cell.textLabel?.text = "CardView Cell \(indexPath.row)"
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            cell.parent = FriendsDebtVC()
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 3:
            return 20
        default:
            return 55
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct SwiftUIViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        return FriendsDebtRouter().createModule().view
    }
    
    func updateUIView(_ view: UIView, context: Context) {
        
    }
}

@available(iOS 13.0, *)
struct SwiftLeeViewController_Preview: PreviewProvider {
    static var previews: some View {
        SwiftUIViewRepresentable()
    }
}
#endif

