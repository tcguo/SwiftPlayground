//: [Previous](@previous)

import Foundation
import UIKit

var str = "Hello, playground"

//: ##forin
for i in 1...10 {
    
}

//: ##while
while false {
    
}

/**
 (1)Swift的Int类型不在支持自增减运算符,比如 ++a —a,a—,a++的方式
 (2)如果想要Swift想要支持这种方法,必须重载运算符
 */
var count:Int = 1;
repeat {
    count += 1
    print(count)
} while count < 5

//: ##switch

// 区间匹配
switch count {
case 1..<5:
    print("count in 1...5")
case 5..<10:
    print("count in 5...10")
default:
    print("count in greater than 10")
}


// 没有隐式贯穿
/**
 相比 C 和 Objective-C 里的 switch 语句来说，Swift 里的 switch 语句不会默认从每个情况的末尾贯穿到下一个情况里。相反，整个 switch 语句会在匹配到第一个 switch 情况执行完毕之后退出，不再需要显式的 break 语句
 */

/**
 在一个 switch 情况中匹配多个值可以用逗号分隔，并且可以写成多行，如果列表太长的话：
 */

let anotherCharacter: Character = "a"
switch anotherCharacter {
case "a","A":
    print("The letter A")
default:
    print("Not the letter A")
}

// 值绑定
/**
 switch 情况可以将匹配到的值临时绑定为一个常量或者变量，来给情况的函数体使用。这就是所谓的值绑定，因为值是在情况的函数体里“绑定”到临时的常量或者变量的。
 */

var anotherPoint = (2, 3)
func testAnotherPoint(point:(Int,Int)) {
    switch point {
        case (let x, 0):
            print("on the x-axis with an x value of \(x)")
        case (0, let y): do {
            print("on the y-axis with a y value of \(y)")
        }
        case let (x, y): do {
            print("somewhere else at (\(x), \(y))")
        }
    }
}
testAnotherPoint(point: (2, 4))
    

let numberSymbol: Character = "三"  // Simplified Chinese for the number 3
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑":
    possibleIntegerValue = 1
case "2", "٢", "二", "๒":
    possibleIntegerValue = 2
case "3", "٣", "三", "๓":
    possibleIntegerValue = 3
case "4", "٤", "四", "๔":
    possibleIntegerValue = 4
default: // 必须有
    break
}
if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue).")
} else {
    print("An integer value could not be found for \(numberSymbol).")
}


// Fallthrough





//: [Next](@next)
