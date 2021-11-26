//
//  AccountProtocol.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 26/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

public protocol AccountDelegate {
    
}

protocol AccountViewToPresenterProtocol: AnyObject {
    var view: AccountPresenterToViewProtocol? { get set }
    var interactor: AccountPresenterToInteractorProtocol? { get set }
    var router: AccountPresenterToRouterProtocol? { get set }
}

protocol AccountPresenterToRouterProtocol: AnyObject {
    func createModule() -> AccountVC
}

protocol AccountPresenterToViewProtocol: AnyObject {

}

protocol AccountInteractorToPresenterProtocol: AnyObject {

}

protocol AccountPresenterToInteractorProtocol: AnyObject {
    var presenter: AccountInteractorToPresenterProtocol? { get set }

}
