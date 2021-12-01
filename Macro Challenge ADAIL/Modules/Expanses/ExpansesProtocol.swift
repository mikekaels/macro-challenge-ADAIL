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
    var interactor: ExpansesPresenterToInteractorProtocol? { get set }
    
    func goToRemindMeAt()
    func goToIcons(from: ExpansesVC)
    func saveExpanses(expanses: Expanses)
    func dismiss(from: ExpansesVC)
}

protocol ExpansesPresenterToViewProtocol: AnyObject {
    func didCreateExpanses(expanses: Expanses)
}

protocol ExpansesPresenterToRouterProtocol: AnyObject {
    func createModule() -> ExpansesVC
    func goToRemindMeAt()
    func goToIcons(from: ExpansesVC)
    func dismiss(from: ExpansesVC)
}

protocol ExpansesPresenterToInteractorProtocol: AnyObject {
    var presenter: ExpansesInteractorToPresenterProtocol? { get set }
    func saveExpanses(expanses: Expanses)
}

protocol ExpansesInteractorToPresenterProtocol: AnyObject {
    func didCreateExpanses(expanses: Expanses)
}
