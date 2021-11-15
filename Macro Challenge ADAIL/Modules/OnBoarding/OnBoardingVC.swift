//
//  OnBoardingVC.swift
//  Macro Challenge ADAIL
//
//  Created by Sukma Risfa Sam Bima Yudha on 12/11/21.
//

import UIKit
import AuthenticationServices

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
        
        //Test
        newScene()
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
            
            Core.shared.signIn()
            newScene()
            
            break
        default:
            break
        }
    }
}

extension OnBoardingVC: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return view.window!
    }
}
