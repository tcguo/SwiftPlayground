import UIKit

var a = 12, b = 12.3
print(a, b)

var isOK = false
let xing = "guo"
var ming = "tianchi"
// 拼接字符串
print(xing + ming + "\(a)\(b)\(isOK)")
print(type(of: xing))

// 类型别名: typealias
typealias NameString = String
var son:NameString = "zaozao"

// 类型转化： 类型()和 ??语法
var dd = "12d"
var indd = Int(dd) ?? 13
print(indd)
print(Int(12.4))
print(Double(12.5))
print(Bool(truncating: 1))

// 可选类型
var num:Int?
var num1:Int! = 11 //
//num1 = nil;
var num11:Int = 11 // 后面不能在赋值为nil
//num11 = nil //报错


if let num = num {
    print("num==" + String(num)) //判断解包
} else {
}
//print(num) //强制解包

var num2:Int? = num1; // 赋值需要注明num2的类型
print(num2!)

var ss:Int = 1 //
switch ss { //可以是元组，枚举，等类型
case 1, 3, 4:
    print("134")
case 2, 6, 7:
    print("267")
default:
    print("default")
}

//switch ss {
//case let (ss > 1):
//    print(">1")
//case let (ss < 1):
//    print("<1")
//default:
//    print("==1")
//}

/*
for a in 1..<5 {
    print(a)
}

for index in (1...4) {
    print(index)
}

for index in (0...5).reversed() {
    print(index)
}

for index in stride(from: 0, to: 10, by: 3) {
    
}
*/


var e = 1... // 无穷
print(e)

// 求三角形的面积-海伦公式
struct Point {
    var x:Int
    var y:Int
}

func getTriangleArea(a: Point, b: Point, c: Point) -> Double {
    let alen = getSideLength(a: a, b: b)
    let blen = getSideLength(a: b, b: c)
    let clen = getSideLength(a: c, b: a)
    
    let s:Double = 1/2.0 * (alen + blen + clen)
    
    let area:Double = sqrt(s*(s-alen)*(s-blen)*(s-clen))
    return area
}

func getSideLength(a: Point, b: Point) -> Double {
    let xx:Int =  a.x - b.x
    let yy:Int = a.y - b.y
    
    let side:Double = Double(sqrt(Double(xx*xx + yy*yy)))
    
    return side
}
let pinta = Point(x: 4, y: 7)
let pintb = Point(x: 1, y: 2)
let pintc = Point(x: 6, y: 2)
let area = getTriangleArea(a: pinta, b: pintb, c: pintc)
print("area = \(area)");

func getCirleArea(r: Double) -> Double {
    return M_PI * r*r;
}


// 类方法
class Person {
    static func test(a:Int) {
        
    }
    static func test(aa:String) {
        
    }
    static func eat() {
        
    }
    
    /// 跑步
    /// - Parameters:
    ///   - t: 时间
    ///   - km: 公里
    /// - Returns: 无
    static func run(time t:Date, km2 km:Int) -> Void {
        
    }
}
Person.test(a: 12)
Person.test(aa: "312")
Person.run(time: Date(), km2: 12)


// 元组

let myRect = (x:12, y:22, width:22, height: 33)

func testTuple(rect:(x:Int, y:Int, width:Int, height:Int)) ->(Int,Int,Int,Int) {
    var newRect:(x:Int, y:Int, w:Int, h:Int)
    newRect.x = rect.x + 10
    newRect.y = rect.y + 10
    newRect.w = rect.width + 20
    newRect.h = rect.height + 22
    return newRect
}
print(testTuple(rect: myRect))




/**************函数*******************/

// 函数类型，函数也可以赋值给变量
func aaFunc(a:Int, b:Int) ->Int {
    let sum = a+b
    return sum
}
var aa:(Int,Int)->Int = aaFunc(a:b:)
let sum = aa(12, 12)
print("sum=\(sum)")
let bb:(Int,Int)->Int = aaFunc(a:b:)



// 匿名函数
var aab:(Int,Int)->Int = {(a:Int, b:Int) ->Int in
    let sum = a + b
    return sum
}
print("sum1= \(aab(22,12))")


// 函数作为参数
func functype(afunc:(Int,Int)->Int) {
    let result:Int = afunc(12, 12)
    print("rsult =\(result)")
}
functype(afunc: aaFunc)
functype(afunc: aab)


// 函数作为返回值
func functype2(afunc:(Int,Int)->Int) -> (Int, Int)->Int {
    let result:Int = afunc(12, 12)
    
    return {(a:Int, b:Int)->Int in
        return a + b + result
    }
}

// 内嵌函数
func testInner(param:Bool) -> (Int)->Int {
    func inner1(val:Int) -> Int {
        return val * val
    }
    
    func inner2(val: Int) -> Int {
        return val + val
    }
    
    // swift5.4之后，内嵌函数可以重载
    func inner2(val1: Int, name: String) -> String{
        return String(val1) + name
    }
    
    return param ? inner1(val:) : inner2(val:)
}

