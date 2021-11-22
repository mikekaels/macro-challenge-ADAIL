//
//  DescSpacePresenter.swift
//  Macro Challenge ADAIL
//
//  Created by Sukma Risfa Sam Bima Yudha on 19/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

class DescSpacePresenter: DescSpaceViewToPresenterProtocol {
    var view: DescSpacePresenterToViewProtocol?
    var router: DescSpacePresenterToRouterProtocol?
    var interactor: DescSpacePresenterToInteractorProtocol?
    
    
}

extension DescSpacePresenter: DescSpaceInteractorToPresenterProtocol {

}
