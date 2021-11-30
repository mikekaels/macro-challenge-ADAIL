//
//  MemberCollectionView.swift
//  Macro Challenge ADAIL
//
//  Created by Sukma Risfa Sam Bima Yudha on 15/11/21.
//

import Foundation
import UIKit

extension ProfileVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let member = group?.users.count ?? 0
        return member
    }
    
    func getCollection() -> [GroupUser]{
        if let members = UserDefaults.standard.value(forKey: "groupMembers") as? Data {
            let array = try? PropertyListDecoder().decode(Array<GroupUser>.self, from: members)
            return array!
        }
        return [GroupUser(id: "", name: "")]
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("collection view check")
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MemberCollectionViewCell.identifier, for: indexPath) as! MemberCollectionViewCell
        cell.setItem(getCollection()[indexPath.row])
        return cell
    }
}
