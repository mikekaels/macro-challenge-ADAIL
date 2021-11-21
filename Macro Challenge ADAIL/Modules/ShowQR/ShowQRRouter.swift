//
//  ShowQRRouter.swift
//  Macro Challenge ADAIL
//
//  Created by Sukma Risfa Sam Bima Yudha on 19/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.


import UIKit

public class ShowQRRouter: ShowQRPresenterToRouterProtocol{
    public static let shared = ShowQRRouter()
    
    func initialize() -> ShowQRVC {
        return createModule()
    }
    
    func createModule() -> ShowQRVC {
        let view = ShowQRVC()
        
        let presenter: ShowQRViewToPresenterProtocol & ShowQRInteractorToPresenterProtocol = ShowQRPresenter()
        
        let interactor: ShowQRPresenterToInteractorProtocol = ShowQRInteractor()
        
        let router: ShowQRPresenterToRouterProtocol = ShowQRRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        return view
    }
}
