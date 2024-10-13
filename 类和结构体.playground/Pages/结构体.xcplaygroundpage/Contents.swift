//: [Previous](@previous)

import Foundation


//: mutating关键字
/**
 使用 mutating 关键字修饰方法是为了能在该方法中修改 struct 或是 enum 的变量，在设计接口的时候，也要考虑到使用者程序的扩展性。所以要多考虑使用mutating来修饰方法。
 */
protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

struct ExampleStruct: ExampleProtocol {
    var simpleDescription: String
    //
    mutating func adjust() {
        simpleDescription += "(adjusted)"
    }
}
enum Weekday: ExampleProtocol {
    case Monday, Tuesday, Wednesday
    var simpleDescription: String {
        get {
            switch self {
            case .Monday:
                return ""
            default:
                return ""
            }
        }
        set {
            simpleDescription = newValue
        }
    }
    mutating func adjust() {
        simpleDescription += "adjusted"
    }
}


class ExampleClass {
    var simpleDescription: String = ""
    func adjust() {
        simpleDescription += "adjusted"
        print(simpleDescription)
    }
}
var clas = ExampleClass()
clas.adjust()




//: [Next](@next)
