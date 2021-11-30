//
//  CreateSpacePresenter.swift
//  Macro Challenge ADAIL
//
//  Created by Sukma Risfa Sam Bima Yudha on 15/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

class CreateSpacePresenter: CreateSpaceViewToPresenterProtocol {
    var view: CreateSpacePresenterToViewProtocol?
    var router: CreateSpacePresenterToRouterProtocol?
    var interactor: CreateSpacePresenterToInteractorProtocol?
    
    func goToProfile(from: CreateSpaceVC){
        
    }
    
    func saveGroup(name: String, address: String, description: String) {
        interactor?.saveGroup(name: name, address: address, description: description)
    }
}

extension CreateSpacePresenter: CreateSpaceInteractorToPresenterProtocol {
    func didSaveGroup(group: Group){
        view?.didFetchGroup(group: group)
    }
}
