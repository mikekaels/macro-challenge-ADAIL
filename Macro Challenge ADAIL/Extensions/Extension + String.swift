//
//  Extension + String.swift
//  Macro Challenge ADAIL
//
//  Created by Santo Michael Sihombing on 02/12/21.
//

import Foundation

extension String {
    // formatting text for currency textField
    func currencyFormatting() -> String {
        if let value = Double(self) {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.maximumFractionDigits = 0
            formatter.minimumFractionDigits = 0
            if let str = formatter.string(for: value) {
                return "Rp \(str)"
            }
        }
        return "Rp 0"
    }
}
