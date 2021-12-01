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
    
    func goToAccount(from: HomeVC)
    func fetchUpcomingBills()
}

protocol HomePresenterToRouterProtocol: AnyObject {
    func createModule() -> HomeVC
    func goToAccount(from: HomeVC)
}

protocol HomePresenterToViewProtocol: AnyObject {
    func didFetchUpcomingBills(data: [Expanses])
}

protocol HomePresenterToInteractorProtocol: AnyObject {
    var presenter: HomeInteractorToPresenterProtocol? { get set }
    func fetchUpcomingBills()
}

protocol HomeInteractorToPresenterProtocol: AnyObject {
    func didFetchUpcomingBills(data: [Expanses])
}

