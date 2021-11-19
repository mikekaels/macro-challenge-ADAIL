//
//  DetailSpaceRouter.swift
//  Macro Challenge ADAIL
//
//  Created by Sukma Risfa Sam Bima Yudha on 19/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.


import UIKit

public class DetailSpaceRouter: DetailSpacePresenterToRouterProtocol{
    public static let shared = DetailSpaceRouter()
    
    func initialize() -> DetailSpaceVC {
        return createModule()
    }
    
    func createModule() -> DetailSpaceVC {
        let view = DetailSpaceVC()
        
        let presenter: DetailSpaceViewToPresenterProtocol & DetailSpaceInteractorToPresenterProtocol = DetailSpacePresenter()
        
        let interactor: DetailSpacePresenterToInteractorProtocol = DetailSpaceInteractor()
        
        let router: DetailSpacePresenterToRouterProtocol = DetailSpaceRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        return view
    }
}
