//
//  RecordInteractor.swift
//  Macro Challenge ADAIL
//
//  Created by Sukma Risfa Sam Bima Yudha on 26/10/21.
//

import Foundation

class RecordInteractor: RecordPresenterToInteractorProtocol {
    var presenter: RecordInteractorToPresenterProtocol?
    
    func fetchRecords() {
        CloudKitHelper.fetchAllExpanses { result in
            self.presenter?.didFetchRecords(expanses: result)
        }
    }
}
