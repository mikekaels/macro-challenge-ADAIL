//
//  IconsProtocol.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 22/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

public protocol IconsDelegate {
    
}

protocol IconsViewToPresenterProtocol: AnyObject {
    var view: IconsPresenterToViewProtocol? { get set }
    var interactor: IconsPresenterToInteractorProtocol? { get set }
    var router: IconsPresenterToRouterProtocol? { get set }
}

protocol IconsPresenterToRouterProtocol: AnyObject {
    func createModule() -> IconsVC
}

protocol IconsPresenterToViewProtocol: AnyObject {

}

protocol IconsInteractorToPresenterProtocol: AnyObject {

}

protocol IconsPresenterToInteractorProtocol: AnyObject {
    var presenter: IconsInteractorToPresenterProtocol? { get set }

}
