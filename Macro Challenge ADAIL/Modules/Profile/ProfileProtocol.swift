//
//  ProfileProtocol.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 23/10/21.
//

import Foundation

protocol ProfileViewToPresenterProtocol: AnyObject {
    var view: ProfilePresenterToViewProtocol? { get set }
    var router: ProfilePresenterToRouterProtocol? { get set }
}

protocol ProfilePresenterToViewProtocol: AnyObject {
    
}

protocol ProfilePresenterToRouterProtocol: AnyObject {
    func createModule() -> ProfileVC
}
