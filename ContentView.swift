//
//  ContentView.swift
//  iExpense
//
//  Created by Laura Marie Hope Assange on 4/3/24.
//

import SwiftData
import SwiftUI


struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    
    @Query var expensesItems: [ExpensesItems]
    
    @State private var showBusinessOnly = false
    
    @State private var path = [ExpensesItems]()
    @State private var sortOrder =
    SortDescriptor(\ExpensesItems.type)
    
    @State private var searchName = ""
    @State private var expenseType = ""
    
    
    
    var body: some View {
        NavigationStack(path: $path) {
            ItemsView(sort: sortOrder, searchString: searchName, typeString: expenseType)
                .navigationTitle("iExpense")
                .navigationDestination(for: ExpensesItems.self, destination: ExpensesItemsView.init)
                .searchable(text: $searchName)
                .toolbar {
                    Button("Add Expense", systemImage: "plus") {
                        let expensesItem = ExpensesItems(name: "", type: "Personal", amount: 0)
                        modelContext.insert(expensesItem)
                        path = [expensesItem]
                    }
                    
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("Sort by Description")
                                .tag(SortDescriptor(\ExpensesItems.name))
                            Text("Sort by Amount")
                                .tag(SortDescriptor(\ExpensesItems.amount))
                            Text("Sort by Type")
                                .tag(SortDescriptor(\ExpensesItems.type))
                        }
                        .pickerStyle(.inline)
                    }
                        
                        Menu("Filter", systemImage: "line.3.horizontal.decrease.circle.fill") {
                            Picker("Filter", selection: $expenseType) {
                                Text("Business Expenses")
                                    .tag("Business")
                                Text("Personal Expenses")
                                    .tag("Personal")
                                Text("All Expenses")
                                    .tag("")
                            }
                            .pickerStyle(.inline)
                        }
                    
                    
                }
            
            
            
        }
    }
}
    


#Preview {
    ContentView()
}
