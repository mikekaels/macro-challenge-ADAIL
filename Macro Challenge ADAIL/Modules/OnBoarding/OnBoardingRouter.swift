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
        
        let presenter: OnBoardingViewToPresenterProtocol & OnBoardingInteractorToPresenterProtocol = OnBoardingPresenter()
        let router: OnBoardingPresenterToRouterProtocol = OnBoardingRouter()
        let interactor: OnBoardingPresenterToInteractorProtocol = OnBoardingInteractor()
        
        view.presentor = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    func goToDashboard(from: OnBoardingVC) {
        DispatchQueue.main.async {
            from.dismiss(animated: true) {
                let vc = TabBarRouter().createModule()
                let nav = UINavigationController(rootViewController: vc)
                nav.modalPresentationStyle = .fullScreen
                from.present(nav, animated: true, completion: nil)
            }
        }
    }
}


