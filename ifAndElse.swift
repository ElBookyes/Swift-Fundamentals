import Foundation

func noArgumentsAndNoReturnValue() {
    print("This function has no arguments and no return value")
}

func plusTwo(number: Int) -> Int {
    return number + 2
}

plusTwo(number: 5)

func plusTwo(number: Int, anotherNumber: Int) -> Int {
    return number + anotherNumber
}

let assignToVariable = plusTwo(number: 5, anotherNumber: 10)

@discardableResult
func customMinus(_ lhs: Int, _ rhs: Int) -> Int {
    return lhs - rhs
}

let customSubtraction = customMinus(10, 5)


func getFullName(firstName: String = "Foo", lastName: String = "Bar") -> String {
    return "\(firstName) \(lastName)"
}

print(getFullName())
print(getFullName(firstName: "Baz"))