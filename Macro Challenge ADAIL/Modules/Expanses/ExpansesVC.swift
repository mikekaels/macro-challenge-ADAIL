//
//  ExpansesVC.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 11/11/21.
//

import UIKit

class ExpansesVC: UIViewController {
    
    var presentor: ExpansesViewToPresenterProtocol?
    public var delegate: ExpansesDelegate!
    
    let daysArray: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    let dayWeekMonth: [String] = ["Day", "Week", "Month"]
    
    let screenWidth = UIScreen.main.bounds.width - 10
    let screenHeight = UIScreen.main.bounds.height / 2
    var selectedDayRow = 0
    var selectedDayWeekMonth = 1
    
    let scrollView: EasyScrollView = {
        let s = EasyScrollView()
        s.backgroundColor = .secondarySystemBackground
        s.translatesAutoresizingMaskIntoConstraints = false
        return s
    }()
    
    let iconButton: UIButton = UIButton()
        .configure { b in
            b.setImage(UIImage(named: Asset.Icons.groceries.name), for: .normal)
            b.widthAnchor.constraint(equalToConstant: 25).isActive = true
            b.heightAnchor.constraint(equalToConstant: 25).isActive = true
            b.translatesAutoresizingMaskIntoConstraints = false
            b.addTarget(self, action: #selector(iconButtonTapped), for: .touchUpInside)
        }
    
    let transactionNameTextField: UITextField = UITextField()
        .configure { t in
            t.backgroundColor = .white
            t.layer.cornerRadius = 13
            t.layer.masksToBounds = true
            t.placeholder = "Transasction Name"
            t.heightAnchor.constraint(equalToConstant: 40).isActive = true
            
            t.clipsToBounds = true
            t.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 40))
            t.leftViewMode = .always
            t.rightViewMode = .always
        }
    
    let totalTransactionTextField: UITextField = UITextField()
        .configure { t in
            t.keyboardType = .numberPad
            t.backgroundColor = .white
            t.clipsToBounds = true
            t.layer.cornerRadius = 13
            t.layer.masksToBounds = true
            t.placeholder = "Total Transaction"
            t.heightAnchor.constraint(equalToConstant: 40).isActive = true
            t.clipsToBounds = true
            t.leftViewMode = .always
            
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
            l.text = "Payment Date"
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
    
    
    let remindMeAtTextField: UITextField = UITextField()
        .configure { t in
            t.placeholder = "Remind me before"
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
//            t.addTarget(self, action: #selector(remindMeAtSelected), for: .allEditingEvents)
        }
    
    let repeatBillTextField: UITextField = UITextField()
        .configure { t in
            t.placeholder = "Repeat bill"
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
        }
    
    let noteTextView: UITextView = UITextView()
        .configure { t in
//            t.backgroundColor = .green
            t.layer.cornerRadius = 13
            t.layer.masksToBounds = true
            t.heightAnchor.constraint(equalToConstant: 50).isActive = true
            t.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let imageButton: UIButton = UIButton()
        .configure { b in
                b.setImage(UIImage(systemName: "camera.circle"), for: .normal)
                b.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 48), forImageIn: .normal)
                b.tintColor = .systemBlue
                b.translatesAutoresizingMaskIntoConstraints = false
        }
    
    let imageInputView: UIView = UIView()
        .configure { v in
                v.translatesAutoresizingMaskIntoConstraints = false
                v.heightAnchor.constraint(equalToConstant: 120).isActive = true
        }
    
    @objc func buttonTapped() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scrollView.setupScrollView(in: self.view)

        scrollView.stack.configure { v in
            v.spacing = 10
            v.distribution = .fill
            v.axis = .vertical
            v.addArrangedSubview(UIStackView(arrangedSubviews: [UIView().configure(completion: { v in
//                v.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
                v.backgroundColor = .white
                v.layer.cornerRadius = 10
                
                v.translatesAutoresizingMaskIntoConstraints = false
                v.widthAnchor.constraint(equalToConstant: 50).isActive = true
                v.heightAnchor.constraint(equalToConstant: 40).isActive = true
                v.addSubview(self.iconButton)
                self.iconButton.centerXAnchor.constraint(equalTo: v.centerXAnchor).isActive = true
                self.iconButton.centerYAnchor.constraint(equalTo: v.centerYAnchor).isActive = true
            }), transactionNameTextField]).configure(completion: { v in
                v.spacing = 20
                v.alignment = .center
                v.distribution = .fill
                v.axis = .horizontal
                v.heightAnchor.constraint(equalToConstant: 50).isActive = true
                v.translatesAutoresizingMaskIntoConstraints = false
            }))
            v.addArrangedSubview(totalTransactionTextField)
            
            v.addArrangedSubview(UIStackView(arrangedSubviews: [paymentDateLabel, UIView().configure(completion: { v in
                v.addSubview(paymentDate)
                paymentDate.centerXAnchor.constraint(equalTo: v.centerXAnchor).isActive = true
                paymentDate.centerYAnchor.constraint(equalTo: v.centerYAnchor).isActive = true
            })]).configure(completion: { v in
                v.spacing = 20
                v.distribution = .fill
                v.axis = .horizontal
                v.heightAnchor.constraint(equalToConstant: 50).isActive = true
                v.translatesAutoresizingMaskIntoConstraints = false
            }))
            
            v.addArrangedSubview(UIStackView(arrangedSubviews: [remindMeAtTextField, repeatBillTextField]).configure(completion: { v in
                v.spacing = 20
                v.alignment = .center
                v.distribution = .fillProportionally
                v.axis = .horizontal
                v.heightAnchor.constraint(equalToConstant: 50).isActive = true
                v.translatesAutoresizingMaskIntoConstraints = false
            }))
            v.addArrangedSubview(UIStackView(arrangedSubviews: [UILabel().configure(completion: { l in
                l.text =  "Note"
                l.heightAnchor.constraint(equalToConstant: 20).isActive = true
                l.translatesAutoresizingMaskIntoConstraints = false
            }), noteTextView]).configure(completion: { s in
                s.spacing = 10
                s.axis = .vertical
                s.distribution = .fill
                s.translatesAutoresizingMaskIntoConstraints = false
            }))
            
            v.addArrangedSubview(imageInputView.configure(completion: { v in
                v.addSubview(imageButton)
                imageButton.centerXAnchor.constraint(equalTo: v.centerXAnchor).isActive = true
                imageButton.centerYAnchor.constraint(equalTo: v.centerYAnchor).isActive = true
            }))
        }
        
        scrollView.layoutSetting.widthMultiplier = 0.85
        scrollView.layoutSetting.top = 20
        scrollView.layoutSetting.bottom = -50
        
        remindMeAtTextField.delegate = self
        repeatBillTextField.delegate = self
        let remindmeTexfieldItems = UIMenu(title: "Remind me", options: .displayInline, children: [
            UIAction(title: "1 day before", image: nil, handler: { _ in
                self.remindMeAtTextField.text = "1 day before"
            }),
            UIAction(title: "1 week before", image: nil, handler: { _ in
                self.remindMeAtTextField.text = "1 week before"
            }),
            UIAction(title: "2 weeks before", image: UIImage(systemName: "nil"), handler: { _ in
                self.remindMeAtTextField.text = "2 week before"
            }),
            UIAction(title: "3 weeks before", image: UIImage(systemName: "nil"), handler: { _ in
                self.remindMeAtTextField.text = "3 week before"
            })
        ])
        
        remindMeAtTextField.rightView = UIButton()
            .configure { b in
                b.setTitleColor(.green, for: .normal)
                
                b.setImage(UIImage(systemName: "chevron.down"), for: .normal)

                b.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
                
                b.showsMenuAsPrimaryAction = true
                b.menu = remindmeTexfieldItems
                b.translatesAutoresizingMaskIntoConstraints = false
                b.widthAnchor.constraint(equalToConstant: 50).isActive = true
            }
        
        let repeatTexfieldItems = UIMenu(title: "Repeat Bill?", options: .displayInline, children: [
            UIAction(title: "Never", image: nil, handler: { _ in
                self.repeatBillTextField.text = "Never"
            }),
            UIAction(title: "Repeat", image: UIImage(systemName: "repeat"), handler: { _ in
                self.repeatBillTextField.text = "Repeat"
            })
        ])
        
        repeatBillTextField.rightView = UIButton()
            .configure { b in
                b.setTitleColor(.green, for: .normal)
                
                b.setImage(UIImage(systemName: "chevron.down"), for: .normal)

                b.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
                
                b.showsMenuAsPrimaryAction = true
                b.menu = repeatTexfieldItems
                b.translatesAutoresizingMaskIntoConstraints = false
                b.widthAnchor.constraint(equalToConstant: 50).isActive = true
            }
    }
    
    @objc func iconButtonTapped() {
        print("HElllllllllllllOOOOOOOOOO!!!")
    }
    
    @objc func remindMeAtSelected() {
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width: screenWidth, height: screenHeight)
        let pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight))
        pickerView.delegate = self
        pickerView.dataSource = self
        
        pickerView.selectRow(selectedDayRow, inComponent: 0, animated: false)
        pickerView.selectRow(selectedDayWeekMonth, inComponent: 1, animated: false)
        
        vc.view.addSubview(pickerView)
        pickerView.centerXAnchor.constraint(equalTo: vc.view.centerXAnchor).isActive = true
        pickerView.centerYAnchor.constraint(equalTo: vc.view.centerYAnchor).isActive = true
        
        let alert = UIAlertController(title: "Remind me before", message: "", preferredStyle: .actionSheet)
        
        alert.popoverPresentationController?.sourceView = remindMeAtTextField
        alert.popoverPresentationController?.sourceRect = remindMeAtTextField.bounds
        
        alert.setValue(vc, forKey: "contentViewController")
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        
        alert.addAction(UIAlertAction(title: "Select", style: .default , handler: { UIAlertAction in
            self.selectedDayRow = pickerView.selectedRow(inComponent: 0)
            self.selectedDayWeekMonth = pickerView.selectedRow(inComponent: 1)
            let selectedDays = Array(self.daysArray)[self.selectedDayRow]
            let selectedDayWeekMonth = Array(self.dayWeekMonth)[self.selectedDayWeekMonth]
            self.remindMeAtTextField.text = "\(selectedDays) \(selectedDayWeekMonth) Before"
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
}

extension ExpansesVC: ExpansesPresenterToViewProtocol {
    
}

extension ExpansesVC: ExpansesDelegate {
    
}

extension ExpansesVC: UITextFieldDelegate, UIPickerViewDataSource,UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        if component == 0 {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 30))
            label.text = Array(daysArray)[row]
            label.sizeToFit()
            return label
        } else if component == 1 {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 30))
            label.text = Array(dayWeekMonth)[row]
            label.sizeToFit()
            return label
        } else {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 30))
            label.text = "Before"
            label.sizeToFit()
            return label
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return daysArray.count
        } else if component == 1 {
            return dayWeekMonth.count
        } else {
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 60
    }
    
    
    // Text Field
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == remindMeAtTextField {
            self.view.endEditing(true)
        } else if textField == repeatBillTextField {
            self.view.endEditing(true)
        }
    }
}

