//
//  AddDebtPresenter.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 26/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

class AddDebtPresenter: AddDebtViewToPresenterProtocol {
    
    
    var view: AddDebtPresenterToViewProtocol?
    var router: AddDebtPresenterToRouterProtocol?
    var interactor: AddDebtPresenterToInteractorProtocol?
    
    func addDebt(userId: String, friendId: String, totalDebt: Int, date: Date) {
        interactor?.addDebt(userId: userId, friendId: friendId, totalDebt: totalDebt, date: date)
    }
    
    func fetchUsers(groupId: String) {
        interactor?.fetchUsers(groupId: groupId)
    }
    
    func _dismiss(from: AddDebtVC) {
        router?._dismiss(from: from)
    }
}

extension AddDebtPresenter: AddDebtInteractorToPresenterProtocol {
    func didCreateDebt(debt: DebtHistory) {
        view?.didCreateDebt(debt: debt)
    }
    
    func didFetchUsers(users: [User]) {
        view?.didFetchUsers(users: users)
    }
}
