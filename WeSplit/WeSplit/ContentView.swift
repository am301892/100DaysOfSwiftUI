//
//  ContentView.swift
//  WeSplit
//
//  Created by Aleksandra Maksimowska on 03/09/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var name = ""
    
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        //        NavigationStack{
        //            Form {
        //                Section {
        //                    Text("Hello, world!")
        //                }
        //
        //                Section {
        //                    Text("Hello, world!")
        //                }
        //            }
        //            .navigationTitle("SwiftUI")
        //            .navigationBarTitleDisplayMode(.inline)
        //        }
        Form{
            TextField("Enter your name", text: $name)
            Text("Your name is \(name)")
        }
        
        NavigationStack {
            Form {
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
            }
            
            //        Form {
            //            ForEach(0..<100) {
            //                Text("Row \($0)")
            //            }
            //        }
        }
    }
}
#Preview {
    ContentView()
}
