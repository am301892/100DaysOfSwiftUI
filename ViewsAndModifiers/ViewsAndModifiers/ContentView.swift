//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Aleksandra Maksimowska on 17/09/2024.
//

import SwiftUI
//challenge 3
struct TitleModifier: ViewModifier{
    func body(content: Content) -> some View{
        content
            .font(.largeTitle)
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
    }
}

extension View{
    func titleStyleChallenge() -> some View{
        self.modifier(TitleModifier())
    }
}

//custom modifiers
struct Title: ViewModifier{
    func body(content: Content) -> some View{
        content
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding().background(.yellow)
            .clipShape(.rect(cornerRadius: 10))
    }
}

extension View{
    func titleStyle() -> some View{
        modifier(Title())
    }
}
struct ContentView: View {
    let motto1 = Text("Draco dormiens")
    let motto2 = Text("nunquam titillandus")
    
    struct CapsuleText: View {
        var text: String
        
        var body: some View {
                Text(text)
                    .font(.largeTitle)
                    .padding()
                    .foregroundStyle(.white)
                    .background(.blue)
                    .clipShape(.capsule)
            }
        
    }
    
    var body: some View {
        //custom modifier in action
        Text("hello world")
 //           .modifier(Title())
            .titleStyle() //we can do this because of the extension
        VStack(spacing: 10) {
                    CapsuleText(text: "First")
                    CapsuleText(text: "Second")
                }
        
        VStack {
                    motto1
                .titleStyleChallenge()
                    motto2
                }
        VStack {
            Text("Hello, world!")
                .padding()
                    .background(.red)
                    .padding()
                    .background(.blue)
                    .padding()
                    .background(.green)
                    .padding()
                    .background(.yellow)
            Button("Hello, world!") {
                print(type(of: self.body))
            }
            
            .frame(width: 200, height: 200)
            .background(.red)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ContentView()
}
