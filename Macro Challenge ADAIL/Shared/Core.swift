//
//  Core.swift
//  Macro Challenge ADAIL
//
//  Created by Sukma Risfa Sam Bima Yudha on 13/11/21.
//

import Foundation

class Core {
    static let shared = Core()
    
    func getID() -> String {
        guard let id = UserDefaults.standard.string(forKey: "id") else { return "" }
        return id
    }
    
//    func getUserForGroup() -> [User] {
//        var user = [User(id: "", name: "", email: "", phone: 0, bankName: "", accountNumber: 0)]
//        guard let id = UserDefaults.standard.string(forKey: "id") else { return user }
//        guard let name = UserDefaults.standard.string(forKey: "name") else { return user }
//        guard let email = UserDefaults.standard.string(forKey: "email") else { return user }
//        user = [User(id: id, name: name, email: email, phone: 0, bankName: "", accountNumber: 0)]
//        return user
//    }
    
    func signIn(id: String, name: String, email: String) {
        UserDefaults.standard.set(id, forKey: "id")
        UserDefaults.standard.set(name, forKey: "name")
        UserDefaults.standard.set(email, forKey: "email")
    }
    
    func signOut() {
        UserDefaults.standard.removeObject(forKey: "id")
        UserDefaults.standard.removeObject(forKey: "name")
        UserDefaults.standard.removeObject(forKey: "email")
    }
    
    func getGroupID() -> String {
        guard let id = UserDefaults.standard.string(forKey: "groupId") else { return "" }
        return id
    }
    
    func groupIn(id: String, name: String, address: String, description: String, users: [String]){
        UserDefaults.standard.set(id, forKey: "groupId")
        UserDefaults.standard.set(name, forKey: "groupName")
        UserDefaults.standard.set(address, forKey: "groupAddress")
        UserDefaults.standard.set(description, forKey: "groupDescription")
        UserDefaults.standard.set(users, forKey: "groupMembers")
    }
    
    func groupOut() {
        UserDefaults.standard.removeObject(forKey: "groupId")
        UserDefaults.standard.removeObject(forKey: "groupName")
        UserDefaults.standard.removeObject(forKey: "groupAddress")
        UserDefaults.standard.removeObject(forKey: "groupDescription")
        UserDefaults.standard.removeObject(forKey: "groupMembers")
    }
}
