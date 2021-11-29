//
//  AccountInteractor.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 26/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

class AccountInteractor: AccountPresenterToInteractorProtocol {
    
    var presenter: AccountInteractorToPresenterProtocol?
}

extension AccountInteractor {
    func fetchUser() {
        let id = Core().getID()
        CloudKitHelper.fetchOneUser(id: id) { user in
            self.presenter?.didFetchUser(user: user)
        }
    }
}
