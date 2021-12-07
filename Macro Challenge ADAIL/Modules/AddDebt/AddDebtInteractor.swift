//
//  AddDebtInteractor.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 26/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

class AddDebtInteractor: AddDebtPresenterToInteractorProtocol {
    
    var presenter: AddDebtInteractorToPresenterProtocol?
    
    func addDebt(userId: String, friendId: String, totalDebt: Int, date: Date) {
        CloudKitHelper.addDebt(userId: userId, friendId: friendId, totalDebt: totalDebt, date: date) { result in
            switch result {
            case .success(let data):
                self.presenter?.didCreateDebt(debt: data)
            case .failure(let err):
                print(err)
            }
        }
    }
    
    func fetchUsers(groupId: String) {
        CloudKitHelper.fetchUsersByGroupId(groupId: groupId) { result in
            switch result {
            case .success(let users):
                self.presenter?.didFetchUsers(users: users)
            case.failure(let err):
                print(err)
            }
        }
    }
}

extension AddDebtInteractor {
    
}
