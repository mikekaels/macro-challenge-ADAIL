//
//  HomeInteractor.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 22/10/21.
//

class HomeInteractor: HomePresenterToInteractorProtocol {
    
    var presenter: HomeInteractorToPresenterProtocol?
    
    func fetchUpcomingBills() {
        CloudKitHelper.fetchAllUpcoming { result in
            self.presenter?.didFetchUpcomingBills(data: result)
        }
    }
    
    func fetchFriendsDebt(userId: String) {
        CloudKitHelper.fetchAllDebts(userId: userId) { result in
            self.presenter?.didFetchFriendsDebt(debts: result)
        }
    }
    
    func fetchOweToFriend(userId: String) {
        CloudKitHelper.fetchAllOweToFriend(userId: userId) { result in
            self.presenter?.didFetchOweToFriend(debts: result)
        }
    }
    
    func fetchFriendsData(users: [String]) {
        CloudKitHelper.fetchUsersByID(IDs: users) { users in
            self.presenter?.didFetchFriendsData(users: users)
        }
    }
}
