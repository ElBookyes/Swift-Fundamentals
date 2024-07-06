import Foundation
//import PlaygroundSupport
//import _Concurrency

// PlaygroundPage.current.needsIndefiniteExecution = true (this is needed to run async code in a playground)

// func calculateFullName(
//     firstName: String,
//     lastName: String,
//     completion: @escaping (String) -> Void
// ) {
//     DispatchQueue.global().async {
//         let fullName = "\(firstName) \(lastName)"
//         completion(fullName)
//     }
// }

func calculateFullName(firstName: String, lastName: String) async -> String {
    try? await Task.sleep(for: .seconds(2))
    return "\(firstName) \(lastName)"
}

Task {
    // way 1
    let result1 = await calculateFullName(firstName: "Foo", lastName: "Bar")
    // way 2
    async let result2 = calculateFullName(firstName: "Baz", lastName: "Qux")
    await result 2
}


enum Clothe {
    case socks, shirt, trousers
}

func buySocks() async throws -> Clothe {
    try await Task.sleep(for: .seconds(1))
    return Clothe.socks
}

// collection of clothes (ensemble)

struct Ensemble: CustomDebugStringConvertible { // prints to console in a nice format 
    let clothes: [Clothe]
    let totalPrice: Double

    var debugDescription: String {
        return "Ensemble with \(clothes.count) clothes"
    }
}

func buyWholeEnsamble() async throws -> Ensemble {
    async let socks = buySocks()
    async let shirt = buyShirt()
    async let trousers = buyTrousers()
    let ensemble = Ensemble(
        clothes: await [try socks, try shirt, try trousers],
        totalPrice: 200
    )
    return ensemble
}

Task {
    if let ensemble = try? await buyWholeEnsamble() {
        print(ensemble)
    } else {
        print("Something went wrong")
    }
}

func getFullName(
    delay: Duration,
    calculator() async -> String
) async -> String {
    try? await Task.sleep(for: delay)
    return await calculator()
}

func fullName() async -> String { "Foo Bar" }

Task {
    await getFullName(
        delay: .seconds(2),
    ) {
        async let name = fullName()
        return await name
    }
}