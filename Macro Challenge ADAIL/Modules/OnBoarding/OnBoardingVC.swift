//
//  OnBoardingVC.swift
//  Macro Challenge ADAIL
//
//  Created by Sukma Risfa Sam Bima Yudha on 12/11/21.
//

import UIKit
import AuthenticationServices
import CloudKit

struct OnBoardingItem {
    let title: String
    let image: UIImage
    let Desc: String
}


class OnBoardingVC: UIViewController {
    var presentor: OnBoardingViewToPresenterProtocol?
    private let signInButton = ASAuthorizationAppleIDButton()
    private var collectionView: UICollectionView?
    var onBoarding: [OnBoardingItem] = []
    var currentPage = 0 {
        didSet {
            pageControl.currentPage = currentPage
            if (currentPage != onBoarding.count - 1) {
                signInButton.isHidden = true
                nextButton.isHidden = false
                pageControl.currentPage = currentPage
            } else {
                signInButton.isHidden = false
                nextButton.isHidden = true
                pageControl.currentPage = currentPage
            }
        }
    }
    
    
    private let database = CKContainer(identifier: "iCloud.Marvelous.CoFi").privateCloudDatabase
    private let record = CKRecord(recordType: "User")
    private var userId: CKRecord.ID?
    private var isTrue: Bool?
    
    
    
    let pageControl: UIPageControl = {
        let control = UIPageControl()
        control.translatesAutoresizingMaskIntoConstraints = false
        control.tintColor = .systemBlue
        control.currentPageIndicatorTintColor = .black
        control.pageIndicatorTintColor = .gray
        control.numberOfPages = 3
        return control
    }()
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.setTitle("Next", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        onBoarding = [
            OnBoardingItem(title: L10n.onB1Title, image: UIImage(named: "oB1")!, Desc: L10n.onB1Desc),
            OnBoardingItem(title: L10n.onB2Title, image: UIImage(named: "oB2")!, Desc: L10n.onB2Desc),
            OnBoardingItem(title: L10n.onB3Title, image: UIImage(named: "oB3")!, Desc: L10n.onB3Desc)
        ]
        setupView()
    }
    
    
    
    @objc func didTapSignIn() {
        let provider = ASAuthorizationAppleIDProvider()
        let request = provider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.presentationContextProvider = self
        controller.performRequests()
    }
    
    @objc func nextTap() {
        currentPage += 1
        let indexPath = IndexPath(item: currentPage, section: 0)
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    func setupView() {
        view.backgroundColor = .systemBackground
        setupCollectionView()
        
        view.addSubview(pageControl)
        pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 50).isActive = true
        pageControl.widthAnchor.constraint(equalToConstant: 315).isActive = true
        
        view.addSubview(nextButton)
        nextButton.addTarget(self, action: #selector(nextTap), for: .touchUpInside)
        
        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 315).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant:  -20).isActive = true
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(signInButton)
        signInButton.isHidden = true
        signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        signInButton.widthAnchor.constraint(equalToConstant: 315).isActive = true
        signInButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant:  -20).isActive = true
        signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: view.frame.width, height: view.frame.height)
        layout.minimumLineSpacing = .zero
        layout.minimumInteritemSpacing = .zero
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = collectionView else {
            return
        }
        
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(OnBoardingCollectionViewCell.self, forCellWithReuseIdentifier: "OnBoarding")
        collectionView.collectionViewLayout = layout
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        collectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    func newScene() {
        self.view.window?.rootViewController = TabBarRouter().createModule()
        self.view.window?.makeKeyAndVisible()
    }
}

extension OnBoardingVC: OnBoardingPresenterToViewProtocol {
    func didFetchUser(user: User) {
        Core.shared.signIn(id: user.id, name: user.name, email: user.email)
        DispatchQueue.main.async {
            self.presentor?.goToDashboard(from: self)
        }
        
    }
    
    func didSaveUser(user: User) {
        Core.shared.signIn(id: user.id, name: user.name, email: user.email)
        DispatchQueue.main.async {
            self.presentor?.goToDashboard(from: self)
        }
        
    }
    
}

extension OnBoardingVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onBoarding.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnBoarding", for: indexPath) as! OnBoardingCollectionViewCell
        cell.setItem(onBoarding[indexPath.row])
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentPage = Int(scrollView.contentOffset.x / width)
    }
    
}

extension OnBoardingVC: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("FAILED")
        
        presentor?.saveUser(id: "00000", name: "Yudha", email: "yudha@aja")
        
        //Test
        newScene()
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let credentials as ASAuthorizationAppleIDCredential :
            
            var nameUser: String = ""
            var emailUser: String = ""
            
            if let firstname = credentials.fullName?.givenName {
                nameUser = firstname
                print(firstname)
            }
            
            if let lastname = credentials.fullName?.familyName {
                nameUser = "\(nameUser) \(lastname)"
                print(lastname)
            }
            
            if let email = credentials.email {
                emailUser = email
                print(email)
            }
            
            let user = credentials.user
            if emailUser == "" {
                presentor?.fetchUser(id: user)
            } else {
                presentor?.saveUser(id: user, name: nameUser, email: emailUser)
            }
            break
        default:
            break
        }
    }
    
//    func fetchUser(user: String, name: String, email: String){
//        userId = CKRecord.ID(recordName: user)
//        database.fetch(withRecordID: userId!, completionHandler: { record, error in
//            if let record = record {
//                print("Record with ID \(record.recordID.recordName) was fetched.")
//                if let name = record["name"] as? String {
//                    Core.shared.signIn(user: record.recordID.recordName, name: name, email: record["email"] as! String)
//                    print("user: \(record.recordID.recordName), name: \(name), email: \(record["email"] as! String)")
//                }
//            } else {
//                print("error \(self.userId!)")
//                self.saveUser(name: name, email: email, user: user)
//            }
//        })
//    }
//
//    func saveUser(name: String, email: String, user: String) {
//        userId = CKRecord.ID(recordName: user)
//        let userRecord = CKRecord(recordType: "UserType", recordID: userId!)
//        userRecord["name"] = name
//        userRecord["email"] = email
//
//        let saveOperation = CKModifyRecordsOperation(recordsToSave: [userRecord])
//        saveOperation.savePolicy = .allKeys
//
//        saveOperation.perRecordCompletionBlock = { record, error in
//            print("Record with ID \(record.recordID.recordName) was saved.")
//
//            if let error = error {
//                self.reportError(error)
//            }
//            self.fetchUser(user: user, name: name, email: email)
//        }
//
//        database.add(saveOperation)
//    }
    
    
    private func reportError(_ error: Error) {
        guard let ckerror = error as? CKError else {
            print("Not a CKError: \(error.localizedDescription)")
            return
        }

        switch ckerror.code {
        case .partialFailure:
            // Iterate through error(s) in partial failure and report each one.
            let dict = ckerror.userInfo[CKPartialErrorsByItemIDKey] as? [NSObject: CKError]
            if let errorDictionary = dict {
                for (_, error) in errorDictionary {
                    reportError(error)
                }
            }

        // This switch could explicitly handle as many specific errors as needed, for example:
        case .unknownItem:
            print("CKError: Record not found.")

        case .notAuthenticated:
            print("CKError: An iCloud account must be signed in on device or Simulator to write to a PrivateDB.")

        case .permissionFailure:
            print("CKError: An iCloud account permission failure occured.")

        case .networkUnavailable:
            print("CKError: The network is unavailable.")

        default:
            print("CKError: \(error.localizedDescription)")
        }
    }
    
}

extension OnBoardingVC: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return view.window!
    }
}
