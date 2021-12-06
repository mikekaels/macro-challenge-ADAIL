//
//  FriendsDebtProtocol.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 19/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import Foundation

public protocol FriendsDebtDelegate {
    
}

protocol FriendsDebtViewToPresenterProtocol: AnyObject {
    var view: FriendsDebtPresenterToViewProtocol? { get set }
    var interactor: FriendsDebtPresenterToInteractorProtocol? { get set }
    var router: FriendsDebtPresenterToRouterProtocol? { get set }
    
    func addDebt(userId: String,
                 friendsId: String,
                 totalDebt: Int,
                 date: Date
    )
}

protocol FriendsDebtPresenterToRouterProtocol: AnyObject {
    func createModule() -> FriendsDebtVC
}

protocol FriendsDebtPresenterToViewProtocol: AnyObject {

}

protocol FriendsDebtInteractorToPresenterProtocol: AnyObject {

}

protocol FriendsDebtPresenterToInteractorProtocol: AnyObject {
    var presenter: FriendsDebtInteractorToPresenterProtocol? { get set }
    func addDebt(userId: String,
                 friendsId: String,
                 totalDebt: Int,
                 date: Date
    )

}
