import Foundation

// Enumerations are a way to define a type that can only have a certain set of values
// Categorization of values

enum Animals {
    case cat,
    case dog,
    case bird,
    case fish
}

let cat = Animals.cat

if cat == Animals.cat {
    print("It's a cat")
} else if cat == Animals.dog {
    print("It's a dog")
// } else if cat == 3 {    //wouldn't work if we didn't make the custom function
//     print("It's something else")
} else {
    print("It's something else")
}

// func == (lhs: Animals, rhs: Int) -> Bool { // made "==" into a function lmao
//     lhs == .cat && rhs == 3
// }

print(cat.rawValue) // returns the raw value of the enum


// switch statements
// swtich statements are exhaustive and must cover all cases
// always compare enums using switch statements
switch cat {
case .cat:
    print("It's a cat")
    break
case .dog:
    print("It's a dog")
    break
case .bird:
    print("It's a bird")
    break
case .fish:
    print("It's a fish")
    break
default:  // usually not good practice to use default, you should cover all cases
    print("It's something else")
}

// Enums with associated values

enum Shortcut {
    case fileOrFolder(path: URL, name: String)
    case wwUrl(path: URL)
    case song(artist: String, title: String)
}

let wwwApple = Shortcut.wwUrl(path: URL(string: "https://www.apple.com")!)

switch wwwApple {
    case let .fileOrFolder(path, name):
        print("File or folder: \(name) at \(path)")
        break
    case let .wwUrl(path):
        print("URL: \(path)")
        break
    case let .song(artist, title):
        print("Song: \(title) by \(artist)")
        break
}

// handling only a specific enum case
if case let .wwwUrl(path) = wwwApple {
    print("URL: \(path)")
}

let withoutYou = Shortcut.song(
    artist: "Avicii",
    title: "Without You"
)

if case let .song(_, title) = withoutYou {
    print("Song: \(title)")
}

// Get associated values
// if you have pattern matching in your enums where two enum cases or more 
// are having the same pattern matching
enum Vehicle {
    case car(make: String, model: String)
    case bike(make: String, yearMade: Int)
    case truck(make: String, model: String)

    //computed property
    var manufacturer: String {
        switch self {
            case let .car(manufacturer, _),
            let .bike(manufacturer, _):
                return manufacturer
        }
    }
}

let car = Vehicle.car(make: "Toyota", model: "Corolla")
print(car.manufacturer)
let bike = Vehicle.bike(make: "Yamaha", yearMade: 2020)
print(bike.manufacturer)

//enum with raw values

enum FamilyMember: String { 
    case father = "Dad"
    case mother = "Mom"
    case brother = "Bro"
    case sister = "Sis"
}

FamilyMember.father.rawValue

enum FavoriteEmoji: String, CaseIterable {
    case happy = "😀"
    case sad = "😢"
    case love = "❤️"
    case angry = "😡"
}

print(FavoriteEmoji.allCases)
print(FavoriteEmoji.allCases.map(\.rawValue))

if let blush = FavoriteEmoji(rawValue: "😊") {
    print(blush)
} else {
    print("Emoji not found")
}

if let snow = FavoriteEmoji(rawValue: "❄️") {
    print(snow)
} else {
    print("Emoji not found")
}

// mutating functions

enum Height {
    case short, medium, long
    mutating func makeLong() {
        self = Height.long
    }
}

var myHeight = Height.medium
myHeight.makeLong()
print(myHeight)

// recursive enums

indirect enum IntOperation {
    case add(Int, Int)
    case subtract(Int, Int)
    case freeHand(IntOperation)

    func calculateResult(of operation: IntOperation? = nil) -> Int {
        switch operation ?? self {
            case let .add(a, b):
                return a + b
            case let .subtract(a, b):
                return a - b
            case let .freeHand(operation):
                return calculateResult(of: operation)
        }
    }
}

let freeHand = IntOperation.freeHand(.add(1, 2))
print(freeHand.calculateResult())