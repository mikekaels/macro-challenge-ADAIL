//
//  HomeRouter.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 22/10/21.
//

import UIKit

class HomeRouter: HomePresenterToRouterProtocol {
    
    public static let shared = HomeRouter()
    
    public func initialize() -> HomeVC {
        return createModule()
    }
    
    func createModule() -> HomeVC {
        let view = HomeVC()
        
        let presenter: HomeViewToPresenterProtocol & HomeInteractorToPresenterProtocol = HomePresenter()
        let interactor: HomePresenterToInteractorProtocol = HomeInteractor()
        let router: HomePresenterToRouterProtocol = HomeRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}
