//
//  ProfileRouter.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 23/10/21.
//

import Foundation

class ProfileRouter: ProfilePresenterToRouterProtocol {
    
    public static let shared = ProfileRouter()
    
    public func initialize() -> ProfileVC {
        return createModule()
    }
    
    func createModule() -> ProfileVC {
        let view = ProfileVC()
        
        let presenter: ProfileViewToPresenterProtocol = ProfilePresenter()
        
        let router: ProfilePresenterToRouterProtocol = ProfileRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        
        
        return view
    }
    
    func goToSignIn(viewController: ProfileVC) {
        let vc = SignInRouter.shared.initialize()
        vc.delegate = viewController
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToSignUp(viewController: ProfileVC) {
        let vc = SignUpRouter.shared.initialize()
        vc.delegate = viewController
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
}
