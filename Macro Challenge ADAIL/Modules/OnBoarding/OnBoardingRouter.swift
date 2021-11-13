//
//  OnBoardingRouter.swift
//  Macro Challenge ADAIL
//
//  Created by Sukma Risfa Sam Bima Yudha on 12/11/21.
//

import Foundation
import UIKit

class OnBoardingRouter: OnBoardingPresenterToRouterProtocol {
    
    public static let shared = OnBoardingRouter()
    
    public func initialize() -> OnBoardingVC{
        return createModule()
    }
    
    func createModule() -> OnBoardingVC {
        let view = OnBoardingVC()
        
        let presenter: OnBoardingViewToPresenterProtocol = OnBoardingPresenter()
        let router: OnBoardingPresenterToRouterProtocol = OnBoardingRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        
        return view
    }
}


