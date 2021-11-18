//
//  Extension + UIViewController.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 16/11/21.
//

import UIKit

extension UIViewController {
    func hideNavigationBar(animated: Bool){
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)

    }

    func showNavigationBar(animated: Bool) {
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
