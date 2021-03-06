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
    
    var group: Group?
    var members: [User] = [User]()
    
    private var memberCollectionView: UICollectionView?
    
    let emptyView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        return view
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
    
    let descriptionLabel: UILabel = {
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
        view.backgroundColor = .clear
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
    
    let leaveGroup: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .white
        btn.setTitle("Leave Co-Living", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        btn.setTitleColor(UIColor.red, for: .normal)
        btn.layer.cornerRadius = 8
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = Constants().tab3Title
        self.view.backgroundColor = .secondarySystemBackground
        setupViews()
        fetchGroup()
//        if Core.shared.getGroupID() != "" {
//
//        } else {
//            setupEmptyView()
//        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    
    
    func fetchGroup() {
        presentor?.fetchGroup()
    }
    
    func setupViews() {
        emptyView.removeFromSuperview()
        
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
        setLeaveGroupBtn()
        scrollViewContainer.addArrangedSubview(leaveGroup)

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
        
        card2.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: card2.topAnchor, constant: 10).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: card2.leadingAnchor, constant: 20).isActive = true
        descriptionLabel.widthAnchor.constraint(equalToConstant: 290).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: card2.bottomAnchor, constant: -10).isActive = true
        
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
        card3.topAnchor.constraint(equalTo: card2.bottomAnchor, constant: 0).isActive = true
        card3.leadingAnchor.constraint(equalTo: card2.leadingAnchor).isActive = true
        card3.trailingAnchor.constraint(equalTo: card2.trailingAnchor).isActive = true
        card3.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        setMemberCollectionView()
    }
    
    func setMemberCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
//        layout.scrollDirection = .horizontal
        memberCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        memberCollectionView?.backgroundColor = .clear
        
        guard let memberCollectionView = memberCollectionView else {
            return
        }
        
        card3.addSubview(memberCollectionView)
        memberCollectionView.dataSource = self
        memberCollectionView.delegate = self
        memberCollectionView.register(MemberCollectionViewCell.self, forCellWithReuseIdentifier: MemberCollectionViewCell.identifier)
        memberCollectionView.collectionViewLayout = layout
        
        memberCollectionView.translatesAutoresizingMaskIntoConstraints = false
        memberCollectionView.topAnchor.constraint(equalTo: card3.topAnchor,constant: 20).isActive = true
        memberCollectionView.bottomAnchor.constraint(equalTo: card3.bottomAnchor,constant: -20).isActive = true
        memberCollectionView.leadingAnchor.constraint(equalTo: card3.leadingAnchor, constant: 20).isActive = true
        memberCollectionView.trailingAnchor.constraint(equalTo: card3.trailingAnchor,constant: -20).isActive = true
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
    
    func setLeaveGroupBtn() {
        view.addSubview(leaveGroup)

        leaveGroup.translatesAutoresizingMaskIntoConstraints = false
        leaveGroup.topAnchor.constraint(equalTo: qrButton.bottomAnchor, constant: 15).isActive = true
        leaveGroup.centerXAnchor.constraint(equalTo: qrButton.centerXAnchor).isActive = true
        leaveGroup.widthAnchor.constraint(equalToConstant: 315).isActive = true
        leaveGroup.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        leaveGroup.addTarget(self, action: #selector(leaveTap), for: .touchUpInside)
    }
    
    @objc func leaveTap() {
        presentor?.router?.leaveGroup(from: self)
    }
    
    func fetchUsers() {
        presentor?.fetchUsers(IDs: group!.users)
    }
}

extension ProfileVC: ProfilePresenterToViewProtocol {
    func didFetchUsers(users: [User]) {
        print("USERS: ",users)
        self.members = users
        
        DispatchQueue.main.async {
            self.memberCollectionView?.reloadData()
        }
    }
    
    func didFetchGroup(group: Group){
        print("GROUP: ",group)
        self.group = group
        print("TOTAL USERS: ",group.users)
        fetchUsers()
        
        DispatchQueue.main.async {
            self.nameLabel.text = group.name
            self.addressLabel.text = group.address
            self.descriptionLabel.text = group.description
        }
        DispatchQueue.main.async {
            Core.shared.groupIn(id: group.id, name: group.name, address: group.address, description: group.description, users: group.users)
        }
    }
}

extension ProfileVC: SignInDelegate {
    
}

extension ProfileVC: SignUpDelegate {
    
}


extension ProfileVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let users = group?.users {
            return users.count
        } else {
            return 0
        }
    }
    
    func getCollection() -> [GroupUser]{
        if let members = UserDefaults.standard.value(forKey: "groupMembers") as? Data {
            let array = try? PropertyListDecoder().decode(Array<GroupUser>.self, from: members)
            return array!
        }
        return [GroupUser(id: "", name: "")]
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MemberCollectionViewCell.identifier, for: indexPath) as! MemberCollectionViewCell
        let user = members[indexPath.row]
        cell.nameLabel.text = user.name
        return cell
    }
}
