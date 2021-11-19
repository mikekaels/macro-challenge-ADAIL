//
//  ProfileVC.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 23/10/21.
//

import UIKit
import AuthenticationServices
import AVFoundation

class ProfileVC: UIViewController {
    var presentor: ProfileViewToPresenterProtocol?
    public var delegate: ProfileDelegate!
    
    private let signInButton = ASAuthorizationAppleIDButton()
    
    //Test
    var isGroup: Bool = false
    
    var members: [Member] = []
    private var memberCollectionView: UICollectionView?
    
    let card1: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        return view
    }()
    
    let image: UIImageView = {
        let image = UIImage(named: "GroupImage")
        let view = UIImageView(image: image)
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Kos Ibu Wati"
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Jakarta Barat"
        label.font = .systemFont(ofSize: 17)
        label.numberOfLines = 2
        return label
    }()
    
    let chevronBtnCard1: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        return btn
    }()
    
    let card2: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        return view
    }()
    
    let aboutLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text =
        "Anda sopan kami pun segan, tolong patuhi peraturan yang sudah disepakati dan jangan lupa bayar uang kontrakan"
        label.font = .systemFont(ofSize: 17)
        label.numberOfLines = 4
        return label
    }()
    
    let chevronBtnCard2: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        return btn
    }()
    
    let card3: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        return view
    }()
    
    let qrButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .systemBlue
        btn.setTitle("Show QR Code", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.layer.cornerRadius = 8
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Constants().tab3Title
        self.view.backgroundColor = .secondarySystemBackground
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        if isGroup {
            members = [
                Member(image: UIImage(named: "GroupImage")!, name: "Budi"),
                Member(image: UIImage(named: "GroupImage")!, name: "Budi"),
                Member(image: UIImage(named: "GroupImage")!, name: "Budi"),
                Member(image: UIImage(named: "GroupImage")!, name: "Budi"),
                Member(image: UIImage(named: "GroupImage")!, name: "Budi"),
                Member(image: UIImage(named: "GroupImage")!, name: "Budi"),
                Member(image: UIImage(named: "GroupImage")!, name: "Budi")]
            setupView()
        } else {
            setupEmptyView()
        }
    }
    
    func setupView() {
        setCard1()
        setCard2()
        setCard3()
        setQRButton()
    }
    
    func setCard1() {
        view.addSubview(card1)
        card1.translatesAutoresizingMaskIntoConstraints = false
        card1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        card1.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 15).isActive = true
        card1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        card1.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        card1.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.centerYAnchor.constraint(equalTo: card1.centerYAnchor).isActive = true
        image.leadingAnchor.constraint(equalTo: card1.leadingAnchor, constant: 10).isActive = true
        
        card1.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: image.topAnchor, constant: 10).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 25).isActive = true
        
        card1.addSubview(addressLabel)
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 12).isActive = true
        addressLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 25).isActive = true
        addressLabel.widthAnchor.constraint(equalToConstant: 215).isActive = true
        
        card1.addSubview(chevronBtnCard1)
        chevronBtnCard1.translatesAutoresizingMaskIntoConstraints = false
        chevronBtnCard1.centerYAnchor.constraint(equalTo: card1.centerYAnchor).isActive = true
        chevronBtnCard1.trailingAnchor.constraint(equalTo: card1.trailingAnchor, constant: -20).isActive = true
    }
    
    func setCard2() {
        view.addSubview(card2)
        card2.translatesAutoresizingMaskIntoConstraints = false
        card2.topAnchor.constraint(equalTo: card1.bottomAnchor, constant: 15).isActive = true
        card2.leadingAnchor.constraint(equalTo: card1.leadingAnchor).isActive = true
        card2.trailingAnchor.constraint(equalTo: card1.trailingAnchor).isActive = true
        card2.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        card2.addSubview(aboutLabel)
        aboutLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutLabel.topAnchor.constraint(equalTo: card2.topAnchor, constant: 10).isActive = true
        aboutLabel.leadingAnchor.constraint(equalTo: card2.leadingAnchor, constant: 20).isActive = true
        aboutLabel.widthAnchor.constraint(equalToConstant: 290).isActive = true
        aboutLabel.bottomAnchor.constraint(equalTo: card2.bottomAnchor, constant: -10).isActive = true
        
        card2.addSubview(chevronBtnCard2)
        chevronBtnCard2.translatesAutoresizingMaskIntoConstraints = false
        chevronBtnCard2.centerYAnchor.constraint(equalTo: card2.centerYAnchor).isActive = true
        chevronBtnCard2.trailingAnchor.constraint(equalTo: card2.trailingAnchor, constant: -20).isActive = true
    }
    
    func setCard3() {
        view.addSubview(card3)
        card3.translatesAutoresizingMaskIntoConstraints = false
        card3.topAnchor.constraint(equalTo: card2.bottomAnchor, constant: 15).isActive = true
        card3.leadingAnchor.constraint(equalTo: card2.leadingAnchor).isActive = true
        card3.trailingAnchor.constraint(equalTo: card2.trailingAnchor).isActive = true
        card3.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        setMemberCollectionView()
    }
    
    func setMemberCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.scrollDirection = .horizontal
        memberCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        guard let memberCollectionView = memberCollectionView else {
            return
        }
        
        card3.addSubview(memberCollectionView)
        memberCollectionView.dataSource = self
        memberCollectionView.delegate = self
        memberCollectionView.register(MemberCollectionViewCell.self, forCellWithReuseIdentifier: MemberCollectionViewCell.identifier)
        memberCollectionView.collectionViewLayout = layout
        
        memberCollectionView.translatesAutoresizingMaskIntoConstraints = false
        memberCollectionView.topAnchor.constraint(equalTo: card3.topAnchor).isActive = true
        memberCollectionView.bottomAnchor.constraint(equalTo: card3.bottomAnchor).isActive = true
        memberCollectionView.leadingAnchor.constraint(equalTo: card3.leadingAnchor).isActive = true
        memberCollectionView.trailingAnchor.constraint(equalTo: card3.trailingAnchor).isActive = true
    }
    
    func setQRButton() {
        view.addSubview(qrButton)
        
        qrButton.translatesAutoresizingMaskIntoConstraints = false
        qrButton.topAnchor.constraint(equalTo: card3.bottomAnchor, constant: 15).isActive = true
        qrButton.centerXAnchor.constraint(equalTo: card3.centerXAnchor).isActive = true
        qrButton.widthAnchor.constraint(equalToConstant: 315).isActive = true
        qrButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}

extension ProfileVC: ProfilePresenterToViewProtocol {
    
}

extension ProfileVC: SignInDelegate {
    
}

extension ProfileVC: SignUpDelegate {
    
}

extension ProfileVC: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("FAILED")
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let credentials as ASAuthorizationAppleIDCredential:
            
            if let firstname = credentials.fullName?.givenName {
                print(firstname)
            }
            
            if let lastname = credentials.fullName?.familyName {
                print(lastname)
            }
            
            if let email = credentials.email {
                print(email)
            }
            
            let user = credentials.user
            print(user)
            
            break
        default:
            break
        }
    }
}

extension ProfileVC: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return view.window!
    }
}
