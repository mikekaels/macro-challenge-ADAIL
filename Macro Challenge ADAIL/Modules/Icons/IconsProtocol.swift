//
//  IconsProtocol.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 22/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

public protocol IconsDelegate {
    func didSelectIcon(icon: String)
}

protocol IconsViewToPresenterProtocol: AnyObject {
    var view: IconsPresenterToViewProtocol? { get set }
    var interactor: IconsPresenterToInteractorProtocol? { get set }
    var router: IconsPresenterToRouterProtocol? { get set }
    
    func dismiss(from: IconsVC, icon: Icon)
}

protocol IconsPresenterToRouterProtocol: AnyObject {
    func createModule() -> IconsVC
    func dismiss(from: IconsVC, icon: Icon)
}

protocol IconsPresenterToViewProtocol: AnyObject {

}

protocol IconsInteractorToPresenterProtocol: AnyObject {

}

protocol IconsPresenterToInteractorProtocol: AnyObject {
    var presenter: IconsInteractorToPresenterProtocol? { get set }

}
