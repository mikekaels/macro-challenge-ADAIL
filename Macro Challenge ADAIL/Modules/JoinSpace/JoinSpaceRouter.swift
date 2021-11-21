//
//  JoinSpaceRouter.swift
//  Macro Challenge ADAIL
//
//  Created by Sukma Risfa Sam Bima Yudha on 16/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.


import UIKit

public class JoinSpaceRouter: JoinSpacePresenterToRouterProtocol{
    public static let shared = JoinSpaceRouter()
    
    func initialize() -> JoinSpaceVC {
        return createModule()
    }
    
    func createModule() -> JoinSpaceVC {
        let view = JoinSpaceVC()
        
        let presenter: JoinSpaceViewToPresenterProtocol & JoinSpaceInteractorToPresenterProtocol = JoinSpacePresenter()
        
        let interactor: JoinSpacePresenterToInteractorProtocol = JoinSpaceInteractor()
        
        let router: JoinSpacePresenterToRouterProtocol = JoinSpaceRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        return view
    }
    
    func backToProfile(from: JoinSpaceVC) {
        let vc = ExpansesRouter().createModule()
        vc.title = "Expanse details"
        from.navigationController?.popViewController(animated: true)
        from.tabBarController?.tabBar.isHidden = false
    }
}
