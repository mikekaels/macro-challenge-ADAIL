//
//  AddDebtPresenter.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 26/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

class AddDebtPresenter: AddDebtViewToPresenterProtocol {
    var view: AddDebtPresenterToViewProtocol?
    var router: AddDebtPresenterToRouterProtocol?
    var interactor: AddDebtPresenterToInteractorProtocol?
    
    
}

extension AddDebtPresenter: AddDebtInteractorToPresenterProtocol {

}
