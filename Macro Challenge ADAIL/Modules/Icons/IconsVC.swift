//
//  IconsVC.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 22/11/21.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

struct Icon {
    var name: String
    var systemName: String
}

class IconsVC: UIViewController {
    var presentor: IconsViewToPresenterProtocol?
    public var delegate: IconsDelegate!
    
    var myCollectionView:UICollectionView?
    
    var icons: [Icon] = [
        Icon(name: "Food", systemName: "takeoutbag.and.cup.and.straw"),
        Icon(name: "Beverage", systemName: "cup.and.saucer"),
        Icon(name: "Appliance", systemName: "wrench.and.screwdriver"),
        Icon(name: "Wifi", systemName: "wifi"),
        Icon(name: "House", systemName: "house"),
        Icon(name: "Water", systemName: "drop"),
        Icon(name: "Electric", systemName: "powerplug"),
        Icon(name: "Loundry", systemName: "tshirt"),
        Icon(name: "Fuel", systemName: "fuelpump"),
        Icon(name: "Gas", systemName: "flame")
    ]{
        didSet {
            myCollectionView?.reloadData()
        }
    }
    
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        .configure { layout in
            layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 10, right: 20)
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
        return icons.count
        }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! IconCollectionViewCell
        let icon = icons[indexPath.row]
        myCell.iconLabel.text = icon.name
        myCell.image.image = UIImage(systemName: icon.systemName)
        return myCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let icon = icons[indexPath.row]
        presentor?.dismiss(from: self, icon: icon)
    }
}
