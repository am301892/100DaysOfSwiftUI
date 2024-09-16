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
    @State private var score = 0
    @State private var flagsTapped = 0
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()

    @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
       
        ZStack{
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("GUESS THE FLAG")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.white)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .foregroundStyle(.white)
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            Image(countries[number])
                                .clipShape(.capsule)
                                .shadow(radius: 5)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(.regularMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                }
                .alert(scoreTitle, isPresented: $showingScore) {
                    if flagsTapped == 8{
                        Button("Play again", action: resetGame)
                    } else{
                        Button("Continue", action: askQuestion)
                    }
                } message: {
                    if flagsTapped == 8 {
                        Text("Your final score is \(score)")
                    }else{
                        Text("Your score is \(score)")
                    }
                }
                Spacer()
                Spacer()
                Text("Score: \(score)")
                    .foregroundStyle(.white)
                    .font(.title.bold())
            }
            .padding()
            Spacer()
            
        }
    }
    func resetGame(){
        score = 0
        flagsTapped = 0
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    
    }
    func flagTapped(_ number: Int) {
        flagsTapped += 1
        if flagsTapped == 8{
            scoreTitle = "Game over!"
            score = 0
        }
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number])"
            score -= 1
        }

        showingScore = true
    }
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    
}

#Preview {
    ContentView()
}
