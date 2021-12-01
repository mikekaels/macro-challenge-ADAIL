//
//  ExpansesRouter.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 11/11/21.
//

import Foundation

class ExpansesRouter: ExpansesPresenterToRouterProtocol {
    
    
    
    public static let shared = ExpansesRouter()
    
    public func intialize() -> ExpansesVC {
        return createModule()
    }
    
    func createModule() -> ExpansesVC {
        let view = ExpansesVC()
        
        let presenter: ExpansesViewToPresenterProtocol & ExpansesInteractorToPresenterProtocol = ExpansesPresenter()
        
        let router: ExpansesPresenterToRouterProtocol = ExpansesRouter()
        
        let interactor: ExpansesPresenterToInteractorProtocol = ExpansesInteractor()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    func goToRemindMeAt() {
        
    }
    
    func goToIcons(from: ExpansesVC) {
        let vc = IconsRouter().createModule()
        vc.delegate = from
        from.navigationController?.pushViewController(vc, animated: true)
    }
    
    func dismiss(from: ExpansesVC) {
        from.navigationController?.popViewController(animated: true)
    }
    
}
