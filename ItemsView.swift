//
//  ItemsView.swift
//  iExpense
//
//  Created by Laura Marie Hope Assange on 5/2/24.
//

import SwiftData
import SwiftUI

struct ItemsView: View {
    @Environment(\.modelContext) var modelContext
    @Query var expensesItems: [ExpensesItems]
    
    var body: some View {
        List {
            ForEach(expensesItems) { expensesItem in
                NavigationLink(value: expensesItem) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(expensesItem.name)
                                .font(.headline)
                            Text(expensesItem.type)
                        }
                        Spacer()
                        Text(expensesItem.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .foregroundStyle(.primary)
                    }
                    
                }
            }
            .onDelete(perform: deleteExpenses)
        }
    }
    
    
    init(sort: SortDescriptor<ExpensesItems>, searchString: String, typeString: String) {
        _expensesItems = Query(filter: #Predicate {
            if typeString == "Business" {
                return $0.type.contains("Business")
            } else if typeString == "Personal" {
                return $0.type.contains("Personal")
            } else {
                return true
            }
        }, sort: [sort])
    }
    
    func deleteExpenses(_ indexSet: IndexSet) {
        for index in indexSet {
            let expensesItem = expensesItems[index]
            modelContext.delete(expensesItem)
        }
    }
}

#Preview {
    ItemsView(sort: SortDescriptor(\ExpensesItems.type), searchString: "", typeString: "")
}
