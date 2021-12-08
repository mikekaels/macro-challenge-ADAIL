//
//  FriendsDebtInteractor.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 19/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

class FriendsDebtInteractor: FriendsDebtPresenterToInteractorProtocol {
    var presenter: FriendsDebtInteractorToPresenterProtocol?
}

extension FriendsDebtInteractor {
    func fetchUser(id: String) {
        CloudKitHelper.fetchUserByRecordID(id: id) { user in
            self.presenter?.didFetchUser(user: user)
        }
    }
    
    func fetchDebt(userId: String, friendId: String) {
        CloudKitHelper.fetchDebt(userId: userId, friendId: friendId) { result in
            switch result {
            case .success(let debt):
                self.presenter?.didFetchDebt(debt: debt)
            case .failure(let err):
                print(err)
            }
        }
    }
    
    func fetchHistoryDebt(userId: String, friendId: String) {
        CloudKitHelper.fetchHistoryDebt(userId: userId, friendId: friendId) { debtHistory in
            self.presenter?.didFetchHistoryDebt(historyDebt: debtHistory)
        }
    }
    
    func fetchPaidHistory(userId: String, friendId: String) {
        CloudKitHelper.fetchPaidHistories(userId: userId, friendId: friendId) { result in
            self.presenter?.didFetchPaidHistory(paidHistory: result)
        }
    }
    
    func installPayment(userId: String, friendId: String, total: Int, date: Date) {
        CloudKitHelper.createPaidHistory(userId: userId, friendId: friendId, total: total, date: date) { result in
            switch result {
            case .success(let paidHistories):
                self.presenter?.didInstallPayment(paidHistories: paidHistories)
            case .failure(let err):
                print("ERROR: ",err)
            }
        }
    }
}
