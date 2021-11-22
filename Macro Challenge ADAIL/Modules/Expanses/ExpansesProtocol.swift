//
//  ExpansesProtocol.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 11/11/21.
//

import Foundation

public protocol ExpansesDelegate {
    
}

protocol ExpansesViewToPresenterProtocol: AnyObject {
    var view: ExpansesPresenterToViewProtocol? { get set }
    var router: ExpansesPresenterToRouterProtocol? { get set }
    
    func goToRemindMeAt()
    func goToIcons(from: ExpansesVC)
}

protocol ExpansesPresenterToViewProtocol: AnyObject {
    
}

protocol ExpansesPresenterToRouterProtocol: AnyObject {
    func createModule() -> ExpansesVC
    func goToRemindMeAt()
    func goToIcons(from: ExpansesVC)
}
