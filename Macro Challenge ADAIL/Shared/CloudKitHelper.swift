//
//  CloudKitHelper.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 28/11/21.
//

import CloudKit

class CloudKitHelper {
    
    public static let shared = CloudKitHelper()
    
    private static let identifier: String = "iCloud.cofi-one"
    
    static func hello() {
        print("Hello World")
        
    }
    
    static func createUser(id: String, name: String, email: String, completion: @escaping (User) -> ()) {
        print("Creating User....")
        
        let database = CKContainer(identifier: CloudKitHelper.identifier).publicCloudDatabase
        let recordId = CKRecord.ID(recordName: id)
        let record = CKRecord(recordType: "User", recordID: recordId)
        
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
    
    static func createExpanses(expanses: Expanses, completion: @escaping(Expanses) -> ()) {
        //        print(expanses)
        let database = CKContainer(identifier: CloudKitHelper.identifier).publicCloudDatabase
        let record = CKRecord(recordType: "Expanses")
        
        record.setValue(expanses.groupID, forKey: "groupID")
        record.setValue(expanses.userId, forKey: "userID")
        
        record.setValue(expanses.icon, forKey: "icon")
        record.setValue(expanses.transactionName, forKey: "transactionName")
        record.setValue(expanses.totalTransaction, forKey: "totalTransaction")
        record.setValue(expanses.paymentDate, forKey: "paymentDate")
        record.setValue(expanses.remindTime.rawValue, forKey: "remindTime")
        record.setValue(expanses.note, forKey: "note")
        record.setValue(expanses.isRepeat, forKey: "isRepeat")
        record.setValue(expanses.isPaid, forKey: "isPaid")
        database.save(record) { (savedRecord, error) in
            
            if error == nil {
                print("saved Record", savedRecord)
                completion(expanses)
            } else {
                print("ERROR: ",error)
            }
        }
    }
    
    static func fetchAllExpanses(completion: @escaping ([Expanses]) -> ()) {
        let groupID = Core().getGroupID()
        
        let database = CKContainer(identifier: CloudKitHelper.identifier).publicCloudDatabase
        
        let pred1 = NSPredicate(format: "groupID == %@", groupID)
        
        let predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [pred1])
        
        let query = CKQuery(recordType: "Expanses", predicate: predicate)
        
        let sort = NSSortDescriptor(key: "creationDate", ascending: false)
        query.sortDescriptors = [sort]
        
        let operation = CKQueryOperation(query: query)
        //        operation.desiredKeys = ["text"]
        operation.resultsLimit = 50
        
        var results: [Expanses] = []
        
        operation.recordFetchedBlock = { (records) in
//            results.append(record)
            guard let groupID = records["groupID"] as? String else { return }
            guard let userId = records["groupID"] as? String else { return }
            guard let icon = records["icon"] as? String else { return }
            guard let transactionName = records["transactionName"] as? String else { return }
            guard let totalTransaction = records["totalTransaction"] as? Int else { return }
            guard let paymentDate = records["paymentDate"] as? Date else { return }
            guard let remindTime = records["remindTime"] as? Int else { return }
            guard let isRepeat = records["isRepeat"] as? Int else { return }
            guard let note = records["note"] as? String else { return }
            guard let isPaid = records["isPaid"] as? Bool else { return }

            
            let expanses = Expanses(groupID: groupID, userId: userId, icon: icon, transactionName: transactionName, totalTransaction: totalTransaction, paymentDate: paymentDate, remindTime: remindAt(rawValue: remindTime)!, isRepeat: isRepeat == 1 ? true : false, note: note, isPaid: isPaid)
            
            results.append(expanses)
        }
        
        operation.queryCompletionBlock = { _, err in
            DispatchQueue.main.async {
                if let error = err {
                    print(error)
                } else {
                    completion(results)
                }
            }
        }
        
        database.add(operation)
    }
    
    static func fetchAllUpcoming(completion: @escaping ([Expanses]) -> ()) {
        let groupID = Core().getGroupID()
        
        let database = CKContainer(identifier: CloudKitHelper.identifier).publicCloudDatabase
        
        let pred1 = NSPredicate(format: "groupID == %@", groupID)
        
        let pred2 = NSPredicate(format: "isRepeat == %i", 1)
        
        let predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [pred1, pred2])
        
        let query = CKQuery(recordType: "Expanses", predicate: predicate)
        
        let sort = NSSortDescriptor(key: "paymentDate", ascending: false)
        query.sortDescriptors = [sort]
        
