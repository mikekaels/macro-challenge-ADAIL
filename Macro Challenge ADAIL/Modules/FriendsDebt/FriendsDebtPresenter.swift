//
//  FriendsDebtPresenter.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 19/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

class FriendsDebtPresenter: FriendsDebtViewToPresenterProtocol {
    
    var view: FriendsDebtPresenterToViewProtocol?
    var router: FriendsDebtPresenterToRouterProtocol?
    var interactor: FriendsDebtPresenterToInteractorProtocol?
    
    func fetchUser(id: String) {
        interactor?.fetchUser(id: id)
    }
    
    func fetchDebt(userId: String, friendId: String) {
        interactor?.fetchDebt(userId: userId, friendId: friendId)
    }
    
    func fetchHistoryDebt(userId: String, friendId: String) {
        interactor?.fetchHistoryDebt(userId: userId, friendId: friendId)
    }
    
    func fetchPaidHistory(userId: String, friendId: String) {
        interactor?.fetchPaidHistory(userId: userId, friendId: friendId)
    }
    
    func installPayment(userId: String, friendId: String, total: Int, date: Date) {
        interactor?.installPayment(userId: userId, friendId: friendId, total: total, date: date)
    }
    
}

extension FriendsDebtPresenter: FriendsDebtInteractorToPresenterProtocol {
    func didFetchUser(user: User) {
        view?.didFetchUser(user: user)
    }
    
    func didFetchDebt(debt: Debt) {
        view?.didFetchDebt(debt: debt)
    }
    
    func didFetchHistoryDebt(historyDebt: [DebtHistory]) {
        view?.didFetchHistoryDebt(historyDebt: historyDebt)
    }
    
    func didFetchPaidHistory(paidHistory: [PaidHistory]) {
        view?.didFetchPaidHistory(paidHistory: paidHistory)
    }
    
    func didInstallPayment(paidHistories: [PaidHistory]) {
        view?.didInstallPayment(paidHistories: paidHistories)
    }
}
