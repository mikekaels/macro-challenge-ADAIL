//
//  ProfileVCEmptyState.swift
//  Macro Challenge ADAIL
//
//  Created by Sukma Risfa Sam Bima Yudha on 15/11/21.
//

import Foundation
import UIKit
import AVFoundation

extension ProfileVC {
    
    func setupEmptyView() {
        self.navigationController?.isNavigationBarHidden = true
        
//        let emptyView: UIView = {
//            let view = UIView()
//            view.backgroundColor = .secondarySystemBackground
//            return view
//        }()
        
        let card: UIView = {
            let view = UIView()
            view.backgroundColor = .white
            view.layer.cornerRadius = 20
            return view
        }()
        
        let createButton: UIButton = {
            let btn = UIButton()
            btn.backgroundColor = .systemBlue
            btn.setTitle("Create Co-Living Space", for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
            btn.setTitleColor(UIColor.white, for: .normal)
            btn.layer.cornerRadius = 8
            return btn
        }()
        
        let joinButton: UIButton = {
            let btn = UIButton()
            btn.backgroundColor = .systemBlue
            btn.setTitle("Join Co-Living Space", for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
            btn.setTitleColor(UIColor.white, for: .normal)
            btn.layer.cornerRadius = 8
            return btn
        }()
        
        
        
        view.addSubview(emptyView)
        emptyView.frame = view.frame
        emptyView.center = view.center
        
        emptyView.addSubview(card)
        card.frame = CGRect(x: 0, y: 0, width: 350, height: 350)
        card.center = emptyView.center
        
        emptyView.addSubview(createButton)
        createButton.frame = CGRect(x: 0, y: 0, width: 315, height: 50)
        createButton.center = emptyView.center
        createButton.frame.origin.y -= 30
        createButton.addTarget(self, action: #selector(didTapCreate), for: .touchUpInside)
        
        emptyView.addSubview(joinButton)
        joinButton.frame = CGRect(x: 0, y: 0, width: 315, height: 50)
        joinButton.center = emptyView.center
        joinButton.frame.origin.y += 30
        joinButton.addTarget(self, action: #selector(didTapJoin), for: .touchUpInside)
    }
    
    @objc func didTapCreate() {
        print("Create Co-Living Space")
        presentor?.router?.goToCreateSpace(from: self)
    }
    
    @objc func didTapJoin() {
        print("Join Co-Living Space")
        presentor?.router?.goToJoinSpace(from: self)
    }
    
    
}

