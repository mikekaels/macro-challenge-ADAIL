//
//  OnBoardingInteractor.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 28/11/21.
//

import Foundation
import CloudKit


class OnBoardingInteractor: OnBoardingPresenterToInteractorProtocol {
    var presenter: OnBoardingInteractorToPresenterProtocol?
}

extension OnBoardingInteractor {
    
    func saveUser(id: String, name: String, email: String) {
        CloudKitHelper.createUser(id: id, name: name, email: email) { result in
            self.presenter?.didSaveUser(user: result)
        }
    }

    func fetchUser(id: String) {
        CloudKitHelper.fetchOneUser(id: id) { result in
            self.presenter?.didFetchUser(user: result)
            Core.shared.signIn(id: result.id, name: result.name, email: result.email)
        }
    }
}
