//
//  OnBoardingProtocol.swift
//  Macro Challenge ADAIL
//
//  Created by Sukma Risfa Sam Bima Yudha on 12/11/21.
//

import Foundation

protocol OnBoardingViewToPresenterProtocol: AnyObject {
    var view: OnBoardingPresenterToViewProtocol? { get set }
    var router: OnBoardingPresenterToRouterProtocol? { get set }
    var interactor: OnBoardingPresenterToInteractorProtocol? { get set }
    
    func saveUser(id: String, name: String, email: String)
    func fetchUser(id: String)
    func fetchGroup(groupId: String)
    
    func goToDashboard(from: OnBoardingVC)
}

protocol OnBoardingPresenterToRouterProtocol: AnyObject {
    func createModule() -> OnBoardingVC
    func goToDashboard(from: OnBoardingVC)
}

protocol OnBoardingPresenterToInteractorProtocol: AnyObject {
    var presenter: OnBoardingInteractorToPresenterProtocol? { get set }
    func saveUser(id: String, name: String, email: String)
    func fetchUser(id: String)
    func fetchGroup(groupId: String)
}

protocol OnBoardingInteractorToPresenterProtocol: AnyObject {
    func didSaveUser(user: User)
    func didFetchUser(user: User)
    func didFetchGroup(group: Group)
}

protocol OnBoardingPresenterToViewProtocol: AnyObject {
    func didSaveUser(user: User)
    func didFetchUser(user: User)
    func didFetchGroup(group: Group)
}
