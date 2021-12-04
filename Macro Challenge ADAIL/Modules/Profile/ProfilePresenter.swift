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
    
    var interactor: ProfilePresenterToInteractorProtocol?

    
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
    
    func fetchUsers(IDs: [String]) {
        interactor?.fetchUsers(IDs: IDs)
    }
}

extension ProfilePresenter: ProfileInteractorToPresenterProtocol {
    func didFetchUsers(users: [User]) {
        self.view?.didFetchUsers(users: users)
    }
    
    func didFetchGroup(group: Group) {
        self.view?.didFetchGroup(group: group)
    }
    
    
}

