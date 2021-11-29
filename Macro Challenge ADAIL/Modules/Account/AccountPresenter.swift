//
//  AccountPresenter.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 26/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

class AccountPresenter: AccountViewToPresenterProtocol {
    var view: AccountPresenterToViewProtocol?
    var router: AccountPresenterToRouterProtocol?
    var interactor: AccountPresenterToInteractorProtocol?
    
    
}

extension AccountPresenter: AccountInteractorToPresenterProtocol {

}
