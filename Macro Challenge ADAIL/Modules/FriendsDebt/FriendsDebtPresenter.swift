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
    
    
}

extension FriendsDebtPresenter: FriendsDebtInteractorToPresenterProtocol {
}
