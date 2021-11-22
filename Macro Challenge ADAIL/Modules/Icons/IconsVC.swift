//
//  IconsVC.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 22/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

class IconsVC: UIViewController {
    var presentor: IconsViewToPresenterProtocol?
    public var delegate: IconsDelegate!
    
    var myCollectionView:UICollectionView?
    
    
    
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        .configure { layout in
            layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
            layout.itemSize = CGSize(width: 60, height: 60)
        }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Icons"
        view.backgroundColor = .secondarySystemBackground
        // Do any additional setup after loading the view.
        
        myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        myCollectionView?.register(IconCollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        myCollectionView?.backgroundColor = .secondarySystemBackground
        view.addSubview(myCollectionView ?? UICollectionView())
        
        self.view = view
        
        
        
        myCollectionView?.dataSource = self
        myCollectionView?.delegate = self
    }

}

extension IconsVC: IconsPresenterToViewProtocol {
    
}

extension IconsVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 100
        }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! IconCollectionViewCell
        return myCell
    }
}
