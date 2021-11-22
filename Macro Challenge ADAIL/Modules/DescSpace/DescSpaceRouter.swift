//
//  DescSpaceRouter.swift
//  Macro Challenge ADAIL
//
//  Created by Sukma Risfa Sam Bima Yudha on 19/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.


import UIKit

public class DescSpaceRouter: DescSpacePresenterToRouterProtocol{
    public static let shared = DescSpaceRouter()
    
    func initialize() -> DescSpaceVC {
        return createModule()
    }
    
    func createModule() -> DescSpaceVC {
        let view = DescSpaceVC()
        
        let presenter: DescSpaceViewToPresenterProtocol & DescSpaceInteractorToPresenterProtocol = DescSpacePresenter()
        
        let interactor: DescSpacePresenterToInteractorProtocol = DescSpaceInteractor()
        
        let router: DescSpacePresenterToRouterProtocol = DescSpaceRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        return view
    }
}
