//
//  SignInProtocol.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 27/10/21.
//

import Foundation

public protocol SignInDelegate {
    
}

protocol SignInViewToPresenterProtocol: AnyObject {
    var view: SignInPresenterToViewProtocol? { get set }
    var router: SignInPresenterToRouterProtocol? { get set }
}

protocol SignInPresenterToViewProtocol: AnyObject {
    
}

protocol SignInPresenterToRouterProtocol: AnyObject {
    func createModule() -> SignInVC
}
