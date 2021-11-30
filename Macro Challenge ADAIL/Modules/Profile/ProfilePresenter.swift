//
//  ProfilePresenter.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 23/10/21.
//

import Foundation

class ProfilePresenter: ProfileViewToPresenterProtocol {
    var view: ProfilePresenterToViewProtocol?
    
    var router: ProfilePresenterToRouterProtocol?
    
    var interactor: ProfilePresentertoInteractorProtocol?

    
    func fetchGroup() {
        interactor?.fetchGroup()
    }
    
    func goToCreateSpace(from: ProfileVC){
        
    }
    
    func goToJoinSpace(from: ProfileVC) {
        
    }
    
    func goToDetailSpace(from: ProfileVC) {
        
    }
    
    func goToDescSpace(from: ProfileVC) {
        
    }
    
    func goToShowQR(from: ProfileVC) {
        
    }
    
    func signOut(from: ProfileVC) {
        
    }
}

extension ProfilePresenter: ProfileInteractorToPresenterProtocol {
    func didFetchGroup(group: Group) {
        view?.didFetchGroup(group: group)
    }
    
    
}

