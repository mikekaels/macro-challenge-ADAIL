//
//  CloudKitHelper.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 28/11/21.
//

import CloudKit
import SwiftUI
import simd

class CloudKitHelper {
    
    public static let shared = CloudKitHelper()
    
    private static let identifier: String = "iCloud.cofi-one"
    
    enum recordType: String {
        case DebtType = "Debt"
        case DebtHistoryType = "DebtHistory"
    }
    
    enum error: Error {
        case noData
        case error
    }
    
    private static let database = CKContainer(identifier: CloudKitHelper.identifier).publicCloudDatabase
    
    
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
    
    static func fetchUserByRecordID(id: String, completion: @escaping (User) -> ()) {
        let database = CKContainer(identifier: CloudKitHelper.identifier).publicCloudDatabase
        
        let recordId = CKRecord.ID(recordName: id)
        
        let predicate = NSPredicate(format: "recordID == %@", recordId)
        
        let query = CKQuery(recordType: "User", predicate: predicate)
        
        let operation = CKQueryOperation(query: query)
        
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
            }
        }
        
        database.add(operation)
    }
    
    static func fetchUsersByID(IDs: [String], completion: @escaping ([User]) -> ()) {
        let database = CKContainer(identifier: CloudKitHelper.identifier).publicCloudDatabase
        
        let recordIDs = IDs.map { CKRecord.ID(recordName: $0) }
        print("RECORD IDs: ",recordIDs)
        let operation = CKFetchRecordsOperation(recordIDs: recordIDs)
        var users: [User] = []
        
        operation.desiredKeys = ["name", "email", "phone", "bankName", "accountNumber", "group"]
        
        operation.fetchRecordsCompletionBlock = { (ckRecords, error) in
            
            DispatchQueue.main.async {
                
                ckRecords?.mapValues { (record) in
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
                    
                    users.append(User(id: id, name: name, email: email, phone: phone , bankName: bankName, accountNumber: accountNumber, group: group))
                }
                completion(users)
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
            fetchUserByRecordID(id: i) { record in
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
    
    static func addDebt(userId: String, friendId: String, totalDebt: Int, date: Date, completion: @escaping (Result<DebtHistory, Error>) -> ()) {
        
        fetchDebt(userId: userId, friendId: friendId) { result in
            switch result {
            case .success(let debt):
                
                createDebtHistory(userId: userId, friendId: friendId, total: totalDebt, date: date) { result in
                    
                    switch result {
                    case .success(let data):
                        updateDebt(userId: data.userId, friendId: data.friendId, total: data.totalDebt)
                        completion(.success(DebtHistory(id: data.id, userId: data.userId, friendId: data.friendId, totalDebt: data.totalDebt, date: data.date)))
                    case .failure(let err):
                        print("ERR1: ",err)
                        completion(.failure(err))
                    }
                }
                
            case .failure(let err):
                if err == error.noData {
                    createDebt(userId: userId, friendId: friendId, total: totalDebt) { result in
                        switch result {
                        case .success(let data):
                            createDebtHistory(userId: userId, friendId: friendId, total: totalDebt, date: date) { result in
                                switch result {
                                case .success(let data):
                                    updateDebt(userId: data.userId, friendId: data.friendId, total: data.totalDebt)
                                    completion(.success(DebtHistory(id: data.id, userId: data.userId, friendId: data.friendId, totalDebt: data.totalDebt, date: data.date)))
                                case .failure(let err):
                                    completion(.failure(err))
                                }
                            }
                        case .failure(let err):
                            print(err)
                        }
                    }
                }
            }
        }
    }
    
    static func createDebt(userId: String, friendId: String, total: Int, completion: @escaping(Result<CKRecord, Error>) -> ()) {
        let database = CKContainer(identifier: CloudKitHelper.identifier).publicCloudDatabase
        let record = CKRecord(recordType: recordType.DebtType.rawValue)
        
        record.setValue(userId,forKey: "userId")
        record.setValue(friendId, forKey: "friendId")
        record.setValue(total,forKey: "total")
        
        database.save(record) { (savedRecord, error) in
            
            if error == nil {
                completion(.success(savedRecord!))
            } else {
                completion(.failure(error!))
            }
        }
    }
    
    static func updateDebt(userId: String, friendId: String, total: Int) {
        print("UPDATE DEBT....")
        fetchDebt(userId: userId, friendId: friendId) { result in
            switch result {
            case .success(let data):
                print(data)
                let newTotal = data.total + total
                
                let recordId = CKRecord.ID(recordName: data.id)
                
                let record = CKRecord(recordType: "Debt", recordID: recordId)
                
                record.setValue(newTotal, forKey: "total")
                
                let updateOperation = CKModifyRecordsOperation(recordsToSave: [record])
                
                updateOperation.savePolicy = .allKeys
                
                CloudKitHelper.database.add(updateOperation)
                
            case .failure(let err):
                print(err)
            }
        }
    }
    
    static func createDebtHistory(userId: String, friendId: String, total: Int, date: Date, completion: @escaping(Result<DebtHistory, Error>) -> ()) {
        let record = CKRecord(recordType: recordType.DebtHistoryType.rawValue)
        
        record.setValue(userId,forKey: "userId")
        record.setValue(friendId, forKey: "friendId")
        record.setValue(total,forKey: "total")
        record.setValue(date, forKey: "date")
        
        CloudKitHelper.database.save(record) { (savedRecord, error) in
            
            if error == nil {
                let debtId = savedRecord!.recordID.recordName
                guard let userId = savedRecord!["userId"] as? String else {
                    return
                }
                guard let friendId = savedRecord!["friendId"] as? String else {
                    return
                }
                guard let date = savedRecord!["date"] as? Date else {
                    return
                }
                guard let total = savedRecord!["total"] as? Int else {
                    return
                }
                completion(.success(DebtHistory(id: debtId, userId: userId, friendId: friendId, totalDebt: total, date: date)))
            } else {
                completion(.failure(error!))
            }
        }
    }
    
    static func fetchDebt(userId: String, friendId: String, completion: @escaping ((Result<Debt, error>)) -> ()) {
        
        let pred1 = NSPredicate(format: "userId == %@", userId)
        
        let pred2 = NSPredicate(format: "friendId == %@", friendId)
        
        let predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [pred1, pred2])
        
        let query = CKQuery(recordType: "Debt", predicate: predicate)
        
        let operation = CKQueryOperation(query: query)
        
        var debt: Debt?
        
        operation.recordFetchedBlock = { (records) in
            let id = records.recordID.recordName
            guard let userId = records["userId"] as? String else { return }
            guard let friendId = records["friendId"] as? String else { return }
            guard let total = records["total"] as? Int else { return }
            
            debt = Debt(userId: userId, friendId: friendId, total: total, id: id)
        }
        
        operation.queryCompletionBlock = { _, err in
            DispatchQueue.main.async {
                if let error = err {
                    print(error.localizedDescription)
                    completion(.failure(.noData))
                } else {
                    if debt != nil {
                        completion(.success(debt!))
                    } else {
                        completion(.failure(.noData))
                    }
                }
            }
        }
        
        CloudKitHelper.database.add(operation)
    }
    
    static func fetchUsersByGroupId(groupId: String, completion: @escaping(Result<[User], error>) -> ()) {
        let pred1 = NSPredicate(format: "group == %@", groupId)
        
        let predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [pred1])
        
        let query = CKQuery(recordType: "User", predicate: predicate)
        
        let operation = CKQueryOperation(query: query)
        
        var users: [User] = [User]()
        
        operation.recordFetchedBlock = { (record) in
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
                
                if id != Core().getID() {
                    users.append(User(id: id, name: name, email: email, phone: phone , bankName: bankName, accountNumber: accountNumber, group: group))
                }
            }
        }
        
        operation.queryCompletionBlock = { _, err in
            DispatchQueue.main.async {
                if let error = err {
                    print(error.localizedDescription)
                    completion(.failure(.noData))
                } else {
                    completion(.success(users))
                }
            }
        }
        
        CloudKitHelper.database.add(operation)
    }
    
    static func fetchAllDebts(userId: String, completion: @escaping ([Debt]) -> ()) {
        let groupID = Core().getGroupID()
        
        let database = CKContainer(identifier: CloudKitHelper.identifier).publicCloudDatabase
        
        let pred1 = NSPredicate(format: "userId == %@", userId)
        
        let predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [pred1])
        
        let query = CKQuery(recordType: "Debt", predicate: predicate)
        
//        let sort = NSSortDescriptor(key: "modifiedTimestamp", ascending: false)
//        query.sortDescriptors = [sort]
//
        let operation = CKQueryOperation(query: query)
        
        var results: [Debt] = []
        
        operation.recordFetchedBlock = { (record) in
            let id = record.recordID.recordName
            guard let userId = record["userId"] as? String else { return }
            guard let friendId = record["friendId"] as? String else { return }
            guard let total = record["total"] as? Int else { return }
            let debt = Debt(userId: userId, friendId: friendId, total: total, id: id)
            results.append(debt)
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
    
    static func fetchHistoryDebt(userId: String, friendId: String,completion: @escaping ([DebtHistory]) -> ()) {
        let pred1 = NSPredicate(format: "userId == %@", userId)
        
        let pred2 = NSPredicate(format: "friendId == %@", friendId)
        
        let predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [pred1, pred2])
        
        let query = CKQuery(recordType: "DebtHistory", predicate: predicate)
        
        let sort = NSSortDescriptor(key: "creationDate", ascending: false)
        query.sortDescriptors = [sort]
        
        let operation = CKQueryOperation(query: query)
        
        var results: [DebtHistory] = []
        
        operation.recordFetchedBlock = { (records) in
            let id = records.recordID.recordName
            guard let userId = records["userId"] as? String else { return }
            guard let friendId = records["friendId"] as? String else { return }
            guard let totalDebt = records["total"] as? Int else { return }
            guard let date = records["date"] as? Date else { return }
            
            
            let debtHistory = DebtHistory(id: id, userId: userId, friendId: friendId, totalDebt: totalDebt, date: date)
            results.append(debtHistory)
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
        
        CloudKitHelper.database.add(operation)
    }
    
}

struct Debt: Equatable {
    let userId: String
    let friendId: String
    let total: Int
    let id: String
}

struct DebtHistory {
    let id: String
    let userId: String
    let friendId: String
    let totalDebt: Int
    let date: Date
}

struct PaidHistory {
    let id: String
    let userId: String
    let friendId: String
    let totalpaid: Int
    let date: Date
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

