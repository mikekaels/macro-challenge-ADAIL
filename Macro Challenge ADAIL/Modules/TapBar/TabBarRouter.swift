//
//  TabBarRouter.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 23/10/21.
//

import Foundation
import UIKit

class TabBarRouter: TabBarPresenterToRouterProtocol {
    
    public static let shared = TabBarRouter()
    
    public func initialize() -> TabBarVC{
        return createModule()
    }
    
    func createModule() -> TabBarVC {
        let view = TabBarVC()
        
        let presenter: TabBarViewToPresenterProtocol = TabBarPresenter()
        let router: TabBarPresenterToRouterProtocol = TabBarRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        
        return view
    }
}
