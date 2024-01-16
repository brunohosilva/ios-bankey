//
//  DecimalUtils.swift
//  Bankey
//
//  Created by Bruno Oliveira on 09/01/24.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
