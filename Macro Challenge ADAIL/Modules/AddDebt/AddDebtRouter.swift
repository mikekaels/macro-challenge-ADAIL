//
//  AddDebtRouter.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 26/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.


import UIKit

public class AddDebtRouter: AddDebtPresenterToRouterProtocol{
    public static let shared = AddDebtRouter()
    
    func initialize() -> AddDebtVC {
        return createModule()
    }
    
    func createModule() -> AddDebtVC {
        let view = AddDebtVC()
        
        let presenter: AddDebtViewToPresenterProtocol & AddDebtInteractorToPresenterProtocol = AddDebtPresenter()
        
        let interactor: AddDebtPresenterToInteractorProtocol = AddDebtInteractor()
        
        let router: AddDebtPresenterToRouterProtocol = AddDebtRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        return view
    }
}
