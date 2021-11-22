//
//  IconsRouter.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 22/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.


import UIKit

public class IconsRouter: IconsPresenterToRouterProtocol{
    public static let shared = IconsRouter()
    
    func initialize() -> IconsVC {
        return createModule()
    }
    
    func createModule() -> IconsVC {
        let view = IconsVC()
        
        let presenter: IconsViewToPresenterProtocol & IconsInteractorToPresenterProtocol = IconsPresenter()
        
        let interactor: IconsPresenterToInteractorProtocol = IconsInteractor()
        
        let router: IconsPresenterToRouterProtocol = IconsRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        return view
    }
}
