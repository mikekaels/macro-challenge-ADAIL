//
//  SignUpRouter.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 27/10/21.
//

import Foundation

class SignUpRouter: SignUpPresenterToRouterProtocol {
    public static let shared = SignUpRouter()
    
    public func initialize() -> SignUpVC {
        return createModule()
    }
    
    func createModule() -> SignUpVC {
        let view = SignUpVC()
        
        let presenter: SignUpViewToPresenterProtocol = SignUpPresenter()
        
        let router: SignUpPresenterToRouterProtocol = SignUpRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        
        return view
    }
}

