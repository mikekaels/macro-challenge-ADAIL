//
//  ShowQRPresenter.swift
//  Macro Challenge ADAIL
//
//  Created by Sukma Risfa Sam Bima Yudha on 19/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

class ShowQRPresenter: ShowQRViewToPresenterProtocol {
    var view: ShowQRPresenterToViewProtocol?
    var router: ShowQRPresenterToRouterProtocol?
    var interactor: ShowQRPresenterToInteractorProtocol?
    
    
}

extension ShowQRPresenter: ShowQRInteractorToPresenterProtocol {

}
