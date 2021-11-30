//
//  ProfileProtocol.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 23/10/21.
//

import Foundation

public protocol ProfileDelegate{
    
}

protocol ProfileViewToPresenterProtocol: AnyObject {
    var view: ProfilePresenterToViewProtocol? { get set }
    var router: ProfilePresenterToRouterProtocol? { get set }
    
    func goToCreateSpace(from: ProfileVC)
    func goToJoinSpace(from: ProfileVC)
    func fetchGroup()
}

protocol ProfilePresenterToViewProtocol: AnyObject {
    func didFetchGroup(group: Group)
}

protocol ProfilePresenterToRouterProtocol: AnyObject {
    func createModule() -> ProfileVC
    func goToCreateSpace(from: ProfileVC)
    func goToJoinSpace(from: ProfileVC)
    func goToDetailSpace(from: ProfileVC)
    func goToDescSpace(from: ProfileVC)
    func goToShowQR(from: ProfileVC)
    func signOut(from: ProfileVC)
    func leaveGroup(from: ProfileVC)
}

protocol ProfilePresentertoInteractorProtocol: AnyObject {
    var presenter: ProfileInteractorToPresenterProtocol? { get set }
    func fetchGroup()
}

protocol ProfileInteractorToPresenterProtocol: AnyObject {
    func didFetchGroup(group: Group)
}
