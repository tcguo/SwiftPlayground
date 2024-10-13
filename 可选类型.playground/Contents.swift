import UIKit

var name: String?
if let name = name {  // 解包
    print("name is = ", name)
}

let stringNumbers = ["12", "14", "three"]
let maybeInts = stringNumbers.map{Int($0)}
var iterator = maybeInts.makeIterator()
while let maybe = iterator.next() {
    print("maybe is = ", maybe)
}
for case let i? in maybeInts {
    // i 将是 Int 值，⽽不是 Int?
    print(i, terminator: "\n")
}
// 或者只对 nil 值进⾏行行循环
for case nil in maybeInts {
    // 将对每个 nil 执⾏行行⼀一次
    print("No value")
}
//  基于 case 的模式匹配可以让我们把在 switch 的匹配中用到的规则同样地应用到 if，for 和 while 上去。最有用的场景是结合可选值，但是也有一些其他的使用方式，比如:
let jj = 5
if case 0..<10 = jj {
    print("\(jj) 在范围内")
} // 5 在范围内


// if var and while var
// 除了 let 以外，你还可以使用 var 来搭配 if、while 和 for。这么做，你就可以在语句块中改变变 量了.i 会是一个本地的复制。任何对 i 的改变将不会影响到原来的可选值
let number = "1"
if var i = Int(number) {
    i+=1
    print(i)
} // 2


//  请注意 a = 10 和 a? = 10 的细微不同。前一种写法无条件地将一个新值赋给变量，而后一种写 法只在 a 的值在赋值发生前不是 nil 的时候才生效
var aInt:Int? = 5
aInt? = 10
aInt // Optional(10)
var b: Int? = nil
b? = 10
b // nil

func add(a: Int, b: Int) -> Int {
    return a + b
}
func add(a: Int?, b: Int?) -> Int? {
    guard let a = a else { return nil }
    guard let b = b else { return nil }
    return a + b
}

let result = add(a: 12, b: 12)
let result2 = add(a: nil, b: 12)
print("add result =", result)
print("add result2 =", result2)



// if case
enum CarBrand{
   case  BMW
   case  AUDI
   case  BENZ
}
let myBrand = CarBrand.BMW
switch myBrand{
    case .BMW: do{   print("宝马")  }
    case .AUDI: do{   print("奥迪")  }
    case .BENZ: do{   print("奔驰")  }
}
if case .BMW = myBrand {
   print("宝马")
}

// if case let
enum CarBrand2{
    case  BMW(name:String,Production:String)
    case  AUDI(name:String,Production:String)
    case  BENZ(name:String,Production:String)
}
let myCar = CarBrand2.BMW(name: "宝马", Production: "德国")
//比较简单的是可以使用switch：
switch myCar {
  case let CarBrand2.BMW(name,Production):
    print("This car named \(name)，from\(Production)")
  default: () // 不做任何处理
}
//这样确实可以的。同样我们觉得这样还是过于繁琐了。
//使用if case let：
if case let CarBrand2.BMW(name, Production) = myCar{
    print("\(name),\(Production)")
}

// where
// if let 和 guard 语法中出现的where只是附加一些条件。相当于逻辑运算 && 和 ||。SQL中的条件语法也是用where这个关键字。
for i in 0...20 where i % 3 == 0 {
    print("i = \(i)")
}
let age = 19
if case 10...20 = age, age > 18 {
// 在swift3中，使用if case这样的模式匹配，where关键字可以省略，转而使用,(逗号)代替即可
}

let age1: Int? = 24
if let age1 = age1 , age1 > 23 {
    print("age1 where = \(age1)")
}


// guard


















