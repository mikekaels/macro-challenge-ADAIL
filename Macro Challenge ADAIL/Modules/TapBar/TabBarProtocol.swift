//
//  TabBarProtocol.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 23/10/21.
//

import Foundation

protocol TabBarViewToPresenterProtocol: AnyObject {
    var view: TabBarPresenterToViewProtocol? { get set }
    var router: TabBarPresenterToRouterProtocol? { get set }
}

protocol TabBarPresenterToViewProtocol: AnyObject {
    
}

protocol TabBarPresenterToRouterProtocol: AnyObject {
    func createModule() -> TabBarVC
}
