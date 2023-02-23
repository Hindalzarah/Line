//
//  AddExpence.swift
//  TableOrder
//
//  Created by AtheerAlshehri on 20/02/2023.
//

import SwiftUI
import Firebase

struct AddExpence: View {
    
    @EnvironmentObject private var expenses:ExpenseData
    @Environment(\.dismiss) var dismiss
    @State private var orderNum = ""
    @State private var phoneNum = ""
    @State private var status: Status = .Ready
    
    var body: some View {
        NavigationStack{
            Form{
                TextField("Order Number", text: $orderNum)
                TextField("IPhone Number", text: $phoneNum)
                    .keyboardType(.numberPad)
                Picker ("Choose status order",
                        selection: $status){
                    ForEach(Status.allCases) {
                        expense in
                        Text(expense.localizedName)
                            .tag(expense)
                    }
                }
                        .pickerStyle(.menu)
            }
            .navigationTitle ("Add Information")
            Button(action: {
                let expense = Expenses (orderN: Int(orderNum) ?? 0, phoneN: Int(phoneNum) ?? 0, Status: status)
                    expenses.exampleData.append (expense)
                dismiss()
//                self.addinfo(orderN: self.orderNum, phoneN: self.phoneNum, status: self.status )
                
            }, label:{
                Label("Save Expense", systemImage: "externaldrive")
                    .frame (maxWidth: .infinity)
            })
            .buttonStyle (.borderedProminent)
        }
    }
    
    
//    func addinfo(orderN:Int , phoneN:Int , status:Bool){
//        let db = Firestore.firestore()
//        db.collection("Orders").document().setData(["OrderNumber":orderN, "PhoneNumber" : phoneN , "Status" : status])
//    }
}


struct AddExpence_Previews: PreviewProvider {
    
    //@State static var expenses = ExpenseData.exampleData
    
    static var previews: some View {
            AddExpence()
            .environmentObject(ExpenseData())
    }
}
