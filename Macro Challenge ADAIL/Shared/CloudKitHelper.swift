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
        
        let database = CKContainer(identifier: "iCloud.Marvelous.CoFi").publicCloudDatabase
        let recordId = CKRecord.ID(recordName: id)
        let record = CKRecord(recordType: "User", recordID: recordId)
        
//        record.setValue(id, forKey: "id")
        record.setValue(name, forKey: "name")
        record.setValue(email, forKey: "email")
        
        record.setValue(0, forKey: "phone")
        record.setValue("", forKey: "bankName")
        record.setValue(0, forKey: "accountNumber")
        
        record.setValue("", forKey: "group")
        
        database.save(record) { (savedRecord, error) in
            
            if error == nil {
                completion(User(id: id, name: name, email: email, phone: 0, bankName: "", accountNumber: 0, group: ""))
                
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
        
//        operation.desiredKeys = ["id", "name", "email", "phone", "bankName", "accountNumber"]
        operation.desiredKeys = ["name", "email", "phone", "bankName", "accountNumber", "group"]

        
        operation.recordFetchedBlock = { record in
            DispatchQueue.main.async {
                let id = record.recordID.recordName
                
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
                
                guard let group = record["group"] as? String else {
                    return
                }
                
                completion(User(id: id, name: name, email: email, phone: phone , bankName: bankName, accountNumber: accountNumber, group: group))
                Core.shared.signIn(id: id, name: name, email: email)
            }
        }
        
        database.add(operation)
    }
    
    static func createGroup(name: String, address: String, description: String, completion: @escaping (Group) -> ()) {
        print("Creating Group....")
        
        let database = CKContainer(identifier: "iCloud.Marvelous.CoFi").publicCloudDatabase
        let record = CKRecord(recordType: "Group")
        
        let date = Calendar.current.dateComponents([.year,.month,.day], from: .now)
        let year = date.year!
        let month = date.month!
        let day = date.day!
        let id = ("\(year)\(month)\(day)\(Int.random(in: 1000...9999))")
        
        let user = Core.shared.getID()
        
        record.setValue(id, forKey: "id")
        record.setValue(name, forKey: "name")
        record.setValue(address, forKey: "address")
        record.setValue(description, forKey: "description")
        record.setValue([user], forKey: "users")
        
        database.save(record) { (savedRecord, error) in
            
            if error == nil {
                completion(Group(id: id, name: name, address: address, description: description, users: [user]))
                
            } else {
                print("ERROR: ",error)
            }
            
        }
    }
    
    static func fetchGroup(id: String, completion: @escaping (Group) -> ()) {
        print("Fetching Group....")
        
        let database = CKContainer(identifier: "iCloud.Marvelous.CoFi").publicCloudDatabase

        let predicate = NSPredicate(value: true)
        
        let query = CKQuery(recordType: "Group", predicate: predicate)
        
        let operation = CKQueryOperation(query: query)
        
        operation.desiredKeys = ["id", "name", "address", "address", "description", "users"]

        operation.recordFetchedBlock = { record in
            DispatchQueue.main.async {
                guard let id = record["id"] as? String else {
                    return
                }
                
                guard let name = record["name"] as? String else {
                    return
                }
                
                guard let address = record["address"] as? String else {
                    return
                }
                
                guard let description = record["description"] as? String else {
                    return
                }
                guard let users = record["users"] as? [String] else {
                    return
                }
                
                completion(Group(id: id, name: name, address: address, description: description, users: users))
            }
        }
        database.add(operation)
    }
    
    func updateUserGroup(id: String){
        
    }
    
}


struct User {
    let id: String
    let name: String
    let email: String
    let phone: Int
    let bankName: String
    let accountNumber: Int
    let group: String
}

struct Group {
    let id: String
    let name: String
    let address: String
    let description: String
    let users: [String]
}
