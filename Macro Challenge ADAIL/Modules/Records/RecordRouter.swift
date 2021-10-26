//
//  RecordRouter.swift
//  Macro Challenge ADAIL
//
//  Created by Sukma Risfa Sam Bima Yudha on 26/10/21.
//

import UIKit

class RecordRouter: RecordPresenterToRouterProtocol {
    
    public static let shared = RecordRouter()
    
    public func initialize() -> RecordVC {
        return createModule()
    }
    
    func createModule() -> RecordVC {
        let view = RecordVC()
        
        let presenter: RecordViewToPresenterProtocol & RecordInteractorToPresenterProtocol = RecordPresenter()
        let interactor: RecordPresenterToInteractorProtocol = RecordInteractor()
        let router: RecordPresenterToRouterProtocol = RecordRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}
