//
//  ProfileProtocol.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 23/10/21.
//

import Foundation

public protocol ProfileDelegate{
    
}

protocol ProfileViewToPresenterProtocol: AnyObject {
    var view: ProfilePresenterToViewProtocol? { get set }
    var router: ProfilePresenterToRouterProtocol? { get set }
    
    func goToSignIn(viewController: ProfileVC)
    func goToSignUp(viewController: ProfileVC)
}

protocol ProfilePresenterToViewProtocol: AnyObject {
    
}

protocol ProfilePresenterToRouterProtocol: AnyObject {
    func createModule() -> ProfileVC
    func goToSignIn(viewController: ProfileVC)
    func goToSignUp(viewController: ProfileVC)
}
