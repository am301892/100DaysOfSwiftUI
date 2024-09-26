//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Aleksandra Maksimowska

import SwiftUI

struct ContentView: View {
//    @State var shouldWin: Bool
//    @State var currentChoice: String
    var body: some View {
        VStack {
            Spacer()
            Text("Your score")
            Spacer()
            Text("Hello")
            Spacer()
            HStack{
                Button(action:{
                    print("The player tapped rock")
                }){
                    Text("Rock")
                        .background(Color.blue)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }
                
                Button(action:{
                    print("the player tapped paper")
                }){
                    Text("Paper")
                        .background(Color.blue)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .font(.title)
                }
                
                Button(action:{
                    print("The player tapped scissors")
                }){
                    Text("Scissors")
                        .background(Color.blue)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
