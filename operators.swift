import Foundation

let myAge = 22
let yourAge = 20

if myAge > yourAge {
    print("I'm older")
} else if myAge < yourAge {
    print("You're older")
} else {
    print("We're the same age")
}


// 1. unary prefix (unary - working with one value)
let foo = !true
// 2. unary postfix (unary - working with one value)
let name = Optional("Taylor") // Can be nil
type(of: name) // Optional<String>
let unaryPostFix = name!
type(of: unaryPostFix) // String
// 3. binary infix (binary - working with two values)
let result = 5 + 5


let age = 22
let message: String
if age >= 18 {
    message = "You are an adult"
} else {
    message = "You are not yet an adult"
}
let message2 = age >= 18 ? "You are an adult" : "You are not yet an adult"

print(message, message2)