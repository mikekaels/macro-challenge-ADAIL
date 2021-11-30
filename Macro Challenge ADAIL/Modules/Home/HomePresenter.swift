//
//  HomePresenter.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 22/10/21.
//

import Foundation
import UIKit

class HomePresenter: HomeViewToPresenterProtocol {
    
    var view: HomePresenterToViewProtocol?
    
    var interactor: HomePresenterToInteractorProtocol?
    
    var router: HomePresenterToRouterProtocol?
    
    func goToAccount(from: HomeVC) {
        router?.goToAccount(from: from)
    }
}

extension HomePresenter: HomeInteractorToPresenterProtocol {
    
}
