import Foundation

struct Person {
    let firstName: String?
    let lastName: String?

    enum Errors: Error {
        case firstNameIsNil
        case lastNameIsNil
        case bothNamesAreNil
    }

    func getFullName() throws -> String {
        switch(firstName, lastName) {
            case(.none, .none):
                throw Errors.bothNamesAreNil
            case(.none, .some):
                throw Errors.firstNameIsNil
            case(.some, .none):
                throw Errors.lastNameIsNil
            case(.some(let firstName), .some(let lastName)):
                return "\(firstName) \(lastName)"
        }
    }
}

let foo = Person(firstName: "Foo", lastName: nil)

do {
    let fullName = try foo.getFullName()
} catch {
    print(error)
}

do {
    let fullName = try foo.getFullName()
} catch is Person.Errors {   // catch only Person.Errors (catch error types)
    print("Got an error")
}

// Catching specific errors
do {
    let fullName = try foo.getFullName()
} catch Person.Errors.firstNameIsNil {
    print("First name is nil")
} catch Person.Errors.lastNameIsNil {
    print("Last name is nil")
} catch Person.Errors.bothNamesAreNil {
    print("Both names are nil")
} catch {
    print("Some other error")
}

struct Car {
    let manufacturer: String

    enum Errors: Error {
        case invalidManufacturer
    }

    init(
        manufacturer: String
    ) throws {
        if manufacturer.isEmpty {
            throw Errors.invalidManufacturer
        }
        self.manufacturer = manufacturer
    }
}

do {
    let myCar = try Car(manufacturer: "")
} catch Car.Errors.invalidManufacturer {
    print("Invalid manufacturer")
} catch {
    print("Some other error")
}  

// If u don't actually care about the errors

if let yourCar = try? Car(manufacturer: "Toyota") {
    print("Car created")
} else {
    print("Car not created")
}

// funcs

struct Dog {
    let isInjured: Bool
    let isSleeping: Bool

    enum BarkingErrors: Error {
        case cannotBarkIsSleeping
    }

    enum RunningErrors: Error {
        case cannotRunIsInjured
    }

    func bark() throws {
        if isSleeping{
            throw BarkingErrors.cannotBarkIsSleeping
        }
        print("Woof")
    }

    func run() throws {
        if isInjured {
            throw BarkingErrors.cannotRunIsInjured
        }
        print("Running")
    }
}

// if you are inside a function marked with throws, you don't need to use do and catch
func barkAndRun() throws {
    try bark()
    try run()
}

do {
    try dog.barkAndRun()
} catch Dog.BarkingErrors.cannotBarkIsSleeping,  // Swift catches 1 error at a time / Never do this
        Dog.RunningErrors.cannotRunIsInjured {
            print("Cannot-bark-is-sleeping OR cannot-run-is-injured")
} catch {
    print("Some other error")
}

// Rethrows
// A function which internally calls another function which can also throw
// Rethrows tells swift that the parent function doesn't throw errors on its own, 
// but it can throw errors if the child function throws errors
// basically rethrow the already existing throw

func fullName(
    firstName: String?, 
    lastName: String?,
    calculator: (String?, String?) throws -> String?
) rethrows -> String? {
    try calculator(firstName, lastName)
}

enum NameErrors: Error {
    case firstNameIsInvalid
    case lastNameIsInvalid
}

func + (firstName: String?, lastName: String?) throws -> String { // Doesn't need to be optional, because the errors are handled
    guard let firstName, !firstName.isEmpty else {                // Promotion in Swift works, but demotion doesn't
        throw NameErrors.firstNameIsInvalid
    }
    guard let lastName, !lastName.isEmpty else {
        throw NameErrors.firstNameIsInvalid
    }
    return "\(firstName) \(lastName)"
}

// How to read guard statements: MAKE SURE FIRSTNAME IS AVAILABLE, MAKE SURE FIRSTNAME IS NOT EMPTY 
//OTHERWISE THROW ERROR

do {
    let fooBar = try fullName(firstName: "Foo", lastName: "Bar", calculator: +)
} catch NameErrors.firstNameIsInvalid {
    print("First name is invalid")
} catch NameErrors.lastNameIsInvalid {
    print("Last name is invalid")
} catch let err {
    print("Some other error: \(err)")
}


// Results

enum IntegerErrors: Error {
    case noPositiveIntegerBefore(thisValue: Int)
}

func getPreviousPositiveInteger(
    from int: Int
) -> Result<Int, IntegerErrors> {
    guard int > 0 else {
        return Result.failure(IntegerErrors.noPositiveIntegerBefore(thisValue: int))
    }
    return Result.success(int - 1)
}

func performGet(forValue value: Int) {
    switch getPreviousPositiveInteger(from: value){
        case let .success(previousValue):
            print("Previous value is \(previousValue)")
        case let .failure(error):
            switch error {
                case let .noPositiveIntegerBefore(let thisValue):
                    print("No positive integer before \(thisValue)")
            }
    }
}