import Foundation

// avoid writing the same code multiple times
// make your application scalable

func perform<N: Numeric>(
    _ op: (N, N) -> N,
    on a: N,
    and b: N
) -> N {
    return op(a, b)
}
print(perform(+, on: 1, and: 2))

func perform2<N>(
    _ op: (N, N) -> N,
    on a: N,
    and b: N
) -> N where N: Numeric {
    return op(a, b)
}
print(perform2(+, on: 1, and: 2))

// combining multiple protocols into a generic type

protocol CanJump {
    func jump()
}

protocol CanRun {
    func run()
}

struct Person: CanJump, CanRun {
    func jump() {
        print("Jumping")
    }
    func run() {
        print("Running")
    }
}

func jumpAndRun<T: CanJump & CanRun>(_ value: T) {
    object.jump()
    object.run()
}

let person = Person()
jumpAndRun(person)

let names: [String] = ["John", "Jane", "Jack"]

extension [String] {
    func longestString() -> String? {
        self.sorted { (lhs: String, rhs: String) -> Bool in
            return lhs.count > rhs.count
        }.first
    }
}

["ok", "okkk", "oookkk"].longestString()


protocol PresentableAsView {
    associatedtype ViewType: View
    func produceView() -> ViewType
    func configure(
        superView: View,
        thisView: ViewType
    )
    func present(
        view: ViewType,
        on superView: View
    )
}