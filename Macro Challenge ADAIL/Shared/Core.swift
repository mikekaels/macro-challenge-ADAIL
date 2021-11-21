//
//  Core.swift
//  Macro Challenge ADAIL
//
//  Created by Sukma Risfa Sam Bima Yudha on 13/11/21.
//

import Foundation

class Core {
    static let shared = Core()
    
    func isSignIn() -> Bool {
        return UserDefaults.standard.bool(forKey: "isSignIn")
    }
    
    func signIn(user: String, name: String, email: String) {
        UserDefaults.standard.set(user, forKey: "userid")
        UserDefaults.standard.set(name, forKey: "name")
        UserDefaults.standard.set(email, forKey: "email")
        UserDefaults.standard.set(true, forKey: "isSignIn")
    }
    
    func signOut() {
        UserDefaults.standard.set(false, forKey: "isSignIn")
        UserDefaults.standard.removeObject(forKey: "userid")
        UserDefaults.standard.removeObject(forKey: "name")
        UserDefaults.standard.removeObject(forKey: "email")


    }
}
