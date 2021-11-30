//
//  ProfileRouter.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 23/10/21.
//

import Foundation
import UIKit

class ProfileRouter: ProfilePresenterToRouterProtocol {
    
    public static let shared = ProfileRouter()
    
    public func initialize() -> ProfileVC {
        return createModule()
    }
    
    func createModule() -> ProfileVC {
        let view = ProfileVC()
        
        let interactor: ProfilePresenterToInteractorProtocol = ProfileInteractor()
        
        let presenter: ProfileViewToPresenterProtocol & ProfileInteractorToPresenterProtocol = ProfilePresenter()
        
        let router: ProfilePresenterToRouterProtocol = ProfileRouter()
        
        view.presentor = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.presenter = presenter
        
        
        return view
    }
    
    func goToCreateSpace(from: ProfileVC) {
        let vc = CreateSpaceRouter().createModule()
        vc.title = "Create Co-Living Space"
        from.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToJoinSpace(from: ProfileVC) {
        let vc = JoinSpaceRouter().createModule()
        from.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToDetailSpace(from: ProfileVC) {
        let vc = DetailSpaceRouter().createModule()
        vc.title = "Kos Ibu Wati"
        from.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToDescSpace(from: ProfileVC) {
        let vc = DescSpaceRouter().createModule()
        vc.title = "Kos Ibu Wati"
        from.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goToShowQR(from: ProfileVC) {
        let vc = ShowQRRouter().createModule()
        vc.title = "Kos Ibu Wati"
        from.navigationController?.pushViewController(vc, animated: true)
    }
    
    func signOut(from: ProfileVC) {
        let vc = OnBoardingRouter().createModule()
        from.navigationController?.pushViewController(vc, animated: true)
        from.tabBarController?.tabBar.removeFromSuperview()
        Core.shared.signOut()
    }
    
    func leaveGroup(from: ProfileVC) {
        from.scrollView.removeFromSuperview()
        from.setupEmptyView()
        Core.shared.groupOut()
    }
    
}
