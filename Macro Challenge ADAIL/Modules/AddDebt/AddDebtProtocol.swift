//
//  AddDebtProtocol.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 26/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import Foundation

public protocol AddDebtDelegate {
    
}

protocol AddDebtViewToPresenterProtocol: AnyObject {
    var view: AddDebtPresenterToViewProtocol? { get set }
    var interactor: AddDebtPresenterToInteractorProtocol? { get set }
    var router: AddDebtPresenterToRouterProtocol? { get set }
    
    func addDebt(userId: String,
                 friendId: String,
                 totalDebt: Int,
                 date: Date
    )
    
    func fetchUsers(groupId: String)
    
    func _dismiss(from: AddDebtVC)
}

protocol AddDebtPresenterToRouterProtocol: AnyObject {
    func createModule() -> AddDebtVC
    func _dismiss(from: AddDebtVC)
}

protocol AddDebtPresenterToViewProtocol: AnyObject {
    func didFetchUsers(users: [User])
    func didCreateDebt(debt: DebtHistory)
}

protocol AddDebtInteractorToPresenterProtocol: AnyObject {
    func didFetchUsers(users: [User])
    func didCreateDebt(debt: DebtHistory)
}

protocol AddDebtPresenterToInteractorProtocol: AnyObject {
    var presenter: AddDebtInteractorToPresenterProtocol? { get set }

    func addDebt(userId: String,
                 friendId: String,
                 totalDebt: Int,
                 date: Date
    )
    
    func fetchUsers(groupId: String)
}
