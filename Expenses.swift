//
//  Expenses.swift
//  iExpense
//
//  Created by Laura Marie Hope Assange on 4/30/24.
//

import Foundation
import SwiftData

@Model
class ExpensesItems {
    var id = UUID()
    var name: String
   var type: String
    var amount: Double
    
    init(id: UUID = UUID(), name: String, type: String, amount: Double) {
        self.id = id
        self.name = name
        self.type = type
        self.amount = amount
    }
}
