//
//  ContentView.swift
//  WeSplit
//
//  Created by Jingjing Mao on 5/31/24.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    @State private var name = ""
    @State private var selectedStudent = "jingjing"
    @State private var checkAmount = 0.0
    @State private var numOfPeople = 1
    @State private var tipPercentage = 20
    let tipPercentages = [10, 15, 20, 25, 0]
    

    let students: Array<String> = ["jingjing", "albert", "steven"]
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
                    TextField("Tip percentage", value: $tipPercentage, format: .number)
                }
                
                Section {
                      Text(checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                  }
            }
            .navigationTitle("WeSplit")
        }
    }
}

#Preview {
    ContentView()
}