var tstInner = testInner(param: true)
let testval = tstInner(10)
print("testval = \(testval)")


// 匿名函数的简写形式
var nonamefunc:()->Void = {
    print(type(of: tstInner)) // 没有参数没有返回值，直接大括号写内容
}
var nonamefunc2 = {
    print("nonamefunc2")
    print(type(of: tstInner))
}
nonamefunc()
nonamefunc2()

func niming(param:()->Void) {
    param()
}
niming(param: {()->Void in
    print("niming")
})
// 正常调用
niming(param: {
    print("niming")
})
// 简化调用
/**
 最后，如果一个函数除了闭包表达式外没有别的参数，那么方法名后面的调用时的圆括 号也可以一并省略。尾随闭包了
 */
niming {
    print("niming")
}


print("-----------------")
func niming2(param:(Int, Int)->Int) {
    print(param(10, 20))
}

// 正常调用
niming2(param: {(a:Int, b:Int)->Int in
    return a * b
})

// 简化调用1
/**
 Swift 会自动为函数的参数提供简写形式，$0 代表第一个参数，$1 代表第二个参数，以 此类推。
 - 如果闭包表达式的主体部分只包括一个单一的表达式的话，它将自动返回这个表达式的 结果，你可以不写 return。
 */
niming2(param: { return $0+$1 })
niming2(param: { $1 - $0 })


// 简化调用2
niming2 { (a, b) -> Int in
    return a + b
}
niming2 { aa, bb in
    return aa + bb
}


func niming3(param:(Int, Int)->Void) {
    print(param(10, 20))
}
niming3 { (a, b) in
    let sum = a + b
}


// 回调闭包
var didChange:((String) -> Bool)?
didChange = {(a: String)->Bool in
    print("闭包='\(a)'");
    return false
}
didChange!("12")



// 可变参数
// swift5.4 可变参数可以是多个，scores也可以是
func mutableParams(courses: String..., scores: Int) {
    for i in 0..<courses.count {
        print(courses[i])
    }
}
mutableParams(courses: "语文", "数学", scores: 12)


func test (a: Int, complet complet: (Int, Int)->Void, complet1: (Int, Int)->Void) {
    let aa =  complet(a, 3)
    print("aa =\(aa)")
}

test(a: 1) { c, d in
    
} complet1: { dd, ee in
    
}
UIView.animate(withDuration: 1) {
    
} completion: { _ in
    
}

UIView.animate(withDuration: 1, delay: 3, options: .allowAnimatedContent) {
    
} completion: { isOK in
    
}





// MARK: -------

public class Observable<Element> {
    
}

public struct PrimitiveSequence<Trait, Element> {
    let source: Observable<Element>

    init(raw: Observable<Element>) {
        self.source = raw
    }
}

extension PrimitiveSequence: PrimitiveSequenceType {
    // Converts `self` to primitive sequence.
    ///
    /// - returns: Observable sequence that represents `self`.
    public var primitiveSequence: PrimitiveSequence<Trait, Element> {
        return self
    }
}
extension PrimitiveSequence  {
    /// Converts `self` to `Observable` sequence.
    ///
    /// - returns: Observable sequence that represents `self`.
    public func asObservable() -> Observable<Element> {
        return self.source
    }
}

public enum SingleTrait { }
/// Represents a push style sequence containing 1 element.
public typealias Single<Element> = PrimitiveSequence<SingleTrait, Element>

/// Observable sequences containing 0 or 1 element
public protocol PrimitiveSequenceType {
    /// Additional constraints
    associatedtype Trait

    /// Sequence element type
    associatedtype Element

    @available(*, deprecated, renamed: "Trait")
    typealias TraitType = Trait

    @available(*, deprecated, renamed: "Element")
    typealias ElementType = Element

    // Converts `self` to primitive sequence.
    ///
    /// - returns: Observable sequence that represents `self`.
    var primitiveSequence: PrimitiveSequence<Trait, Element> { get }
}

public enum SingleEvent<Element> {
    /// One and only sequence element is produced. (underlying observable sequence emits: `.next(Element)`, `.completed`)
    case success(Element)
    
    /// Sequence terminated with an error. (underlying observable sequence emits: `.error(Error)`)
    case error(Swift.Error)
}

extension PrimitiveSequenceType where Trait == SingleTrait {
    
    public func subscribe(_ observer: @escaping (SingleEvent<Element>) -> Void) -> Void {
        var stopped = false
        return self.primitiveSequence.asObservable().subscribe { event in
            if stopped { return }
            stopped = true
            
            switch event {
            case .next(let element):
                observer(.success(element))
            case .error(let error):
                observer(.error(error))
            case .completed:
                rxFatalErrorInDebug("Singles can't emit a completion event")
            }
        }
    }
}

let source = Observable<String>()
var singled = Single<String>(raw: source)




































































