//
//  CreateSpaceInteractor.swift
//  Macro Challenge ADAIL
//
//  Created by Sukma Risfa Sam Bima Yudha on 15/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

class CreateSpaceInteractor: CreateSpacePresenterToInteractorProtocol {
    var presenter: CreateSpaceInteractorToPresenterProtocol?
}

extension CreateSpaceInteractor {
    func saveGroup(name: String, address: String, description: String) {
        CloudKitHelper.createGroup(name: name, address: address, description: description, completion: { result in
            self.presenter?.didSaveGroup(group: Group(id: result.id, name: name, address: address, description: description, users: result.users))
        })
    }
}
