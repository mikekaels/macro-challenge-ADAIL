//
//  RecordProtocol.swift
//  Macro Challenge ADAIL
//
//  Created by Sukma Risfa Sam Bima Yudha on 26/10/21.
//

import Foundation

protocol RecordViewToPresenterProtocol: AnyObject {
    var view : RecordPresenterToViewProtocol? { get set }
    var interactor : RecordPresenterToInteractorProtocol? { get set }
    var router : RecordPresenterToRouterProtocol? { get set }
}

protocol RecordPresenterToViewProtocol: AnyObject {
    
}

protocol RecordPresenterToInteractorProtocol: AnyObject {
    var presenter: RecordInteractorToPresenterProtocol? { get set }
    
}

protocol RecordInteractorToPresenterProtocol: AnyObject {
    
}

protocol RecordPresenterToRouterProtocol: AnyObject {
    func createModule() -> RecordVC
}
