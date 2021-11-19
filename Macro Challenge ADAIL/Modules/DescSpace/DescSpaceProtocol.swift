//
//  DescSpaceProtocol.swift
//  Macro Challenge ADAIL
//
//  Created by Sukma Risfa Sam Bima Yudha on 19/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

public protocol DescSpaceDelegate {
    
}

protocol DescSpaceViewToPresenterProtocol: AnyObject {
    var view: DescSpacePresenterToViewProtocol? { get set }
    var interactor: DescSpacePresenterToInteractorProtocol? { get set }
    var router: DescSpacePresenterToRouterProtocol? { get set }
}

protocol DescSpacePresenterToRouterProtocol: AnyObject {
    func createModule() -> DescSpaceVC
}

protocol DescSpacePresenterToViewProtocol: AnyObject {

}

protocol DescSpaceInteractorToPresenterProtocol: AnyObject {

}

protocol DescSpacePresenterToInteractorProtocol: AnyObject {
    var presenter: DescSpaceInteractorToPresenterProtocol? { get set }

}
