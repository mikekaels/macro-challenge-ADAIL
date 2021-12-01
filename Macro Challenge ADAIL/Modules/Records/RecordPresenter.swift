//
//  RecordPresenter.swift
//  Macro Challenge ADAIL
//
//  Created by Sukma Risfa Sam Bima Yudha on 26/10/21.
//

import Foundation

class RecordPresenter: RecordViewToPresenterProtocol {
    
    var view: RecordPresenterToViewProtocol?
    
    var interactor: RecordPresenterToInteractorProtocol?
    
    var router: RecordPresenterToRouterProtocol?
    
    func goToDetailsRecord(from: RecordVC) {
        router?.goToDetailsRecord(from: from)
    }
    
    func fetchRecords() {
        interactor?.fetchRecords()
    }
}

extension RecordPresenter: RecordInteractorToPresenterProtocol {
    func didFetchRecords(expanses: [Expanses]) {
        view?.didFetchRecords(expanses: expanses)
    }
    
    
}

