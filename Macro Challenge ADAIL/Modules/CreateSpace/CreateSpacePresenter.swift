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
}

extension CreateSpacePresenter: CreateSpaceInteractorToPresenterProtocol {

}
