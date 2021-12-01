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
    
    func fetchUpcoming() {
        interactor?.fetchUpcoming()
    }
}

extension ListsPresenter: ListsInteractorToPresenterProtocol {
    func didFetchUpcoming(data: [Expanses]) {
        view?.didFetchUpcoming(data: data)
    }
}
