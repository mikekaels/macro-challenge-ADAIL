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
}
