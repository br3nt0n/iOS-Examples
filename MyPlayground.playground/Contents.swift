//: Playground - noun: a place where people can play

import UIKit


//MARK: Integers
//Int + Floating point converts to Double type
let double = 1 + 1.05
double.dynamicType
let unsignedInt = UInt32.max


//Type Aliases - alternative name for existing type. Use to rename types to be more relevant to situation
typealias AudioSample = UInt16
AudioSample.min


//Tuples - useful for temporary situations
let httpError = (420, "Gone")
let (statusCode, _) = httpError
statusCode

//Optionals
//Set to nil to put back into valueless state
var statusResponseCode:Int?
statusResponseCode = 404
statusResponseCode = nil

//Remainder Operator - how many multiples of b fit inside a, returns the value that is left over (remainder)
let remainder = 20 % 3

var a = 3
//Assigns then increments
let b = a++
//Increments then assigns
let c = ++a

//Value types - copied when passed around, not sent a reference. Also stored on the stack instead of heap.
//All basic Swift types - Int, floating point, booleans, strings, arrays, dictionaries are values.
//Structs and enums are also always values

//Ternary Conditional Operator - more concise but don't overuse
let question = false
if question {
    let answer1 = 0
} else {
    let answer2 = 1
} // can be shortened to

let answer3 = 10 + (question ? 5 : 10)


//Nil coalescing operator - unwraps an optional if it contains a value or returns a default value if empty
var ab:Int?
let ba = ab ?? 2



//Range operators
//Closed range operator - runs from a to b, INCLUDING a and b values. A must be > b
for index in 1...5 {
    index
}

//Half open range operator - runs from a to b, but doesn't include b. Useful for arrays, where count isn't 0 based but index is
for index in 1..<5{
    index
}

//Loop through characters in string
var dogText = "Dog!"
for character in dogText.characters {
    print(character)
}
let characterCount = dogText.characters.count
dogText.insertContentsOf(" there".characters, at: dogText.endIndex.predecessor())

//Print out ASCII and UTF representation
for codeUnit in dogText.utf16 {
    print("\(codeUnit)")
}

//Supports unicode
let dollarSign = "\u{1F496}"

//Arrays
//Store values of the same type in an ordered list - same value can appear in an array multiple times at different positions

var threeDoubles = [Double](count: 3, repeatedValue: 0.0)

for item in threeDoubles {
    item
}

for (index, value) in threeDoubles.enumerate() {
    index
    value
}

//Sets
//Store distinct values of the same type in a collection with no defined ordering - ensures item only appears once
var letters:Set<String> = ["Rock"]
letters.count
//Can perform intersect (new set with only common values from both sets), exclusiveOr (new set with values in either set, but not both), union (new set with all values from both sets), subtract (new set with values not in specified set)

//Dictionaries
//Store associations between keys and values of the same tye - key must be unique
var namesOfIntegers:[String: String] = ["test":"name"]

for name in namesOfIntegers.keys {
    name
}

var board = [Int](count: 26, repeatedValue: 0)
board[03] = 8
board[03]


//Range check again
var closedRange = 0...5
for item in closedRange {
    item
}

var halfOpenRange = 0..<5
for item in halfOpenRange {
    item
}

//External param name
func externalParam(externalName name:String){}
func externalParamWithNoParamNames(name:String, _ address:String){}
externalParam(externalName: "See?")
//Below is not best practice, but can be done if needed
externalParamWithNoParamNames("Name", "Address")

//Variadic parameters - accept zero or more values of a specified type. Makes available as array
func testParam(isString:Bool, results: String..., canReturn:Bool) {
    for string in results {
        string
    }
}
testParam(true, results: "Yes", "No", "Maybe", canReturn: true)


//Inout - modify parameters directly eg. value types
func anInOutFunction(inout number:Int){
    number = 8
}
var numberToChange = 1
anInOutFunction(&numberToChange)
numberToChange

//Reference function types - can use function types to reference other functions
//Can use to call a method eg. check if odd number, and using ternary operator to call matching function based on that
func one (text:String) -> String{return "Yes"}
func two (textTwo:String) -> String{return "No"}

var functionToUse : (String) -> String = one

//Nested functions - functions within functions
func function1(){
    func function2(){
        print("Hello world")
    }
}

