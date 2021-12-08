//
//  FriendsDebtProtocol.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 19/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import Foundation

public protocol FriendsDebtDelegate {
    
}

protocol FriendsDebtViewToPresenterProtocol: AnyObject {
    var view: FriendsDebtPresenterToViewProtocol? { get set }
    var interactor: FriendsDebtPresenterToInteractorProtocol? { get set }
    var router: FriendsDebtPresenterToRouterProtocol? { get set }
    
    func fetchUser(id: String)
    func fetchDebt(userId: String, friendId: String)
    func fetchHistoryDebt(userId: String, friendId: String)
}

protocol FriendsDebtPresenterToRouterProtocol: AnyObject {
    func createModule() -> FriendsDebtVC
}

protocol FriendsDebtPresenterToViewProtocol: AnyObject {
    func didFetchUser(user: User)
    func didFetchDebt(debt: Debt)
    func didFetchHistoryDebt(historyDebt: [DebtHistory])
}

protocol FriendsDebtInteractorToPresenterProtocol: AnyObject {
    func didFetchUser(user: User)
    func didFetchDebt(debt: Debt)
    func didFetchHistoryDebt(historyDebt: [DebtHistory])
}

protocol FriendsDebtPresenterToInteractorProtocol: AnyObject {
    var presenter: FriendsDebtInteractorToPresenterProtocol? { get set }
    func fetchUser(id: String)
    func fetchDebt(userId: String, friendId: String)
    func fetchHistoryDebt(userId: String, friendId: String)
}
