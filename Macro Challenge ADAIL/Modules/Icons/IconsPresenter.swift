//
//  IconsPresenter.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 22/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

class IconsPresenter: IconsViewToPresenterProtocol {
    var view: IconsPresenterToViewProtocol?
    var router: IconsPresenterToRouterProtocol?
    var interactor: IconsPresenterToInteractorProtocol?
    
    
}

extension IconsPresenter: IconsInteractorToPresenterProtocol {

}
