import Foundation

let firstName: String? = "Foo"
let lastName: String? = "Bar"

func + (lhs: String?, rhs: String?) -> String? {
    switch(lhs, rhs) {
        case(.none, .none):
            return nil
        case let (.some(value), .none),
             let (.none, .some(value)):
                return value
        case let (.some(lhs), .some(rhs)):
            return lhs + rhs
    }
}

let fullName = firstName + lastName

// prefix operator

prefix operator ^
prefix func ^ (value: String?) -> String? {
    return value?.uppercased()
}

let lowercaseName = "foo bar"
let uppercaseName = ^lowercaseName

//postfix operator

postfix operator *
postfix func * (value: String?) -> String? {
    return "*** \(value ?? "") ***"
}
let wrappedName = lowercaseName* 