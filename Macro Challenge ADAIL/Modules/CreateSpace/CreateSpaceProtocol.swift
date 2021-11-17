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
}

protocol CreateSpacePresenterToRouterProtocol: AnyObject {
    func createModule() -> CreateSpaceVC
    func goToProfile(from: CreateSpaceVC)
}

protocol CreateSpacePresenterToViewProtocol: AnyObject {

}

protocol CreateSpaceInteractorToPresenterProtocol: AnyObject {

}

protocol CreateSpacePresenterToInteractorProtocol: AnyObject {
    var presenter: CreateSpaceInteractorToPresenterProtocol? { get set }
    
}
