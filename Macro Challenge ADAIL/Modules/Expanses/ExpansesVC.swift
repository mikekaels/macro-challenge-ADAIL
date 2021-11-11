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
    
    let scrollView: EasyScrollView = {
        let s = EasyScrollView()
        s.backgroundColor = .systemMint
        return s
    }()
    
    let stackView: UIStackView = UIStackView()
        .configure { (v) in
            v.axis = .horizontal
            v.distribution = .fillProportionally
        }
    
    let iconButton: UIButton = UIButton()
        .configure { b in
//            b.titleLabel = ""
            b.setImage(UIImage(named: Asset.Icons.groceries.name), for: .normal)
            b.leftAnchor.constraint(equalTo: <#T##NSLayoutAnchor<NSLayoutXAxisAnchor>#>, constant: <#T##CGFloat#>)
        }
    
    let transactionNameTextField: UITextField = UITextField()
        .configure { t in
            t.backgroundColor = .white
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.setupScrollView(in: self.view)
        
        stackView.addArrangedSubview(iconButton)
        stackView.addArrangedSubview(transactionNameTextField)
        
        
        scrollView.stack.configure { v in
            v.spacing = 20
//            v.distribution = .fillProportionally
            v.addArrangedSubview(stackView)
            v.addArrangedSubview(stackView)
        }
    }

}

extension ExpansesVC: ExpansesPresenterToViewProtocol {
    
}

extension ExpansesVC: ExpansesDelegate {
    
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct SwiftUIViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        return ExpansesRouter().createModule().view
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

