//
//  ProfileInteractor.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 23/10/21.
//

class ProfileInteractor: ProfilePresenterToInteractorProtocol {
    
    var presenter: ProfileInteractorToPresenterProtocol?
}

extension ProfileInteractor {
    func fetchGroup() {
        let id = Core.shared.getGroupID()
        CloudKitHelper.fetchGroup(id: id, completion: { group in
            self.presenter?.didFetchGroup(group: group)
        })
    }
    
    func fetchUsers(IDs: [String]) {
        CloudKitHelper.fetchUsersByID(IDs: IDs) { users in
            self.presenter?.didFetchUsers(users: users)
        }
    }
}

