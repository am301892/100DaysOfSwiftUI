//
//  ContentView.swift
//  WeSplit
//
//  Created by Aleksandra Maksimowska on 03/09/2024.
//

import SwiftUI

struct ContentView: View {
//    @State private var name = ""
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [10, 15, 20, 25, 0]
//    let students = ["Harry", "Hermione", "Ron"]
//    @State private var selectedStudent = "Harry"
    var totalPerPerson: Double{
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
    NavigationStack{
        Form{
            Section{
                TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
                    .focused($amountIsFocused) //when the text field is focused amountIsFocused is true, otherwise it’s false
                Picker("Number of people", selection: $numberOfPeople){
                    ForEach(2..<100){
                        Text("\($0) people")
                    }
                }
            }
            
            Section("How much tip do you want to leave?"){
                Picker("tip percentage", selection: $tipPercentage){
                    ForEach(tipPercentages, id: \.self){
                        Text($0, format: .percent)
                    }
                }
                .pickerStyle(.segmented)
            }
            Section{
                Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
            }
            .navigationTitle("WeSplit")
            .toolbar{
                if amountIsFocused{
                    Button("Done"){
                        amountIsFocused = false
                    }
                }
            }
        }
        //        NavigationStack{
        //            Form {
        //                Section {
        //                    Text("Hello, world!")
        //                }
        //
        //                Section {
        //                    Text("Hello, world!")
        //                }
        //            }
        //            .navigationTitle("SwiftUI")
        //            .navigationBarTitleDisplayMode(.inline)
        //        }
//        Form{
//            TextField("Enter your name", text: $name)
//            Text("Your name is \(name)")
//        }
//        
//        NavigationStack {
//            Form {
//                Picker("Select your student", selection: $selectedStudent) {
//                    ForEach(students, id: \.self) {
//                        Text($0)
//                    }
//                }
//            }
            
            //        Form {
            //            ForEach(0..<100) {
            //                Text("Row \($0)")
            //            }
            //        }
//        }
    }
}
    
}
#Preview {
    ContentView()
}
