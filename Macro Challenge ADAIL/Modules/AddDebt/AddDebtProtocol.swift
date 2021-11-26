//
//  AddDebtProtocol.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 26/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

public protocol AddDebtDelegate {
    
}

protocol AddDebtViewToPresenterProtocol: AnyObject {
    var view: AddDebtPresenterToViewProtocol? { get set }
    var interactor: AddDebtPresenterToInteractorProtocol? { get set }
    var router: AddDebtPresenterToRouterProtocol? { get set }
}

protocol AddDebtPresenterToRouterProtocol: AnyObject {
    func createModule() -> AddDebtVC
}

protocol AddDebtPresenterToViewProtocol: AnyObject {

}

protocol AddDebtInteractorToPresenterProtocol: AnyObject {

}

protocol AddDebtPresenterToInteractorProtocol: AnyObject {
    var presenter: AddDebtInteractorToPresenterProtocol? { get set }

}
