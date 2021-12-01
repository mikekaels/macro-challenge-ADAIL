//
//  ExpansesModel.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 01/12/21.
//

import Foundation

enum remindAt: Int {
    case never = 0
    case OneDay = 1
    case OneWeek = 2
    case TwoWeek = 3
    case ThreeWeek = 4
}

struct Expanses {
    let groupID: String
    let userId: String
    
    let icon: String
    let transactionName: String
    let totalTransaction: Int
    let paymentDate: Date
    let remindTime: remindAt
    let isRepeat: Bool
    let note: String
    let isPaid: Bool
}
