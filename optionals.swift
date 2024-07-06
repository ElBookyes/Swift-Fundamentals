import Foundation

// Indicate a value that might or might not be present
// nil is the absence of a value
// Optional is a type that can hold a value or nil
// Optional is an enum with two cases: .none and .some(value)
// Optionality continues until it can't continue any further
// where is like and

var name: String? = "John"

let age: Int? = nil

let age2: Int? = 0

func checkAge() {
    guard age != nil else {
        print("Age is not available")
        return
    }
    print("Age is \(age!)")
}

switch age {
    case .none:
        print("Age is not available")
        break
    case .some(value):
        print("Age is \(value)")
        break
}

if age2 == .some(0) {
    print("Age is 0")
} else {
    print("Age is not 0")
}

struct Person {
    let name: String
    let address: Adress?
    struct Adress {
        let firstLine: String?
    }
}

let foo: Person = Person(name: "Foo", address: nil)

if let fooFirstAdressLine = foo.address?.firstLine {
    print(fooFirstAdressLine)
} else {
    print("No address")
}


let baz: Person? = Person(
    name: "Baz",
    adress: Person.Adress(
        firstLine: "Baz first line"
    )
)

switch baz?.address?.firstLine {
    case let .some(firstLine) where
        firstLine.starts(with: "Baz"):
        print("Baz's first line is \(firstLine)")
    case let .some(firstLine):
        print("First line is \(firstLine)")
    case .none:
        print("No address")
}


func getFullName(firstName: String, lastName: String?) -> String? {
    if let lastName {
        return "\(firstName) \(lastName)"
    } else {
        return nil
    }
}
print(getFullName(firstName: "Foo", lastName: nil))
print(getFullName(firstName: "Foo", lastName: "Bar"))


func getFullName2(firstName: String, lastName: String?) -> String {
    return "\(firstName) \(lastName ?? "")"
}
print(getFullName2(firstName: "Foo", lastName: nil))


func getFullName3(firstName: String, lastName: String?) -> String? {
    guard let lastName else {
        return nil
    }
    return "\(firstName) \(lastName)"
}