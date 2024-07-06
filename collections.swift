import Foundation

let numbers = [1, 2, 3, 4, 5]
numbers.forEach { print($0) }
print(numbers.first ?? "No first element")
print(numbers.last ?? "No last element")
print(numbers.count)
print(numbers.map { -$0 })

var mutatingNumbers = [1, 2, 3, 4, 5]
mutatingNumbers.sort()
print(mutatingNumbers)

mutatingNumbers.reverse()
print(mutatingNumbers)

// mutatingNumbers.shuffle()  error: value of type '[Int]' has no member 'shuffle'
// print(mutatingNumbers)

mutatingNumbers.removeAll()
print(mutatingNumbers)

mutatingNumbers.append(1)
mutatingNumbers.insert(2, at: 0)
mutatingNumbers.insert(contentsOf: [3, 4, 5], at: 1)

for value in numbers {
    print(value)
}

for value in numbers where value % 2 == 0 {
    print(value)
}

let doubledNumbers = numbers.map { $0 * 2 }
print(doubledNumbers)

let stringDoubledNumbers = numbers.map { String($0 * 2) }
print(stringDoubledNumbers)

let filteredNumbers = numbers.filter { $0 >= 3 }
print(filteredNumbers)

let compactMappedNumbers = numbers.compactMap { (value: Int) -> String? in // compactMap can change the data types
    return value % 2 == 0 
    ? String(value) 
    : nil
}
print(compactMappedNumbers)

let numbers2: [Int?] = [1, 2, nil, 4, 5]
print(numbers2.count)
let notNils = numbers2.compactMap { $0 } // filter cannot change the data types
print(notNils)

// different data types in the array
let mixedArray: [Any] = [1, "2", 3, "4", 5]

// Sets - unordered, unique elements / hash values and equality
let uniqueNumbers = Set([1, 2, 3, 4, 5, 5, 5, 5, 5])
print(uniqueNumbers.count)
print(uniqueNumbers.map{ -$0})

// CompactMap - if values are nil, they are removed
let myNumbers: [Int?] = [1, 2, 3, 4, 5, nil, nil, nil, nil]
let notNilNumbers = myNumbers.compactMap { $0 }
print(notNilNumbers)

// different data types in the set
let stuff3: Set<AnyHashable> = [1, "2", 3, "4", 5]
print(stuff3.count)

// return only integers from non-homonomous array
let intsMixedArray1 = mixedArray.compactMap { (value: Any) -> Int? in
    return value as? Int
}

// return only strings from non-homonomous array
let intsMixedArray2 = mixedArray.compactMap { (value: Any) -> String? in
    return value as? String
}

// CompactMapping on a Set does not return a Set, it returns an Array
let intsInStuff3 = stuff3.compactMap { (value: AnyHashable) -> Int? in
    return value as? Int
}
type(of: intsInStuff3)

// Hashable

struct Person: Hashable {
    let id: UUID
    let name: String
    let age: Int
}

let fooId = UUID()
let foo = Person(
    id: fooId, // hashValue = 1
    name: "Foo", // hashValue = 10
    age: 20 // hashValue = 20
) 
let bar = Person(
    id: UUID(), // hashValue = 1
    name: "Bar", // hashValue = 30
    age: 30 // hashValue = 40
)
let people: Set<Person> = [foo, bar]
print(people.count)

// Customize Hashing

// struct Person2: Hashable {
//     let id: UUID
//     let name: String
//     let age: Int

//     // Change the way hashing works
//     func hash(into hasher: inout Hasher) { 
//         hasher.combine(id)
//     }

//     // Change the way equality works
//     static func == ( 
//         lhs: Person2,
//         rhs: Person2
//     ) -> Bool {
//         lhs.id == rhs.id
//     }
// }

// let bazId = UUID()
// let baz = Person2(
//     id: bazId, 
//     name: "Baz", 
//     age: 40 
// )
// let qux = Person2(
//     id: UUID(), 
//     name: "Qux", 
//     age: 50 
// )
// let people2 =  Set([baz, qux])
// people2.count // Qux was considered to be the same object as Baz and was not added to the set


// Dictionaries
let userInfo: [String: Any] = [
    "name": "John",
    "age": 30,
    "isMarried": false,
    "address": [
        "street": "123 Fake St",
        "city": "Springfield",
        "state": "IL"
    ]
]

print(userInfo["name"] ?? "No name")
print(userInfo["age"] ?? "No age")
print(userInfo["isMarried"] ?? "No marriage status")

print(userInfo.keys)
print(userInfo.values)

for (key, value) in userInfo {
    print("\(key): \(value)")
}

for (key, value) in userInfo where key == "name" {
    print("\(key): \(value)")
}

for (key, value) in userInfo where value is String {
    print("\(key): \(value)")
}

for (key, value) in userInfo where value is Int && key.count > 2 {
    print("\(key): \(value)")
}