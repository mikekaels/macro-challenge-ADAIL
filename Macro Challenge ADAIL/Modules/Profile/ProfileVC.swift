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
    var isGroup: Bool = true
    
    var members: [Member] = []
    private var memberCollectionView: UICollectionView?
    
    
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
    
    let signOut: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .white
        btn.setTitle("Sign Out", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        btn.setTitleColor(UIColor.red, for: .normal)
        btn.layer.cornerRadius = 8
        return btn
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Constants().tab3Title
        self.view.backgroundColor = .secondarySystemBackground
        
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
        self.view.addSubview(scrollView)
        
        
        scrollView.addSubview(scrollViewContainer)
        setCard1()
        scrollViewContainer.addArrangedSubview(card1)
        setCard2()
        scrollViewContainer.addArrangedSubview(card2)
        setCard3()
        scrollViewContainer.addArrangedSubview(card3)
        setQRButton()
        scrollViewContainer.addArrangedSubview(qrButton)
        setSignOutButton()
        scrollViewContainer.addArrangedSubview(signOut)

        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
//        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        //        scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        //        scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 50).isActive = true
        scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -50).isActive = true
        // Important!
        scrollViewContainer.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.90).isActive = true
        //        scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -50).isActive = true
        scrollViewContainer.spacing = 20
    }
    
    func setCard1() {
        view.addSubview(card1)
        card1.translatesAutoresizingMaskIntoConstraints = false
        card1.heightAnchor.constraint(equalToConstant: 100).isActive = true
        card1.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -30).isActive = true
        card1.topAnchor.constraint(equalTo: scrollViewContainer.topAnchor, constant: -30).isActive = true
        
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
        
        chevronBtnCard1.addTarget(self, action: #selector(card1Tap), for: .touchUpInside)
    }
    
    @objc func card1Tap() {
        presentor?.router?.goToDetailSpace(from: self)
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
        chevronBtnCard2.addTarget(self, action: #selector(card2Tap), for: .touchUpInside)
    }
    
    @objc func card2Tap() {
        presentor?.router?.goToDescSpace(from: self)
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
        
        qrButton.addTarget(self, action: #selector(qrTap), for: .touchUpInside)
    }
    
    @objc func qrTap() {
        presentor?.router?.goToShowQR(from: self)
    }
    
    func setSignOutButton() {
        view.addSubview(signOut)

        signOut.translatesAutoresizingMaskIntoConstraints = false
        signOut.topAnchor.constraint(equalTo: qrButton.bottomAnchor, constant: 15).isActive = true
        signOut.centerXAnchor.constraint(equalTo: qrButton.centerXAnchor).isActive = true
        signOut.widthAnchor.constraint(equalToConstant: 315).isActive = true
        signOut.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        signOut.addTarget(self, action: #selector(signOutTap), for: .touchUpInside)
    }
    
    @objc func signOutTap() {
        presentor?.router?.signOut(from: self)
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
