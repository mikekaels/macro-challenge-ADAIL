//
//  ListsProtocol.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 25/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

public protocol ListsDelegate {
    
}

protocol ListsViewToPresenterProtocol: AnyObject {
    var view: ListsPresenterToViewProtocol? { get set }
    var interactor: ListsPresenterToInteractorProtocol? { get set }
    var router: ListsPresenterToRouterProtocol? { get set }
    
    func fetchUpcoming()
}

protocol ListsPresenterToRouterProtocol: AnyObject {
    func createModule() -> ListsVC
}

protocol ListsPresenterToViewProtocol: AnyObject {
    func didFetchUpcoming(data: [Expanses])
}

protocol ListsInteractorToPresenterProtocol: AnyObject {
    func didFetchUpcoming(data: [Expanses])
}

protocol ListsPresenterToInteractorProtocol: AnyObject {
    var presenter: ListsInteractorToPresenterProtocol? { get set }
    func fetchUpcoming()

}
