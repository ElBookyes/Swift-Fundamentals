import Foundation

extension Int {    // add a method to the Int type
    func plusTwo() -> Int {
        self + 2   // self refferes to the current instance, in this case, the number 2
    }
}
let two = 2
print(two.plusTwo())

// Add initializers to existing types

extension String {
    init(int: Int) {
        self = "\(int)"
    }
}

// Have both the default and custom initializers

struct Person {
    let firstName: String
    let lastName: String
}

extension Person {
    init(fullName: String) {
        let components = fullName.components(separatedBy: " ")
        self.init(
            firstName: components.first ?? fullName, 
            lastName: components.last ?? fullName
        )
    }
}