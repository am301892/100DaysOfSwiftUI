//
//  ContentView.swift
//  BetterSleep
//
//  Created by Aleksandra Maksimowska
//
import CoreML
import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 0.8
    @State private var wakeUp = Date.now
    @State private var coffeeAmount = 1
    
    var body: some View {
        VStack {
            Text("When do you want to wake up?")
                .font(.headline)
           // Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
            
            DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                .labelsHidden()
            
            Text("Desired amount of sleep")
                .font(.headline)
            
            Stepper("\(sleepAmount.formatted())", value: $sleepAmount, in: 4...12, step: 0.25)
            
            Text("Daily coffee intake")
                .font(.headline)
            
            Stepper("\(coffeeAmount) cup(s)", value: $coffeeAmount, in: 1...20)
            // Text(Date.now, format: .dateTime.hour().minute())
          //  Text(Date.now.formatted(date: .long, time: .shortened))
        }
        .padding()
        .navigationTitle("BetterRest")
        .toolbar{
            Button("Calculate", action: calculateBedtime)
        }
        
    }
    func calculateBedtime() {
        
    }
    func exampleDates() {
//        var components = DateComponents()
//        components.hour = 8
//        components.minute = 0
//        let date = Calendar.current.date(from: components) ?? .now
        var components = Calendar.current.dateComponents([.hour, .minute], from: .now)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0

    }
}

#Preview {
    ContentView()
}
