//
//  OnBoardingProtocol.swift
//  Macro Challenge ADAIL
//
//  Created by Sukma Risfa Sam Bima Yudha on 12/11/21.
//

import Foundation

protocol OnBoardingViewToPresenterProtocol: AnyObject {
    var view: OnBoardingPresenterToViewProtocol? { get set }
    var router: OnBoardingPresenterToRouterProtocol? { get set }
}

protocol OnBoardingPresenterToViewProtocol: AnyObject {
    
}

protocol OnBoardingPresenterToRouterProtocol: AnyObject {
    func createModule() -> OnBoardingVC
}
