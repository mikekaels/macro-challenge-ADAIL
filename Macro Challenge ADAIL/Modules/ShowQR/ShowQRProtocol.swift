//
//  ShowQRProtocol.swift
//  Macro Challenge ADAIL
//
//  Created by Sukma Risfa Sam Bima Yudha on 19/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

public protocol ShowQRDelegate {
    
}

protocol ShowQRViewToPresenterProtocol: AnyObject {
    var view: ShowQRPresenterToViewProtocol? { get set }
    var interactor: ShowQRPresenterToInteractorProtocol? { get set }
    var router: ShowQRPresenterToRouterProtocol? { get set }
}

protocol ShowQRPresenterToRouterProtocol: AnyObject {
    func createModule() -> ShowQRVC
}

protocol ShowQRPresenterToViewProtocol: AnyObject {

}

protocol ShowQRInteractorToPresenterProtocol: AnyObject {

}

protocol ShowQRPresenterToInteractorProtocol: AnyObject {
    var presenter: ShowQRInteractorToPresenterProtocol? { get set }

}
