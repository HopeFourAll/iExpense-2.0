//
//  ExpensesItemsView.swift
//  iExpense
//
//  Created by Laura Marie Hope Assange on 4/30/24.
//
import SwiftData
import SwiftUI

struct ExpensesItemsView: View {
    
    @Bindable var expensesItems: ExpensesItems
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        
        Form {
            TextField("Description", text: $expensesItems.name)
            TextField("Amount", value: $expensesItems.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                .keyboardType(.decimalPad)
            Picker("Type", selection: $expensesItems.type) {
                ForEach(types, id: \.self) {
                    Text($0)
                }
            }
        }
        
        .navigationTitle("Expense Details")
        .navigationBarTitleDisplayMode(.inline)
    }
        
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: ExpensesItems.self, configurations: config)
        let expensesItems = ExpensesItems(name: "Lunch", type: "Personal", amount: 10.50)
        
        return ExpensesItemsView(expensesItems: expensesItems)
            .modelContainer(container)
        
    } catch {
        return Text("Failed to create container \(error.localizedDescription)")
    }
}
    
    

