//
//  TabBarVC.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 23/10/21.
//

import UIKit

class TabBarVC: UITabBarController {
    var presentor: TabBarViewToPresenterProtocol?
    
    let C = Constants()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        view.backgroundColor = .systemBackground
        tabBar.layer.backgroundColor = UIColor.systemBackground.cgColor
        setupVCs()
    }
    
    func setupVCs() {
        viewControllers = [
            createNavController(for: HomeRouter().createModule(), title: NSLocalizedString(C.tab1Title, comment: ""), image: UIImage(systemName: C.tab1Icon)!),
            createNavController(for: RecordRouter().createModule(), title: NSLocalizedString(C.tab2Title, comment: ""), image: UIImage(systemName: C.tab2Icon)!),
            createNavController(for: ProfileRouter().createModule(), title: NSLocalizedString(C.tab3Title, comment: ""), image: UIImage(systemName: C.tab3Icon)!)
        ]
    }
    
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .systemBackground
        
        navController.navigationBar.setBackgroundImage(UIImage(), for: UIBarPosition.any, barMetrics: UIBarMetrics.defaultPrompt)
        navController.navigationBar.shadowImage = UIImage()
        
        navController.navigationBar.layer.borderColor = .none
        navController.navigationBar.standardAppearance = appearance
        navController.navigationBar.scrollEdgeAppearance = appearance
        
        return navController
    }
}

extension TabBarVC: UITabBarControllerDelegate{
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("Should select viewController: \(viewController.title ?? "") ?")
        return true;
    }
}

extension TabBarVC: TabBarPresenterToViewProtocol {
    
}


