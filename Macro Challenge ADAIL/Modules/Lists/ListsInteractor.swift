//
//  ListsInteractor.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 25/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

class ListsInteractor: ListsPresenterToInteractorProtocol {
    
    var presenter: ListsInteractorToPresenterProtocol?
}

extension ListsInteractor {
    func fetchUpcoming() {
        CloudKitHelper.fetchAllUpcoming { result in
            self.presenter?.didFetchUpcoming(data: result)
        }
    }
}