        let operation = CKQueryOperation(query: query)
        //        operation.desiredKeys = ["text"]
        operation.resultsLimit = 50
        
        var results: [Expanses] = []
        
        operation.recordFetchedBlock = { (records) in
//            results.append(record)
            guard let groupID = records["groupID"] as? String else { return }
            guard let userId = records["groupID"] as? String else { return }
            guard let icon = records["icon"] as? String else { return }
            guard let transactionName = records["transactionName"] as? String else { return }
            guard let totalTransaction = records["totalTransaction"] as? Int else { return }
            guard let paymentDate = records["paymentDate"] as? Date else { return }
            guard let remindTime = records["remindTime"] as? Int else { return }
            guard let isRepeat = records["isRepeat"] as? Int else { return }
            guard let note = records["note"] as? String else { return }
            guard let isPaid = records["isPaid"] as? Bool else { return }

            
            let expanses = Expanses(groupID: groupID, userId: userId, icon: icon, transactionName: transactionName, totalTransaction: totalTransaction, paymentDate: paymentDate, remindTime: remindAt(rawValue: remindTime)!, isRepeat: isRepeat == 1 ? true : false, note: note, isPaid: isPaid)
            
            results.append(expanses)
        }
        
        operation.queryCompletionBlock = { _, err in
            DispatchQueue.main.async {
                if let error = err {
                    print(error)
                } else {
                    completion(results)
                }
            }
        }
        
        database.add(operation)
    }
    
    static func fetchOneUser(id: String, completion: @escaping (User) -> ()) {
        print("Fetching User....")
        
        let database = CKContainer(identifier: CloudKitHelper.identifier).publicCloudDatabase
        
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
                //                Core.shared.signIn(id: id, name: name, email: email)
            }
        }
        
        database.add(operation)
    }
    
    static func createGroup(name: String, address: String, description: String, completion: @escaping (Group) -> ()) {
        print("Creating Group....")
        
        let date = Calendar.current.dateComponents([.year,.month,.day], from: .now)
        let year = date.year!
        let month = date.month!
        let day = date.day!
        let id = ("\(year)\(month)\(day)\(Int.random(in: 1000...9999))")
        
        let user = Core.shared.getID()
        
        let database = CKContainer(identifier: CloudKitHelper.identifier).publicCloudDatabase
        let recordId = CKRecord.ID(recordName: id)
        let record = CKRecord(recordType: "Group", recordID: recordId)
        
        record.setValue(name, forKey: "name")
        record.setValue(address, forKey: "address")
        record.setValue(description, forKey: "description")
        record.setValue([user], forKey: "users")
        
        database.save(record) { (savedRecord, error) in
            
            if error == nil {
                completion(Group(id: id, name: name, address: address, description: description, users: [user]))
                self.updateUserGroup(user: user, group: id)
                
            } else {
                print("ERROR: ",error)
            }
            
        }
    }
    
    static func fetchGroup(id: String, completion: @escaping (Group) -> ()) {
        print("Fetching Group....")
        
        let database = CKContainer(identifier: CloudKitHelper.identifier).publicCloudDatabase
        
        let predicate = NSPredicate(value: true)
        
        let query = CKQuery(recordType: "Group", predicate: predicate)
        
        let operation = CKQueryOperation(query: query)
        
        operation.desiredKeys = ["name", "address", "address", "description", "users"]
        
        operation.recordFetchedBlock = { record in
            DispatchQueue.main.async {
                let id = record.recordID.recordName
                
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
                fetchListUsers(users: users)
                
            }
        }
        database.add(operation)
    }
    
    static func fetchListUsers(users: [String]){
        var listUsers:[GroupUser] = []
        for i in users {
            fetchOneUser(id: i) { record in
                listUsers.append(GroupUser(id: record.id, name: record.name))
                print(listUsers)
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now()+1, execute: {
            UserDefaults.standard.set(try? PropertyListEncoder().encode(listUsers), forKey: "groupMembers")
            
        })
    }
    
    static func updateUserGroup(user: String, group: String){
        print("Update User Table....")
        
        let database = CKContainer(identifier: CloudKitHelper.identifier).publicCloudDatabase
        let recordId = CKRecord.ID(recordName: user)
        let record = CKRecord(recordType: "User", recordID: recordId)
        record.setValue(group, forKey: "group")
        
        let updateOperation = CKModifyRecordsOperation(recordsToSave: [record])
        updateOperation.savePolicy = .allKeys
        database.add(updateOperation)
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

struct GroupUser: Codable {
    let id: String
    let name: String
}
