//
//  ContentView.swift
//  BetterSleep
//
//  Created by Aleksandra Maksimowska
//
import CoreML
import SwiftUI

struct ContentView: View {
    static var defaultWakeUpTime: Date{
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    @State private var sleepAmount = 0.8
    @State private var wakeUp = defaultWakeUpTime
    @State private var coffeeAmount = 2
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    @State private var calculatedBedtime = "Loading..."
    var body: some View {
        NavigationStack{
            
            Form {
                VStack(alignment: .leading, spacing: 0){
                    Text("When do you want to wake up?")
                        .font(.headline)
                    // Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                    
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                VStack(alignment: .leading, spacing: 0){
                    Text("Desired amount of sleep")
                        .font(.headline)
                    
                    Stepper("\(sleepAmount.formatted())", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                VStack(alignment: .leading, spacing: 0){
                    Text("Daily coffee intake")
                        .font(.headline)
                    
                    Stepper("^[\(coffeeAmount) cup](inflect:true)", value: $coffeeAmount, in: 1...20)
                    
//                    Picker("Daily coffee intake: ", selection: $coffeeAmount){
//                        ForEach(1...20, id: \.self){ number in
//                            Text("\(number)")
//                        }
//                    }
                    // Text(Date.now, format: .dateTime.hour().minute())
                    //  Text(Date.now.formatted(date: .long, time: .shortened))
                }
                .scrollContentBackground(.hidden)
                
                VStack(alignment: .center, spacing: 10) {
                    Text("Your recommended bedtime is:")
                        .font(.headline)
                    Text(calculatedBedtime)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
            
            .padding()
            .navigationTitle("BetterRest")
//            .toolbar{
//                Button("Calculate", action: calculateBedtime)
//            }
//            .alert(alertTitle, isPresented: $showingAlert){
//                Button("OK") {}
//            } message: {
//                Text(alertMessage)
//            }
            .background(Color.white)
            .onChange(of: wakeUp) { _, _ in calculateBedtime() }
            .onChange(of: sleepAmount) { _, _ in calculateBedtime() }
            .onChange(of: coffeeAmount) {_,  _ in calculateBedtime() }
            .onAppear(perform: calculateBedtime)
        }

        
    }
    func calculateBedtime() {
        do{
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))
            let sleepTime = wakeUp - prediction.actualSleep
      //      alertTitle = "Your ideal bedtime is..."
      //      alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
        calculatedBedtime = sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            calculatedBedtime = "Error"
     //       alertTitle = "Error"
     //       alertMessage = "Sorry, there was a problem calculating your bedtime"
      }
    //    showingAlert = true
    }
    func exampleDates() {
//        var components = DateComponents()
//        components.hour = 8
//        components.minute = 0
//        let date = Calendar.current.date(from: components) ?? .now
        
//        var components = Calendar.current.dateComponents([.hour, .minute], from: .now)
//        let hour = components.hour ?? 0
//        let minute = components.minute ?? 0

    }
}

#Preview {
    ContentView()
}
