import Cocoa

//checkpoint1
let celciusConstant = 12.0
let fahrenheitConstant = celciusConstant * 9 / 5 + 32
print(celciusConstant, fahrenheitConstant)

var albums = [Int]()
albums.append(10)
albums.append(5)
albums.append(2)
print(albums)

let bondMovies = ["Casino Royale", "Spectre", "No Time To Die"]
print(bondMovies.contains("Frozen"))

let cities = ["London", "Tokyo", "Rome", "Budapest"]
print(cities.sorted())

let presidents = ["Bush", "Obama", "Trump", "Biden"]
let reversedPresidents = presidents.reversed()
print(reversedPresidents)

//checkpoint2
var myArray = ["one","one", "two","three", "four","five", "five"]
print(myArray.count)
var mySet = Set(myArray)
print(mySet.count)

print()
print()

//checkpoint3
for number in 1...100{
    if number%3==0 && number%5==0{
        print("FizzBuzz")
    }else if number%3==0{
        print("Fizz")
    }else if number%5==0{
        print("Buzz")
    }else{
        print(number)
    }
}

print()
print()

//checkpoint4
/*
 The challenge is this: write a function that accepts an integer from 1 through 10,000, and returns the integer square root of that number. That sounds easy, but there are some catches:

 You can’t use Swift’s built-in sqrt() function or similar – you need to find the square root yourself.
 If the number is less than 1 or greater than 10,000 you should throw an “out of bounds” error.
 You should only consider integer square roots – don’t worry about the square root of 3 being 1.732, for example.
 If you can’t find the square root, throw a “no root” error.
 */
enum SqrtError: Error{
    case outOfBounds, noRoot
}

func findTheSqrt(of number: Int) throws -> Int{
    //is the number within the range
    if number < 1 || number > 1000 {
        throw SqrtError.outOfBounds
    }
    
    //trying to find the square root
    for i in 1...number {
        if i*i == number {
            return i
        }
    }
    
    throw SqrtError.noRoot
}

do{
    let result = try findTheSqrt(of: 12)
    print("The square root is \(result)")
}catch SqrtError.noRoot{
    print("I cant find the square root.")
}catch SqrtError.outOfBounds{
    print("You provided wrong input")
}catch{
    print("An unknown error occured")
}
 
print()
print()
print()

//checkpoint5
/*
 input: let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
 Your job is to:

 Filter out any numbers that are even
 Sort the array in ascending order
 Map them to strings in the format “7 is a lucky number”
 Print the resulting array, one item per line
 */

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]
var newNumbers = luckyNumbers.filter {$0 % 2 == 1}
// or var newNumbers = luckyNumbers.filter { !$0.isMultiple(of: 2) }

newNumbers.sort()
//print(newNumbers)

var finalNumbers = newNumbers.map{ (number: Int) -> String in
    return "\(number) is a lucky number"
}

for num in finalNumbers{
    print(num)
}

//checkpoint6
/*
 create a struct to store information about a car, including its model, number of seats, and current gear, then add a method to change gears up or down. Have a think about variables and access control: what data should be a variable rather than a constant, and what data should be exposed publicly? Should the gear-changing method validate its input somehow?
 */
struct Car{
    let model: String
    let numberOfSeats: Int
    private(set) var currentGear: Int
    
    mutating func changeGearUp(){
        if currentGear + 1 > 10{
            print("we cant do that - you've reached the top gear already ")
        }else{
            currentGear += 1
        }
    }
    
    mutating func changeGearDown(){
        if currentGear - 1 < 1{
            print("we cant do that - you've reached the lowest gear already ")
        }else{
            currentGear -= 1
        }
    }
}


print()
print()

//checkpoint7
/*
  make a class hierarchy for animals, starting with Animal at the top, then Dog and Cat as subclasses, then Corgi and Poodle as subclasses of Dog, and Persian and Lion as subclasses of Cat.

 But there’s more:

 The Animal class should have a legs integer property that tracks how many legs the animal has.
 The Dog class should have a speak() method that prints a generic dog barking string, but each of the subclasses should print something slightly different.
 The Cat class should have a matching speak() method, again with each subclass printing something different.
 The Cat class should have an isTame Boolean property, provided using an initializer.
 */

class Animal{
    var legs: Int
    init(legs: Int = 4){
        self.legs = legs
    }
}

class Dog: Animal{
    func speak(breed: String = "dog"){
        print("Woof! I am a \(breed)!")
    }
}

class Cat: Animal{
    var isTame: Bool
    func speak(breed: String = "cat"){
        print("Meow! I am a \(breed)!")
    }
    init(isTame: Bool){
        self.isTame = isTame
        super.init()
    }
}

class Corgi: Dog{
    override func speak(breed: String = "corgi"){
        super.speak(breed: breed)
    }
}

class Poodle: Dog{
    override func speak(breed: String = "poodle"){
        super.speak(breed: breed)
    }
}

class Persian: Cat{
    override func speak(breed: String = "persian"){
        print("Meow! I am a \(breed)!")
    }
}

class Lion: Cat{
    override func speak(breed: String = "lion"){
        print("Meow! I am a \(breed)!")
    }
}


let dog1 = Dog()
dog1.speak()

let corgi = Corgi()
corgi.speak()

let poodle = Poodle()
poodle.speak()

let cat = Cat(isTame: true)
cat.speak()

let persian = Persian(isTame: true)
persian.speak()

let lion = Lion(isTame: false)
lion.speak()


print("Corgi has \(corgi.legs) legs")
print("Lion has \(lion.legs) legs")

print()
print()
print()

//checkpoint8

/*
 make a protocol that describes a building, adding various properties and methods, then create two structs, House and Office, that conform to it. Your protocol should require the following:

 A property storing how many rooms it has.
 A property storing the cost as an integer (e.g. 500,000 for a building costing $500,000.)
 A property storing the name of the estate agent responsible for selling the building.
 A method for printing the sales summary of the building, describing what it is along with its other properties.
 */

protocol Building{
    var numberOfRooms: Int {get set}
    var cost: Int {get set}
    var estateAgent: String {get set}
    
    func printSalesSummary()
}

struct House: Building{
    var numberOfRooms: Int
    var cost: Int
    var estateAgent: String
    
    func printSalesSummary() {
        print("House with \(numberOfRooms) rooms costs \(cost) and is being sold by \(estateAgent).")
    }
}

struct Office: Building{
    var numberOfRooms: Int
    var cost: Int
    var estateAgent: String
    
    func printSalesSummary() {
        print("Office with \(numberOfRooms) rooms costs \(cost) and is being sold by \(estateAgent).")
    }
}


print()
print()
print()

//checkpoint9 
/*
 write a function that accepts an optional array of integers, and returns one randomly. If the array is missing or empty, return a random number in the range 1 through 100.

 If that sounds easy, it’s because I haven’t explained the catch yet: I want you to write your function in a single line of code. No, that doesn’t mean you should just write lots of code then remove all the line breaks – you should be able to write this whole thing in one line of code.
 */

func changeArray(array: [Int]?) -> Int{
    return array?.randomElement() ?? Int.random(in: 1...100)
}

print(changeArray(array: nil))
print(changeArray(array: [10,11,20981]))

print()
print()
//Day 15
let team = ["Gloria", "Suzanne", "Tiffany", "Tasha"]
//
//let onlyT = team.filter({ (name: String) -> Bool in
//    name.hasPrefix("T")
//})

let onlyT = team.filter{ name in
    name.hasPrefix("T")
}

/*
 let onlyT = team.filter {
    $0.hasPrefix("T")
} 
 */

print(onlyT)
