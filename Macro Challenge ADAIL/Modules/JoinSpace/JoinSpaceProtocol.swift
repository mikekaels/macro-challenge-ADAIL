//
//  JoinSpaceProtocol.swift
//  Macro Challenge ADAIL
//
//  Created by Sukma Risfa Sam Bima Yudha on 16/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

public protocol JoinSpaceDelegate {
    
}

protocol JoinSpaceViewToPresenterProtocol: AnyObject {
    var view: JoinSpacePresenterToViewProtocol? { get set }
    var interactor: JoinSpacePresenterToInteractorProtocol? { get set }
    var router: JoinSpacePresenterToRouterProtocol? { get set }
}

protocol JoinSpacePresenterToRouterProtocol: AnyObject {
    func createModule() -> JoinSpaceVC
    func backToProfile(from: JoinSpaceVC)
}

protocol JoinSpacePresenterToViewProtocol: AnyObject {

}

protocol JoinSpaceInteractorToPresenterProtocol: AnyObject {

}

protocol JoinSpacePresenterToInteractorProtocol: AnyObject {
    var presenter: JoinSpaceInteractorToPresenterProtocol? { get set }

}
