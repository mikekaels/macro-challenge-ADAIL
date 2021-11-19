//
//  JoinSpacePresenter.swift
//  Macro Challenge ADAIL
//
//  Created by Sukma Risfa Sam Bima Yudha on 16/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

class JoinSpacePresenter: JoinSpaceViewToPresenterProtocol {
    var view: JoinSpacePresenterToViewProtocol?
    var router: JoinSpacePresenterToRouterProtocol?
    var interactor: JoinSpacePresenterToInteractorProtocol?
    
    
}

extension JoinSpacePresenter: JoinSpaceInteractorToPresenterProtocol {

}
