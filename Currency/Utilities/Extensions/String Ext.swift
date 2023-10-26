//
//  String Ext.swift
//  Currency
//
//  Created by Юрий Кручинин on 24/10/23.
//

import Foundation

extension String {
    var isValidNumber: Bool {
        let textFormat = "^[1-9]\\d*$"
        let textPredicate = NSPredicate(format: "SELF MATCHES %@", textFormat)
        return textPredicate.evaluate(with: self)
    }
}
