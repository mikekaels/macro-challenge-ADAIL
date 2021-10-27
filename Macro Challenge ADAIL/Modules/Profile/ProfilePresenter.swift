//
//  ProfilePresenter.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 23/10/21.
//

import Foundation

class ProfilePresenter: ProfileViewToPresenterProtocol {
    var view: ProfilePresenterToViewProtocol?
    
    var router: ProfilePresenterToRouterProtocol?
    
    func goToSignIn(viewController: ProfileVC) {
        router?.goToSignIn(viewController: viewController)
    }
    
    func goToSignUp(viewController: ProfileVC) {
        router?.goToSignUp(viewController: viewController)
    }
}

