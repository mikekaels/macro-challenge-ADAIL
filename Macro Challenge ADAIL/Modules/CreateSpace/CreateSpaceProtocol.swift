//
//  CreateSpaceProtocol.swift
//  Macro Challenge ADAIL
//
//  Created by Sukma Risfa Sam Bima Yudha on 15/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

public protocol CreateSpaceDelegate {
    
}

protocol CreateSpaceViewToPresenterProtocol: AnyObject {
    var view: CreateSpacePresenterToViewProtocol? { get set }
    var interactor: CreateSpacePresenterToInteractorProtocol? { get set }
    var router: CreateSpacePresenterToRouterProtocol? { get set }
    
    func goToProfile(from: CreateSpaceVC)
    func saveGroup(name: String, address: String, description: String)
}

protocol CreateSpacePresenterToRouterProtocol: AnyObject {
    func createModule() -> CreateSpaceVC
    func goToProfile(from: CreateSpaceVC)
}

protocol CreateSpacePresenterToViewProtocol: AnyObject {
    func didFetchGroup(group: Group)
}

protocol CreateSpaceInteractorToPresenterProtocol: AnyObject {
    func didSaveGroup(group: Group)

}

protocol CreateSpacePresenterToInteractorProtocol: AnyObject {
    var presenter: CreateSpaceInteractorToPresenterProtocol? { get set }
    func saveGroup(name: String, address: String, description: String)
}
