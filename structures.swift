import Foundation

struct Person { 
    let name: String
    let age: Int
}

let foo = Person(name: "Foo", age: 20)

let nameAndAge = foo.name + " is \(foo.age) years old"
foo.name
foo.age

// custom initializer / constructor

struct Dog {
    let name: String
    let breed: String
    let age: Int

    init(name: String, breed: String, age: Int) {
        self.name = name
        self.breed = breed
        self.age = age
    }
}

struct CommodoreComputer {
    let name: String
    let manufacturer: String // Way 1

    init(name: String) {
        self.name = name
        self.manufacturer = "Commodore" // Way 2
    }
}

let c64 = CommodoreComputer(name: "C64")
c64.name
c64.manufacturer


// Computed properties

struct Person2 {
    let firstName: String
    let lastName: String
    var fullName: String {  // Computer propety (variable with a function)
        return "\(firstName) \(lastName)"
    }
}

let fooBar = Person2(firstName: "Foo", lastName: "Bar")
print(fooBar.fullName)

//How to mutate a struct (usually you don't want to mutate a struct)

struct Car {
    let currentSpeed: Int

    mutating func drive(speed: Int) -> String {
        return "Driving at \(speed) km/h"
    }
}

let immutableCar = Car(currentSpeed: 10)
//immutableCar.drive(speed: 20) // Error: Cannot use mutating member on immutable value: 'immutableCar' is a 'let' constant

var mutableCar = Car(currentSpeed: 10)
mutableCar.drive(speed: 20) // Driving at 20 km/h
print(mutableCar.currentSpeed)


// If you ever need to create custom copies

struct Bike { 
    let manufacturer: String
    let currentSpeed: Int
    func copy(currentSpeed: Int) -> Bike { 
        return Bike(manufacturer: self.manufacturer, currentSpeed: currentSpeed)
    }
}

let bike1 = Bike(
    manufacturer: "HD",
    currentSpeed: 20
)

let bike2 = bike1.copy(currentSpeed: 30)
print(bike1.currentSpeed)
print(bike2.currentSpeed)