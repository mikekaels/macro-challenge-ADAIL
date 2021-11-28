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
    
    func signIn(id: String, name: String, email: String) {
        UserDefaults.standard.set(id, forKey: "id")
        UserDefaults.standard.set(name, forKey: "name")
        UserDefaults.standard.set(email, forKey: "email")
    }
    
    func signOut() {
        UserDefaults.standard.removeObject(forKey: "userid")
        UserDefaults.standard.removeObject(forKey: "name")
        UserDefaults.standard.removeObject(forKey: "email")
    }
}
