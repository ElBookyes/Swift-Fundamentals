import Foundation

// Reference types, allow for mutability without having to prefix
// things with "mutating"

class Person {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }

    func increaseAge() {
        self.age += 1
    }
}

let foo = Person(name: "Foo", age: 20)
foo.increaseAge()

// refference type example
let bar = foo
bar.increaseAge()
print(foo.age)
print(bar.age)

if foo === bar { 
    print("foo and bar point to the same memory")
} else {
    print("foo and bar do not point to the same memory")
}

class Vehicle {
    func goVroom() {
        print("Vroom vroom!")
    }
}

class Car: Vehicle {

}

let car = Car()
print(car.goVroom())

// private properties

class Person2 {
    private(set) var age: Int
    init(age: Int) {
        self.age = age
    }
    func increaseAge(){
        self.age += 1
    }
}

// convenience initializers(waiter) & designated initializers(chef)

class Toyota { 
    let manufacturer = "Toyota"
    let model: String
    let year: Int

    init() {
        self.model = "Corolla"
        self.year = 2020
    }

    init(model: String, year: Int) {
        self.model = model
        self.year = year
    }

    convenience init(model: String){
        self.init(model: model, year: 2020)
    }
}

// Designated initializers in subclasses can only
// call to designated initializers in their superclass

// Convenience initializers can only call to other initializers in the same class (designated or convenience)

class ToyotaModelG: Toyota {
    override init() {
        super.init(model: "Model G", year: 2023)
    }
}

let toyotaG = ToyotaModelG()
print(toyotaG.manufacturer)
print(toyotaG.year)
print(toyotaG.model)

// Passing instances of classes to functions
let fooBar = Person2(age: 20)
func doSomething(with person: Person2) {
    person.increaseAge()
}
doSomething(with: fooBar)

// Deinitializers
// Deinitializers are called when an instance of a class is destroyed

class MyClass {
    init() {
        print("Class instance created")
    }
    func doSomething() {
        print("Doing something")
    }
    deinit {
        print("Class instance destroyed")
    }
}

let myClosure = {
    let myClass = MyClass()
    myClass.doSomething()
}
myClosure()