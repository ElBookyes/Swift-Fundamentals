import Foundation
// Like interfaces in Java
// Protocols are a way to define a blueprint of methods, properties,
// and other requirements that suit a particular task or piece of functionality.
// Set of rules that a class or struct must follow

protocol canBreathe { 
    func breathe()
}

struct Animal: canBreathe {
    func breathe() {
        print("Animal is breathing")
    }
}

protocol CanJump {
    func jump()
}

extension CanJump { // default implementation to a protocol
    func jump() {
        print("Jumping")
    }
}

struct Cat: CanJump {
    // gets the default implementation from the extension
}
let whiskers = Cat()
print(whiskers.jump())

// Define variables

protocol HasName {
    var name: String { get }
    var age: Int { get set }
    mutating func increaseAge()
}

extension HasName {
    func describeMe() -> Void {
        print("My name is \(name) and I am \(age) years old")
    }
    mutating func increaseAge(){
        self.age += 1
    }
}

struct Dog: HasName {
    let name: String
    var age: Int
}

var woof = Dog(
    name: "Woof",
    age: 3
)

woof.describeMe()
woof.increaseAge()
print(woof.age)


protocol Vehicle {
    var speed: Int { get set }
    mutating func increaseSpeed(by value: Int)
}

extension Vehicle {
    mutating func increaseSpeed(by value: Int) {
        self.speed += value
    }
}

struct Bike: Vehicle {
    var speed: Int = 0
}

var bike = Bike()
bike.increaseSpeed(by: 10)
print(bike.speed)

// check if a class conforms to a protocol
func checkIfVehicle(obj: Any) {
    if obj is Vehicle {
        print("Object conforms to Vehicle protocol")
    } else {
        print("Object does not conform to Vehicle protocol")
    }
}
print(checkIfVehicle(obj: bike))

// Promote object to type Vehicle

func increaseSpeedIfVehicle(obj: Any) {
    if var vehicle = obj as? Vehicle {
        vehicle.increaseSpeed(by: 10)
        print("Speed increased to \(vehicle.speed)")
    } else {
        print("Object does not conform to Vehicle protocol")
    }
}
print(increaseSpeedIfVehicle(obj: bike))