//
//  ContentView.swift
//  WordScramble
//
//  Created by Aleksandra Maksimowska 
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    @State private var score = 0
    
    var body: some View {
        NavigationStack {
            List{
                Text("Your score is \(score)")
                Text(rootWord)
                Section{
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                
                Section{
                    ForEach(usedWords, id: \.self){
                        word in HStack{
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
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
//            List {
//                Section("Section 1") {
//                    Text("Static row 1")
//                    Text("Static row 2")
//                }
//
//                Section("Section 2") {
//                    ForEach(0..<5) {
//                        Text("Dynamic row \($0)")
//                    }
//                }
//
//                Section("Section 3") {
//                    Text("Static row 3")
//                    Text("Static row 4")
//                }
//            }
//            .listStyle(.grouped)
//            
//            List(0..<5){
//                Text("Dynamic text \($0)")
//            
//            }
            
        }
        .navigationTitle(rootWord)
        //We want to call addNewWord() when the user presses return on the keyboard
        //onSubmit() needs to be given a function that accepts no parameters and returns nothing
        .onSubmit(addNewWord)
        .onAppear(perform: startGame)
        .alert(errorTitle, isPresented: $showingError){
            Button("OK"){}
        }message: {
            Text(errorMessage)
        }
        .toolbar{
            ToolbarItem(placement: .bottomBar){
                Button("Start Over"){ startGame()}
            }
        }
    }
    func addNewWord(){
        //Lowercase newWord and remove any whitespace
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        //Check that it has at least 1 character otherwise exit
        guard answer.count > 0 else {return}
        //Insert that word at position 0 in the usedWords array and Set newWord back to be an empty string
        guard isTooShort(word: answer) else{
            wordError(title: "Word is too short or is the same as the original one", message: "Try again")
            return
        }
        guard isOriginal(word: answer) else{
            wordError(title: "Word used already", message: "Be more original")
            return
        }
        
        guard isPossible(word: answer) else{
            wordError(title: "Word not possible", message: "You cant spell that word from \(rootWord)")
            return
        }
        
        guard isReal(word: answer) else{
            wordError(title: "Word not recognized", message: "you cant just make them up, you know!")
            return
        }
        withAnimation{
            usedWords.insert(answer, at: 0)
        }
        newWord = ""
        
        score += answer.count
    }

    func startGame(){
        score = 0
        usedWords = [String]()
        newWord = ""
        //Find start.txt in our bundle
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt"){
            //Load it into a string
            if let startWords = try? String(contentsOf: startWordsURL){
                // Split that string into array of strings, with each element being one word
                let allWords = startWords.components(separatedBy: "\n")
                // Pick one random word from there to be assigned to rootWord, or use a sensible default if the array is empty.
                rootWord = allWords.randomElement() ?? "silkworm"
                return
            }
        }
        fatalError("Could not load start.txt from bundle")
    }
    
    
    func isOriginal(word: String) -> Bool{
        !usedWords.contains(word)
    }
    //Disallow answers that are shorter than three letters or are just our start word
    func isTooShort(word: String) -> Bool{
        if word.count < 3 || word == rootWord{
            return false
        }else{
            return true
        }
    }
    func isPossible(word: String) -> Bool{
        var tempWord = rootWord
        
        for letter in word{
            if let pos = tempWord.firstIndex(of: letter){
                tempWord.remove(at: pos)
            }else{
                return false
            }
        }
        return true
    }
    
    func isReal(word: String) -> Bool{
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String){
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}

#Preview {
    ContentView()
}
