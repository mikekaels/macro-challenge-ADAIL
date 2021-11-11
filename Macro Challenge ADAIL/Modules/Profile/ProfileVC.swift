//
//  ProfileVC.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 23/10/21.
//

import UIKit
import AuthenticationServices

class ProfileVC: UIViewController {
    var presentor: ProfileViewToPresenterProtocol?
    public var delegate: ProfileDelegate!
    
    private let signInButton = ASAuthorizationAppleIDButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        self.title = Constants().tab3Title
        
        signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        setupView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        signInButton.frame = CGRect(x: 0, y: 0, width: 250, height: 50)
        signInButton.center = view.center
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
    
    func setupView() {
        view.addSubview(signInButton)
//        self.view.addSubview(textLabel)
//        textLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
//        self.view.addSubview(bgImg)w
//        bgImg.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        bgImg.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
//        self.view.addSubview(singUpButton)
//        singUpButton.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 50)
//            .isActive = true
//        singUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36)
//            .isActive = true
//        singUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -36)
//            .isActive = true
        
//        self.view.addSubview(signInButton)
//        signInButton.topAnchor.constraint(equalTo: singUpButton.bottomAnchor, constant: 20)
//            .isActive = true
//        signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36)
//            .isActive = true
//        signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -36)
//            .isActive = true
        
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
