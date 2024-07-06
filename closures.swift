import Foundation

let add: (Int, Int) -> Int 
  = { (a: Int, b: Int) -> Int in
        return a + b
    }
print(add(1, 2));

func customAdd(
    _ a: Int, 
    _ b: Int, 
    using function: (Int, Int) -> Int
) -> Int {
    return function(a, b)
}

customAdd(
    1, 
    2
) {(a: Int, b: Int) -> Int in
    return a + b
}

customAdd(
    1, 
    2,
    using: add
)

customAdd(1, 2) { $0 + $1 }

// special closures

let ages = [30, 20, 19, 40]
ages.sorted(by: (Int, Int) -> Bool { // don't do this
    return $0 < $1
})

ages.sorted(by: {(a: Int, b: Int) -> Bool in // don't do this
    return a > b
})

ages.sorted(by: <)
ages.sorted(by: >)
ages.sorted(by: { $0 < $1 })

func add10To(value: Int) -> Int {
    return value + 10
}

func add20To(value: Int) -> Int {
    return value + 20
}

func doAddition(
    on value: Int,
    using function: (Int) -> Int
) -> Int {
    function(value)
}

doAddition(on: 20, using: add10To(value:))

doAddition(on: 20, using: add20To(value:))