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
    func fetchFriendsDebt(userId: String)
    func fetchFriendsData(users: [String])
}

protocol HomePresenterToRouterProtocol: AnyObject {
    func createModule() -> HomeVC
    func goToAccount(from: HomeVC)
}

protocol HomePresenterToViewProtocol: AnyObject {
    func didFetchUpcomingBills(data: [Expanses])
    func didFetchFriendsDebt(debts: [Debt])
    func didFetchFriendsData(users: [User])
}

protocol HomeInteractorToPresenterProtocol: AnyObject {
    func didFetchUpcomingBills(data: [Expanses])
    func didFetchFriendsDebt(debts: [Debt])
    func didFetchFriendsData(users: [User])
}


protocol HomePresenterToInteractorProtocol: AnyObject {
    var presenter: HomeInteractorToPresenterProtocol? { get set }
    func fetchUpcomingBills()
    func fetchFriendsDebt(userId: String)
    func fetchFriendsData(users: [String])
}


