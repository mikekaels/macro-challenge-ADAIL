//
//  CloudKitHelper.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 28/11/21.
//

import CloudKit

class CloudKitHelper {
    
    static func hello() {
        print("Hello World")
    }
    
    static func createUser(id: String, name: String, email: String, completion: @escaping (User) -> ()) {
        print("Creating User....")
        
        let database = CKContainer(identifier: "iCloud.cofi-one").publicCloudDatabase
        let record = CKRecord(recordType: "User")
        
        record.setValue(id, forKey: "id")
        record.setValue(name, forKey: "name")
        record.setValue(email, forKey: "email")
        record.setValue(email, forKey: "email")
        
        record.setValue(0, forKey: "phone")
        record.setValue("", forKey: "bankName")
        record.setValue(0, forKey: "accountNumber")
        
        database.save(record) { (savedRecord, error) in
            
            if error == nil {
                completion(User(id: id, name: name, email: email, phone: 0, bankName: "", accountNumber: 0))
                
            } else {
                print("ERROR: ",error)
            }
            
        }
    }
    
    static func fetchOneUser(id: String, completion: @escaping (User) -> ()) {
        print("Fetching User....")
        
        let database = CKContainer(identifier: "iCloud.cofi-one").publicCloudDatabase
        
        let predicate = NSPredicate(value: true)
        
        let query = CKQuery(recordType: "User", predicate: predicate)
        
        let operation = CKQueryOperation(query: query)
        
        operation.desiredKeys = ["id", "name", "email", "phone", "bankName", "accountNumber"]
        
        operation.recordFetchedBlock = { record in
            DispatchQueue.main.async {
                guard let id = record["id"] as? String else {
                    return
                }
                
                guard let name = record["name"] as? String else {
                    return
                }
                
                guard let email = record["email"] as? String else {
                    return
                }
                
                guard let phone = record["phone"] as? Int else {
                    return
                }
                guard let bankName = record["bankName"] as? String else {
                    return
                }
                
                guard let accountNumber = record["accountNumber"] as? Int else {
                    return
                }
                
                completion(User(id: id, name: name, email: email, phone: phone , bankName: bankName, accountNumber: accountNumber))
            }
        }
        
        database.add(operation)
    }
}


struct User {
    let id: String
    let name: String
    let email: String
    let phone: Int
    let bankName: String
    let accountNumber: Int
}

struct Group {
    let name: String
    let address: String
    let description: String
    let users: [User]
}
