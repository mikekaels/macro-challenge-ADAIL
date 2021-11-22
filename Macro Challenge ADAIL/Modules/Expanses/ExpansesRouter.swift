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
        
        let presenter: ExpansesViewToPresenterProtocol = ExpansesPresenter()
        
        let router: ExpansesPresenterToRouterProtocol = ExpansesRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        
        return view
    }
    
    func goToRemindMeAt() {
        
    }
    
    func goToIcons(from: ExpansesVC) {
        let vc = IconsRouter().createModule()
        from.navigationController?.pushViewController(vc, animated: true)
    }
    
}