//Default values
func defaultValueFunc(name:String = "Default"){
    name
}
defaultValueFunc()
defaultValueFunc("New name")


//Closures
let names = ["Chris", "Brenton", "Alex"]

//Type of s1 & s2 inferred as well as return value. $0 and $1 are the automoatic shorthand argument names, assigned by Swift
let sortedNames = names.sort({(s1, s2) in
    return s1 < s2
})
let sortedNamesShorter = names.sort({ $0 > $1 })
//And we can make it even shorter, using operator functions like the one provided by String
let sortedNamesShorterString = names.sort(>)


//Operator functions
func - (left:String, right:String) -> String{
    return "\(left) \(right)"
}


let numbers = [0,1,2,3,4,5]
let numberNames = [0:"Zero", 1:"One", 2:"Two"]

enum TestNumbers:String{
    case test, test1, test2, test3
}

TestNumbers.test1.rawValue


//Structs - have a default memberwise initializer. Should only ever store other value types - never any reference types. Also never inherit properties/behaviour from other types. Most custom data constructs should be classes, not structs. Should be properties of a class eg. the resolution of a TV screen, size of a geometric shape (width & height), point in a coordinate system
struct Resolution {
    var height:Int!
    var width:Int!
}
//Free member-wise initializer provided as it's a struct. Not provided for classes.
Resolution(height: 30, width: 40)

//Can implement protocols, but cannot inherit/become a subclass
protocol SampleStructProtocol {
    mutating func startInstall()
}

struct InstallationStart: SampleStructProtocol{
    var width:Int!
    
    mutating func startInstall() {
        width = width + 1
        print("Hello world")
    }
}

var demoStruct = InstallationStart(width: 1)
demoStruct.width
demoStruct.startInstall()
demoStruct.width


//: #Collections

/*:
# Swift 2.0
This section discusses the new Swift methods and functionality */

/*:
## Error handling
Swift 2 can now throw errors, that can be caught in a try/catch. Calling methods must use a try/catch to call this */
enum VendingMachineError:ErrorType {
    case InvalidSelection
    case OutOfStock
    case InsufficientFunds(coinsNeeded: Int)
}

func canThrowAnError() throws {
    print("Tried!")
    throw VendingMachineError.InsufficientFunds(coinsNeeded: 20)
}

extension Bird where Self: Flyable {
    // Flyable birds can fly!
    var canFly: Bool { return true }
}


//do {
//    try canThrowAnError()
//} catch VendingMachineError.InsufficientFunds(let coinsNeeded) {
//    print("ERROR \(coinsNeeded) coins needed")
//}

/*
### Optional Trys
Use an optional try to write concise error handling code when you want to handle all errors in the same way
*/

//func getStringMessage(shouldThrow:Bool) throws -> String {
//    if(shouldThrow){
//        throw VendingMachineError.OutOfStock
//    } else {
//        return "Message"
//    }
//}
//
//do {
//try? getStringMessage(true)
//}
//
//func getData() -> String? {
//    //Try getting data from disk, then from database
//    if let data = try? getStringMessage(true) {return data}
//    if let data = try? getStringMessage(false){return data}
//    return nil
//}

/*
### Defer statement
Code within a defer statement will always run, no matter the outcome of the try statement
*/

//func deferExample() {
//    defer {
//        print("Defer statement run")
//    }
//    
//    do {
//        try getStringMessage(false)
//    } catch {
//        error
//    }
//}
//deferExample()

/*
## Protocols
*/
protocol SampleProtocol {
    var shouldDefineMe:Int { get set }
}

struct Protocol:SampleProtocol {
    var shouldDefine
}


//Guard statement
let y:Int? = nil
func checkGuard(){
    guard let x = y else {
        print("Not found")
        return //break, throw, continue
    }
    x
}
checkGuard()

//API availability checks
//* is required, specifies any other platform the body of the if executes on the minimum deployment target specified by your target
if #available(iOS 9, OSX 10.10, *){
    //Use the new API
} else {
    //Use the old API
}

//Assertions - only use in cases where condition MUST be true - use alternatives where possible
//assert(httpError.0 < 400, "The error cannot be lower than 400")

//Generics
//func genericFunction (name:<T>){
//
//}


