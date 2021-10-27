//
//  SignInRouter.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 27/10/21.
//

import Foundation

class SignInRouter: SignInPresenterToRouterProtocol {
    public static let shared = SignInRouter()
    
    public func initialize() -> SignInVC {
        return createModule()
    }
    
    func createModule() -> SignInVC {
        let view = SignInVC()
        
        let presenter: SignInViewToPresenterProtocol = SignInPresenter()
        
        let router: SignInPresenterToRouterProtocol = SignInRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        
        return view
    }
}
