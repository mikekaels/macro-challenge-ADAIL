//
//  ProfileInteractor.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 23/10/21.
//

class ProfileInteractor: ProfilePresentertoInteractorProtocol {
    var presenter: ProfileInteractorToPresenterProtocol?
}

extension ProfileInteractor {
    func fetchGroup() {
        let id = Core.shared.getGroupID()
        CloudKitHelper.fetchGroup(id: id, completion: { group in
            self.presenter?.didFetchGroup(group: group)
        })
    }
}

