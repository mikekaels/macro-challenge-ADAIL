//
//  CreateSpaceRouter.swift
//  Macro Challenge ADAIL
//
//  Created by Sukma Risfa Sam Bima Yudha on 15/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.


import UIKit

public class CreateSpaceRouter: CreateSpacePresenterToRouterProtocol{
    public static let shared = CreateSpaceRouter()
    
    func initialize() -> CreateSpaceVC {
        return createModule()
    }
    
    func createModule() -> CreateSpaceVC {
        let view = CreateSpaceVC()
        
        let presenter: CreateSpaceViewToPresenterProtocol & CreateSpaceInteractorToPresenterProtocol = CreateSpacePresenter()
        
        let interactor: CreateSpacePresenterToInteractorProtocol = CreateSpaceInteractor()
        
        let router: CreateSpacePresenterToRouterProtocol = CreateSpaceRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        return view
    }
    
    func goToProfile(from: CreateSpaceVC) {
        let vc = ProfileRouter().createModule()
        vc.isGroup = true
        from.navigationController?.pushViewController(vc, animated: true)
    }
}


