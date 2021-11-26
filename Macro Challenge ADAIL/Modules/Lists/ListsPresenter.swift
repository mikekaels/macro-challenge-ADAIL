//
//  ListsPresenter.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 25/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

class ListsPresenter: ListsViewToPresenterProtocol {
    var view: ListsPresenterToViewProtocol?
    var router: ListsPresenterToRouterProtocol?
    var interactor: ListsPresenterToInteractorProtocol?
    
    
}

extension ListsPresenter: ListsInteractorToPresenterProtocol {

}
