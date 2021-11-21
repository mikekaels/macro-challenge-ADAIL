//
//  FriendsDebtRouter.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 19/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.


import UIKit

public class FriendsDebtRouter: FriendsDebtPresenterToRouterProtocol{
    public static let shared = FriendsDebtRouter()
    
    func initialize() -> FriendsDebtVC {
        return createModule()
    }
    
    func createModule() -> FriendsDebtVC {
        let view = FriendsDebtVC()
        
        let presenter: FriendsDebtViewToPresenterProtocol & FriendsDebtInteractorToPresenterProtocol = FriendsDebtPresenter()
        
        let interactor: FriendsDebtPresenterToInteractorProtocol = FriendsDebtInteractor()
        
        let router: FriendsDebtPresenterToRouterProtocol = FriendsDebtRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        return view
    }
}
