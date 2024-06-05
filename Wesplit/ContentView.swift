//
//  ContentView.swift
//  WeSplit
//
//  Created by Jingjing Mao on 5/31/24.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numOfPeople = 1
    @State private var tipPercentage = 20
    let tipPercentages = [10, 15, 20, 25, 0]
    
    //computed property
    var totalPerPerson: Double {
        let peopleCount = Double(numOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD")).keyboardType(.decimalPad)
                    Picker("Number of people", selection: $numOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }.pickerStyle(.navigationLink)
                }
                
                Section("How much tip do you want to leave?") {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id:\.self) {
                            Text($0, format:.percent)
                        }
                    }.pickerStyle(.segmented)
                }
                
                Section {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
        }
    }
    
    
    func getPayment() -> Double {
        print("checkamount \(checkAmount) tipPercentage \(tipPercentage) numOfPeople \(numOfPeople)")
        let percentage = Double(1 + Double(tipPercentage)/100.0)
        print(" percentage \(percentage)")
        print(" total check \(checkAmount * percentage)" )
        
        return (checkAmount * percentage) / Double(numOfPeople + 2)
    }
    
}

#Preview {
    ContentView()
}
