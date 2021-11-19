//
//  DetailSpaceProtocol.swift
//  Macro Challenge ADAIL
//
//  Created by Sukma Risfa Sam Bima Yudha on 19/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

public protocol DetailSpaceDelegate {
    
}

protocol DetailSpaceViewToPresenterProtocol: AnyObject {
    var view: DetailSpacePresenterToViewProtocol? { get set }
    var interactor: DetailSpacePresenterToInteractorProtocol? { get set }
    var router: DetailSpacePresenterToRouterProtocol? { get set }
}

protocol DetailSpacePresenterToRouterProtocol: AnyObject {
    func createModule() -> DetailSpaceVC
}

protocol DetailSpacePresenterToViewProtocol: AnyObject {

}

protocol DetailSpaceInteractorToPresenterProtocol: AnyObject {

}

protocol DetailSpacePresenterToInteractorProtocol: AnyObject {
    var presenter: DetailSpaceInteractorToPresenterProtocol? { get set }

}
