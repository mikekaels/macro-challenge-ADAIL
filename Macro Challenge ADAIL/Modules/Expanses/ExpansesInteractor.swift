//
//  ExpansesInteractor.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 01/12/21.
//

import Foundation
class ExpansesInteractor: ExpansesPresenterToInteractorProtocol {
    var presenter: ExpansesInteractorToPresenterProtocol?
}

extension ExpansesInteractor {
    func saveExpanses(expanses: Expanses) {
        CloudKitHelper.createExpanses(expanses: expanses) { result in
            self.presenter?.didCreateExpanses(expanses: expanses)
        }
    }
}
