//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Aleksandra Maksimowska on 08/09/2024.
//

import SwiftUI

struct ContentView: View {
//    @State private var showingAlert = false
    @State private var showingScore = false
    @State private var scoreTitle = ""
    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()

    var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
       
        ZStack{
            Color.blue
                .ignoresSafeArea()
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundStyle(.white)
                    Text(countries[correctAnswer])
                        .foregroundStyle(.white)
                }
                
                ForEach(0..<3) { number in
                    Button {
                        flagTapped(number)
                    } label: {
                        Image(countries[number])
                    }
                }
            }
            .alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue"){
                    askQuestion()
                }
            } message: {
                Text("Your score is ???")
            }
        }
//        VStack {
//            Button("Show Alert") {
//                        showingAlert = true
//                    }
//                    .alert("Important message", isPresented: $showingAlert) {
//                        Button("OK") { }
//                    }
//            
//            Button("Button 1") { }
//                .buttonStyle(.bordered)
//                .tint(.mint)
//            Button("Button 2", role: .destructive) { }
//                .buttonStyle(.bordered)
//            Button("Button 3") { }
//                .buttonStyle(.borderedProminent)
//            Button("Button 4", role: .destructive) { }
//                .buttonStyle(.borderedProminent)
//            Button {
//                print("Button was tapped")
//            } label: {
//                Text("Tap me!")
//                    .padding()
//                    .foregroundStyle(.white)
//                    .background(.indigo)
//            }
//            Button {
//                print("Edit button was tapped")
//            } label: {
//                Image(systemName: "pencil")
//            }
//            Button("Edit", systemImage: "pencil") {
//                print("Edit button was tapped")
//            }
//        }
        
        
//        ZStack {
//            VStack(spacing: 0) {
//                Color.red
//                Color.blue
//            }
//
//            Text("Your content")
//                .foregroundStyle(.secondary)
//                .padding(50)
//            //    .background(.ultraThinMaterial)
//                .background(.red.gradient)
//        }
//        .ignoresSafeArea()

        //            HStack{
        //                Text("X")
        //                Text("X")
        //                Text("X")
        //            }
        //            HStack{
        //                Text("X")
        //                Text("X")
        //                Text("X")
        //            }
        //            HStack{
        //                Text("X")
        //                Text("X")
        //                Text("X")
        //            }
        //        }
        //        ZStack{
        //            Color.indigo
        //                .frame(width: 200, height: 200)
        //            Text("Your content")
        //        }
        //  .background(.red)
        // .padding()
        //   }
    }
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }

        showingScore = true
    }
    mutating func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#Preview {
    ContentView()
}
