//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Aleksandra Maksimowska

import SwiftUI

struct ContentView: View {
    let moves = ["rock","paper","scissors"]
    @State private var shouldWin = Bool.random()
    @State private var currentChoice = Int.random(in: 0...2)
    
    @State private var score = 0
    @State private var round = 1
    
    @State private var gameOver = false
    var body: some View {
        VStack {
            Spacer()
            Text("Your score: \(score)")
                .font(.largeTitle)
            Text("Round: \(round)")
                .font(.title)
            Spacer()
            Text("\(moves[currentChoice])")
                .font(.title)
            Text(shouldWin ? "You need to win" : "You need to lose")
                .font(.headline)
            Spacer()
            HStack{
                Button(action: {
                    self.playMove(playerChoice: "rock")
                        })
                {
                    Image("rock-icon")
                        .resizable()
                        .frame(width: 100, height: 100)
                }
                
                Button(action:{
                    self.playMove(playerChoice: "paper")
                }){
                    Image("paper-icon")
                        .resizable()
                        .frame(width: 100, height: 100)
                }
                
                Button(action:{
                    self.playMove(playerChoice: "scissors")
                }){
                    Image("scissors-icon")
                        .resizable()
                        .frame(width: 100, height: 100)
                }
            }
            Spacer()
        }
        .padding()
        .alert(isPresented: $gameOver , content: {
            Alert(title: Text("Game over"),
            message: Text("Your final score is \(score)"),
                  dismissButton: .default(Text("Restart"), action:{
                self.restartGame()
            }
                                         ))
        })
        
    }
    //handle the playes move
    func playMove(playerChoice: String){
        
        var playerWins: Bool
        
        //check if player wins
        if moves[currentChoice] == "rock" && playerChoice == "paper" ||
            moves[currentChoice] == "paper" && playerChoice == "scissors" ||
            moves[currentChoice] == "scissors" && playerChoice == "rock" {
            playerWins = true
        }else if moves[currentChoice]==playerChoice{
            playerWins = false
        }else{
            playerWins = false
        }
        //update score
        if(shouldWin && playerWins) || (!shouldWin && !playerWins){
            score += 1
        }else{
            score -= 1
        }
        
        //prepare for the next round
        currentChoice = Int.random(in: 0...2)
        shouldWin = Bool.random()
        round += 1
        
        //check round
        if(round>10){
            gameOver = true
        }
    }
    
    //restarting the game
    func restartGame(){
        score = 0
        round = 1
        currentChoice = Int.random(in: 0...2)
        shouldWin = Bool.random()
    }
    
}

#Preview {
    ContentView()
}
