//
//  AccountRouter.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 26/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.


import UIKit

public class AccountRouter: AccountPresenterToRouterProtocol{
    public static let shared = AccountRouter()
    
    func initialize() -> AccountVC {
        return createModule()
    }
    
    func createModule() -> AccountVC {
        let view = AccountVC()
        
        let presenter: AccountViewToPresenterProtocol & AccountInteractorToPresenterProtocol = AccountPresenter()
        
        let interactor: AccountPresenterToInteractorProtocol = AccountInteractor()
        
        let router: AccountPresenterToRouterProtocol = AccountRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        return view
    }
}
