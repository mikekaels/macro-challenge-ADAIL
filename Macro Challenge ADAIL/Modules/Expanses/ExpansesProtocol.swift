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
}

protocol ExpansesPresenterToViewProtocol: AnyObject {
    
}

protocol ExpansesPresenterToRouterProtocol: AnyObject {
    func createModule() -> ExpansesVC
    func goToRemindMeAt()
}
