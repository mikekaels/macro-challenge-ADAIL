//
//  SignUpProtocol.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 27/10/21.
//

import Foundation

public protocol SignUpDelegate {
    
}

protocol SignUpViewToPresenterProtocol: AnyObject {
    var view: SignUpPresenterToViewProtocol? { get set }
    var router: SignUpPresenterToRouterProtocol? { get set }
}

protocol SignUpPresenterToViewProtocol: AnyObject {
    
}

protocol SignUpPresenterToRouterProtocol: AnyObject {
    func createModule() -> SignUpVC
}
