//
//  ListsRouter.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 25/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.


import UIKit

public class ListsRouter: ListsPresenterToRouterProtocol{
    public static let shared = ListsRouter()
    
    func initialize() -> ListsVC {
        return createModule()
    }
    
    func createModule() -> ListsVC {
        let view = ListsVC()
        
        let presenter: ListsViewToPresenterProtocol & ListsInteractorToPresenterProtocol = ListsPresenter()
        
        let interactor: ListsPresenterToInteractorProtocol = ListsInteractor()
        
        let router: ListsPresenterToRouterProtocol = ListsRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        return view
    }
}
