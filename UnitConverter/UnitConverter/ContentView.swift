//
//  ContentView.swift
//  UnitConverter
//
//  Created by Aleksandra Maksimowska on 05/09/2024.
//

import SwiftUI
//TO DO: 30 feet -> ... feet
struct ContentView: View {
    @State private var convertFrom: Double = 0.0
    @State private var inputUnit = "m"
    @State private var outputUnit = "m"
    @FocusState private var amountIsFocused: Bool
    let lengthUnits = ["m", "km", "feet", "yards", "miles"]
    
    var inputInMeters: Double{
        switch inputUnit{
        case "m":
            return convertFrom
        case "km":
            return convertFrom * 1000
        case "feet":
            return convertFrom * 0.3048
        case "yards":
            return convertFrom * 0.9144
        case "miles":
            return convertFrom * 1609.344
        default:
            return 0
        }
    }
    
    var outputValue: Double{
        if inputUnit == outputUnit {
                    return convertFrom
                }
        
        switch outputUnit{
        case "m":
            return inputInMeters
        case "km":
            return inputInMeters * 0.001
        case "feet":
            return inputInMeters * 3.28084
        case "yards":
            return inputInMeters * 1.09361
        case "miles":
            return inputInMeters * 0.000621371
        default:
            return 0
        }
    }
    var body: some View {
        VStack {
            Form{
                Section("Convert FROM: "){
                    TextField("Convert FROM: ", value: $convertFrom, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    Picker("Convert from:", selection: $inputUnit){
                        ForEach(lengthUnits, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                }
                
                Section("To:"){
                    Text(outputValue, format: .number)
                    
                    Picker("Convert to:", selection: $outputUnit){
                        ForEach(lengthUnits, id: \.self){
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                .toolbar{
                    if amountIsFocused{
                        Button("Done"){
                            amountIsFocused = false
                        }
                    }
                }
            }
           
        }
    }
}

#Preview {
    ContentView()
}
