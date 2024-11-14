//
//  ContentView.swift
//  Animations
//
//  Created by Aleksandra Maksimowska
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 0.0
    var body: some View {
//        print(animationAmount)

        Button("Tap me"){
          //  animationAmount += 1
            withAnimation(.spring(duration: 1, bounce: 0.5)){
                animationAmount += 360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
//       // .scaleEffect(animationAmount)
//       // .blur(radius: (animationAmount-1)*3)
//        .overlay(
//            Circle()
//                .stroke(.red)
//                .scaleEffect(animationAmount)
//                .opacity(2-animationAmount)
//                .animation(
//                    .easeOut(duration: 1)
//                        .repeatForever(autoreverses: false),
//                    value: animationAmount
//                )
//        )
//        .onAppear{
//            animationAmount = 2
//        }
//       // .animation(.spring(duration: 1, bounce: 0.4), value: animationAmount)
//        //1s wait before 2s animation
//        .animation(.easeInOut(duration: 2) .delay(1) .repeatCount(3, autoreverses: true)
//            //.repeatForever(autoreverses: true)
//                   , value: animationAmount)
//        
       //! when the animation finishes the button must have whatever value is set in animationAmount!when the animation finishes the button must have whatever value is set in animationAmount
 
 
//        return VStack {
//            Stepper("Scale amount", value: $animationAmount.animation(.easeInOut(duration: 1) .repeatCount(3,autoreverses: true)), in: 1...10)
//            Spacer()
//            Button("Tap me"){
//                animationAmount += 1
//                
//            }
//            .padding(40)
//            .background(.red)
//            .foregroundStyle(.white)
//            .clipShape(.circle)
//            .scaleEffect(animationAmount)
//        }
//        .padding()
    }
}

#Preview {
    ContentView()
}
