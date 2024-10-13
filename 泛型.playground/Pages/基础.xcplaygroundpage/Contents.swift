import UIKit

func swap(a: inout Int, b: inout Int) {
    let temp = a
    a = b
    b = temp
}
var a = 12, b = 21
swap(&a, &b)
print("a=\(a), b=\(b)")

// 兼容String交换
func swapTwoValues<T>(a: inout T, b: inout T) {
    let temT = a
    a = b
    b = temT
}
var str1: String = "aaa", str2 = "bbb"
swapTwoValues(a: &str1, b: &str2)
print("str1 = \(str1), str2 = \(str2)")




class Person<T> {
    var ttype:T?
    
    init(type: T) {
        self.ttype = type
    }
}
class Leg {
    var length: Int = 0
    var count = [12, 2]
}
struct Hand {
    var length: Int = 0
    var count = [12, 2]
}

var person = Person<String>(type: "guo")
var person2 = Person<Int>(type: 12)
var person3 = Person<Leg>(type: Leg())
var person4 = Person<Hand>(type: Hand(length: 12, count: [2,3]))

//: ## 类型约束

/**
 这个要求通过 Dictionary 键类型上的类型约束实现，它指明了键类型必须遵循 Swift 标准库中定义的 Hashable 协议。所有 Swift 基本类型（比如 String 、 Int 、 Double 和 Bool ）默认都是可哈希的。

 创建自定义泛型类型时，你可以定义你自己的类型约束，这些约束可以提供强大的泛型编程能力。像 Hashable 这样的抽象概念，根据概念上的特征，而不是确切的类型来表征类型。
 */


/**
func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
    // function body goes here
}
上面的假想函数有两个形式参数。第一个类型形式参数， T ，有一个类型约束要求 T 是 SomeClass 的子类。第二个类型形式参数， U ，有一个类型约束要求 U 遵循 SomeProtocol 协议。
*/

func findIndex<T>(of valueToFind: T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
//        if value == valueToFind {
//            return index
//        }
        
        /**
         Swift 中的类型不是每种都能用相等操作符（ == ）来比较的。如果你创建自己的类或者结构体去描述一个复杂的数据模型，比如说，对于那个类或结构体来说，”相等”的意义不是 Swift 能替你猜出来的。因此，不能保证这份代码可以用于所有 T 可以表示的类型，当你尝试编译这份代码时会提示一个相应的错误。
         */
    }
    return nil
}

func findIndex<T: Equatable>(of valueToFind:T, in array:[T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

class Data {
    
}

func findIndexData<T: Data>(data: T) -> Int? {
    if !(data is Data) {
        return 2
    }
    var aa = Data()
    return 1
}

var result = findIndexData(data: Data())
print(result)


//: ## 关联类型 -----

/**
 定义一个协议时，有时在协议定义里声明一个或多个关联类型是很有用的。关联类型给协议中用到的类型一个占位符名称。直到采纳协议时，才指定用于该关联类型的实际类型。关联类型通过 associatedtype 关键字指定。
 */

protocol Container {
    associatedtype ItemType // 关联类型
    mutating func append(_ item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}

/**
 IntStack 为了实现 Container 协议，指定了适用于 ItemType 的类型是 Int 类型。 typealias ItemType = Int 把 ItemType 抽象类型转换为了具体的 Int 类型。
 */
struct InStack: Container {
    typealias ItemType = Int
    var items = [Int]()
    
    mutating func append(_ item: Int) {
        self.items.append(item)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> Int {
        return items[i]
    }
}

struct Stack<Element>: Container {
    // 由泛型来推断
    typealias ItemType = Element
    var items: [Element] = [];
    
    mutating func append(_ item: Element) {
        items.append(item)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> Element {
        return items[i]
    }
}

//: **给关联类型添加约束**

protocol Container2 {
    // 要遵循这个版本的 Container ，容器的 Item 必须遵循 Equatable 协议。
    associatedtype Item: Equatable
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

//:  **扩展现有类型来指定关联类型**
/**
 数组已有的 append(_:) 方法和下标使得Swift能为 ItemType 推断出合适的类型，就像上面的泛型 Stack 类型一样。定义这个扩展之后，你可以把任何 Array 当做一个 Container 使用。
 */
extension Array: Container {
    
}

//: ## 泛型Where分句

/**
 泛型 Where 分句让你能够要求一个关联类型必须遵循指定的协议，或者指定的类型形式参数和关联类型必须相同。泛型 Where 分句以 Where 关键字开头，后接关联类型的约束或类型和关联类型一致的关系。
 */

func allItemMatch<C1: Container, C2: Container>(someContainer: C1, anotherContainer: C2) -> Bool where C1.ItemType == C2.ItemType, C1.ItemType: Equatable {
    
    if someContainer.count != anotherContainer.count {
        return false
    }
    
    for i in 0...someContainer.count {
        if someContainer[i] != anotherContainer[i] {
            return false
        }
    }
    return true
}

/**
 - C1 必须遵循 Container 协议（写作 C1: Container ）；
 - C2 也必须遵循 Container 协议（写作 C2: Container ）；
 - C1 的 ItemType 必须和 C2 的 ItemType 相同（写作 C1.ItemType == C2.ItemType ）；
 - C1 的 ItemType 必须遵循 Equatable 协议（写作 C1.ItemType: Equatable ）。
 */


extension Int {
    func toString() -> String {
        return String(self)
    }
}

var a2: Int = 12;
var aast = a2.toString()
print(type(of: aast))



 
