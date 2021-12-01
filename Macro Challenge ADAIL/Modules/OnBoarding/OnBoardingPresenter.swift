//
//  OnBoardingPresenter.swift
//  Macro Challenge ADAIL
//
//  Created by Sukma Risfa Sam Bima Yudha on 12/11/21.
//

import Foundation

class OnBoardingPresenter: OnBoardingViewToPresenterProtocol {

    var view: OnBoardingPresenterToViewProtocol?
    
    var router: OnBoardingPresenterToRouterProtocol?
    
    var interactor: OnBoardingPresenterToInteractorProtocol?
    
    func saveUser(id: String, name: String, email: String) {
        interactor?.saveUser(id: id, name: name, email: email)
    }
    
    func fetchUser(id: String) {
        interactor?.fetchUser(id: id)
    }
    
    func goToDashboard(from: OnBoardingVC) {
        router?.goToDashboard(from: from)
    }
}


extension OnBoardingPresenter: OnBoardingInteractorToPresenterProtocol {
    func didFetchUser(user: User) {
        view?.didFetchUser(user: user)
    }
    
    func didSaveUser(user: User) {
        view?.didSaveUser(user: user)
    }
}
