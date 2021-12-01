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
    
    func fetchRecords()
}

protocol RecordPresenterToViewProtocol: AnyObject {
    func didFetchRecords(expanses: [Expanses])
}

protocol RecordPresenterToInteractorProtocol: AnyObject {
    var presenter: RecordInteractorToPresenterProtocol? { get set }
    func fetchRecords()
}

protocol RecordInteractorToPresenterProtocol: AnyObject {
    func didFetchRecords(expanses: [Expanses])
}

protocol RecordPresenterToRouterProtocol: AnyObject {
    func createModule() -> RecordVC
    func goToDetailsRecord(from: RecordVC)
}
