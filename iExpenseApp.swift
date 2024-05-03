//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Laura Marie Hope Assange on 4/3/24.
//

import SwiftData
import SwiftUI

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ExpensesItems.self)    }
}
