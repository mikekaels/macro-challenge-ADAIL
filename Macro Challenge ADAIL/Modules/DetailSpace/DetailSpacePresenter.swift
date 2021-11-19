//
//  DetailSpacePresenter.swift
//  Macro Challenge ADAIL
//
//  Created by Sukma Risfa Sam Bima Yudha on 19/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

class DetailSpacePresenter: DetailSpaceViewToPresenterProtocol {
    var view: DetailSpacePresenterToViewProtocol?
    var router: DetailSpacePresenterToRouterProtocol?
    var interactor: DetailSpacePresenterToInteractorProtocol?
    
    
}

extension DetailSpacePresenter: DetailSpaceInteractorToPresenterProtocol {

}
