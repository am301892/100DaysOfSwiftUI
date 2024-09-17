//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Aleksandra Maksimowska on 17/09/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
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
