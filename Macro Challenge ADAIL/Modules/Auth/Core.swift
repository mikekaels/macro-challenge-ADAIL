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
    
    func signIn() {
        UserDefaults.standard.set(true, forKey: "isSignIn")
    }
    
    func signOut() {
        UserDefaults.standard.set(false, forKey: "isSignIn")
    }
}
