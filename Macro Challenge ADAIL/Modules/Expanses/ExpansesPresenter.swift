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
    
    func goToRemindMeAt() {

    }
    
    func goToIcons(from: ExpansesVC) {
        router?.goToIcons(from: from)
    }
}
