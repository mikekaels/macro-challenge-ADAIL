//
//  HomePresenter.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 22/10/21.
//

import Foundation
import UIKit

class HomePresenter: HomeViewToPresenterProtocol {
    
    var view: HomePresenterToViewProtocol?
    
    var interactor: HomePresenterToInteractorProtocol?
    
    var router: HomePresenterToRouterProtocol?
    
    func goToAccount(from: HomeVC) {
        router?.goToAccount(from: from)
    }
    func fetchUpcomingBills() {
        interactor?.fetchUpcomingBills()
    }
    func fetchFriendsDebt(userId: String) {
        interactor?.fetchFriendsDebt(userId: userId)
    }
    func fetchOweToFriend(userId: String) {
        interactor?.fetchOweToFriend(userId: userId)
    }
    func fetchFriendsData(users: [String]) {
        interactor?.fetchFriendsData(users: users)
    }
}

extension HomePresenter: HomeInteractorToPresenterProtocol {
    func didFetchFriendsData(users: [User]) {
        view?.didFetchFriendsData(users: users)
    }
    func didFetchUpcomingBills(data: [Expanses]) {
        view?.didFetchUpcomingBills(data: data)
    }
    func didFetchOweToFriend(debts: [Debt]) {
        view?.didFetchOweToFriend(debts: debts)
    }
    func didFetchFriendsDebt(debts: [Debt]) {
        view?.didFetchFriendsDebt(debts: debts)
    }
}
