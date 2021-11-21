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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        title = "Detail Yudha's Debt"
        // Do any additional setup after loading the view.
        setupViews()
    }
    
    func setupViews() {
        self.setupScrollView()
        scrollViewContainer.addArrangedSubview(
            UIStackView(arrangedSubviews: [
                UIView().configure(completion: { s in
                    s.backgroundColor = .blue
                    s.layer.cornerRadius = 30
                    s.widthAnchor.constraint(equalToConstant: 60).isActive = true
                    s.heightAnchor.constraint(equalToConstant: 60).isActive = true
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
                    
                    t.layer.cornerRadius = 10
                    t.heightAnchor.constraint(equalToConstant: 30).isActive = true
                    t.widthAnchor.constraint(equalToConstant: 100).isActive = true
                    t.translatesAutoresizingMaskIntoConstraints = false
                })])
                    .configure(completion: { v in
                        v.spacing = 10
                        v.alignment = .center
                        v.distribution = .fill
                        v.axis = .vertical
//                        v.backgroundColor = .yellow
//                        v.heightAnchor.constraint(equalToConstant: 100).isActive = true
                        v.translatesAutoresizingMaskIntoConstraints = false
                    })
            ]).configure(completion: { s in
                s.axis = .horizontal
                s.alignment = .center
                s.spacing = 30
                s.distribution = .fillProportionally
                s.heightAnchor.constraint(equalToConstant: 100).isActive = true
                s.translatesAutoresizingMaskIntoConstraints = false
//                s.backgroundColor = .red
            })
        )
        
        scrollViewContainer.addArrangedSubview(
            UIStackView(arrangedSubviews: [
                installPaymentLabel,
                totalAmountInstallPaymentTextField.configure(completion: { v in
                    
                }),
                paymentDate
            ]).configure(completion: { v in
                v.spacing = 10
                v.axis = .vertical
                v.distribution = .fill
            })
        )
        
        
        
        //        self.scrollView.setupScrollView(in: self.view)
        //
        //        scrollView.stack.configure { v in
        //            v.spacing = 20
        //            v.distribution = .fill
        //            v.axis = .vertical
        //
        //            v.addArrangedSubview(
        //                UIStackView(arrangedSubviews: [
        //                    UIView().configure(completion: { s in
        //                        s.backgroundColor = .blue
        //                        s.layer.cornerRadius = 25
        //                        s.widthAnchor.constraint(equalToConstant: 50).isActive = true
        //                        s.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //                        s.translatesAutoresizingMaskIntoConstraints = false
        //
        //                        s.addSubview(self.profileImage)
        //                        profileImage.centerXAnchor.constraint(equalTo: s.centerXAnchor).isActive = true
        //                        profileImage.centerYAnchor.constraint(equalTo: s.centerYAnchor).isActive = true
        //                    }),
        //                    UIStackView(arrangedSubviews: [totalTextfield
        //                                                    .configure(completion: { t in
        //                                                        t.text = "Hahaha"
        //                                                    }), paidAllButton])
        //                        .configure(completion: { v in
        //                            v.spacing = 10
        //                            v.distribution = .fill
        //                            v.axis = .vertical
        //                            v.backgroundColor = .green
        //                        })
        //                ]).configure(completion: { s in
        //                    s.axis = .horizontal
        //                    s.distribution = .fill
        //                    s.heightAnchor.constraint(equalToConstant: 100).isActive = true
        //                    s.translatesAutoresizingMaskIntoConstraints = false
        //                })
        //            )
        //
        //            v.addArrangedSubview(
        //                UIStackView(arrangedSubviews: [
        //                    installPaymentLabel,
        //                    totalAmountInstallPaymentTextField,
        //                    paymentDate
        //                ]).configure(completion: { v in
        //                    v.axis = .vertical
        //                    v.distribution = .fill
        //                })
        //            )
        //        }
        //
        //        scrollView.layoutSetting.widthMultiplier = 0.85
        //        scrollView.layoutSetting.top = 20
        //        scrollView.layoutSetting.bottom = -50
    }
    
    func setupScrollView() {
        
        self.view.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)
        
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 50).isActive = true
        scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        scrollViewContainer.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.90).isActive = true
        scrollViewContainer.spacing = 20
    }
    
}

extension FriendsDebtVC: FriendsDebtPresenterToViewProtocol {
    
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

