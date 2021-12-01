//
//  ExpansesPresenter.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 11/11/21.
//

import Foundation

class ExpansesPresenter: ExpansesViewToPresenterProtocol {

    var view: ExpansesPresenterToViewProtocol?
    
    var router: ExpansesPresenterToRouterProtocol?
    
    var interactor: ExpansesPresenterToInteractorProtocol?
    
    func goToRemindMeAt() {

    }
    
    func goToIcons(from: ExpansesVC) {
        router?.goToIcons(from: from)
    }
    
    func saveExpanses(expanses: Expanses) {
        interactor?.saveExpanses(expanses: expanses)
    }
    
    func dismiss(from: ExpansesVC) {
        router?.dismiss(from: from)
    }
}


extension ExpansesPresenter: ExpansesInteractorToPresenterProtocol {
    func didCreateExpanses(expanses: Expanses) {
        view?.didCreateExpanses(expanses: expanses)
    } 
}
