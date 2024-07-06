import Foundation

struct Person: Equatable {
    let id: String
    let name: String
}

extension Person {
    static func == (
        lhs: Person,
        rhs: Person
    ) -> Bool {
        return lhs.id == rhs.id
    }
}

let foo1 = Person(id: "1", name: "Foo")
let foo2 = Person(id: "1", name: "Bar")

if foo1 == foo2 {
    print("They are the same")
} else {
    print("They are different")
}

