//
//  HomeProtocol.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 22/10/21.
//

import Foundation

protocol HomeViewToPresenterProtocol: AnyObject {
    var view: HomePresenterToViewProtocol? { get set }
    var interactor: HomePresenterToInteractorProtocol? { get set }
    var router: HomePresenterToRouterProtocol? { get set }
}

protocol HomePresenterToRouterProtocol: AnyObject {
    func createModule() -> HomeVC
}

protocol HomePresenterToViewProtocol: AnyObject {
    
}

protocol HomePresenterToInteractorProtocol: AnyObject {
    var presenter: HomeInteractorToPresenterProtocol? { get set }
}

protocol HomeInteractorToPresenterProtocol: AnyObject {
    
}

