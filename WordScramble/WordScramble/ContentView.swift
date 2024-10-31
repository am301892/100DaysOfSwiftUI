//
//  ContentView.swift
//  WordScramble
//
//  Created by Aleksandra Maksimowska on 16/10/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            //bundle.main.url() -> optional
//            if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt")
            //String(contentsOf: ) -> it will send back a string containing the contents of that file if it can be loaded (else error)
//                if let fileContents = try? String(contentsOf: fileURL)
            
            //components(separatedBy:)
            //let input="a b c"
            //let letters = input.components(separatedBy: " ")
            //trimmingCharacters(in: )
            //CharacterSet type
            //let trimmed = letter?trimmingCharacters(in: .whitespacesAndNewLines)
            //UITextChecker class
            
            
            //let word = "swift"
            //let checker = UITextChecker()
            //let range = NSRange(location: 0, length: word.utf16.count)
            //NSRange specifies the start location as 0 and length as the UTF-16 count of word
            //let misspelledRange = checker.rangeOfMisspellWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
            
        //it returns NSNotFound as it has no optionals (Objective-c)
            //let allGood = misspelledRange.location ==NSNotFound
            List {
                Section("Section 1") {
                    Text("Static row 1")
                    Text("Static row 2")
                }

                Section("Section 2") {
                    ForEach(0..<5) {
                        Text("Dynamic row \($0)")
                    }
                }

                Section("Section 3") {
                    Text("Static row 3")
                    Text("Static row 4")
                }
            }
            .listStyle(.grouped)
            
            List(0..<5){
                Text("Dynamic text \($0)")
            
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
