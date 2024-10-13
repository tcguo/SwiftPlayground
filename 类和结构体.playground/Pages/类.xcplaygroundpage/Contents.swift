import UIKit

class Animal: NSObject {
    var furu:Bool = true

}

class Person: Animal {
    var xing: String!
    var name: String = ""
    var age: Int = 12
    // 计算属性(主要用来改变实例变量或从实例变量计算新的值)
    var fullName: String {
        get {
            return xing + name
        }
        set {
            xing = String(newValue.prefix(1))
            let staridex = newValue.index(newValue.startIndex, offsetBy: 1)
            name =  String(newValue[staridex ... newValue.endIndex])
        }
    }
    
    
    /// 只读的计算属性
    var fullname_zh: String {
        return "guo" + xing + name
    }
    
    
    init(isFu: Bool) {
        self.xing = ""
    }
    
    convenience init(name: String, age: Int) {
        self.init(isFu: true)
        self.name = name
        self.age = age
    }
    
    func play1() {
        
    }
    
    // 重写
    override func isEqual(_ object: Any?) -> Bool {
        return true
    }
    override func copy() -> Any {
        let person = Person(name: "dd", age: 22)
        person.xing = self.xing;
        return person
    }
}

//: ## 继承
class Student: Person {
    
    override init(isFu: Bool) {
        super.init(isFu: isFu)
    }
    
    convenience init(name: String, age: Int) {
        self.init(isFu: true)
        
    }
    
    override var name: String {
        get {
            return super.name
        }
        set {
            super.name = super.name + newValue + "student"
        }
    }
    
    
    func study(para:String) -> Void {
        
    }
    
    func play() {
        
    }
    
    // 方法重载1
    func play(a:Date) {
        
    }
    // 方法重载2
    func play(b:Date) {
        
    }
    
    
}

var per = Person(name: "", age: 33)


// Protocol

protocol Protocol1 {
    var enable:Bool { set get}
    
    func method1() -> Int
    
}

protocol Protocol2 {
    var enable2:Bool { get }
    
    func method2()
}

class MyData: Protocol1, Protocol2 {
    var enable: Bool
    
    func method1() -> Int{
        return 1
    }
    
    init() {
        self.enable = false
    }
    
    var enable2: Bool {
        return false
    }
    
    func method2() {
        
    }
}

var data = MyData()
data.enable = false
print(data.enable2)
data.method1()
data.method2()
/*
DispatchQueue.global(qos: .userInitiated).async {
    print("11\(Thread.current)")
}

DispatchQueue.main.async {
    print("22\(Thread.current)")
}
*/

// 可失败初始化
class Me {
    var name: String = ""
    var age: Int = 0
    
    init?(name: String) {
        if name != "guo" {
            return nil
        }
        self.name = name
    }
    // 必要初始化器，子类必须实现一个一样的
    required init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    // 属性-闭包初始化器
    var addr:String = {
      return "henan"
    }()
    
}

var me:Me? = Me(name: "guo") // me的类型可选
if (me != nil) {
    print(me!.name)
} else {
    print("初始化失败")
}

// 41. 自动引用计算ARC工作机制
// 强引用

class Test {
    var name:String = ""
    init(name:String, ref3: TestB) {
        self.name = name
        self.ref3 = ref3
    }
    
    var ref: TestB? = nil
    weak var ref2: TestB? = nil // 弱引用
    unowned var ref3: TestB // 不能是可选类型
    
    // 反初始化
    deinit {
        print("test被销毁")
    }
}

class TestB {
    
}

//var test = Test(name: "guo", ref3: TestB()) // 强引用
//var tst1 = test
//var tst2 = test



func play(param:()->Void) {
    param()
}

func play2(param: (String) -> Int) {
    param("paly2")
}


func play3(param:()->Void, a: Int) {
    param()
}

func play3(param:(Int, Int)->Void, a: Int) {
    param(12,12)
}


// 调用
play(param: {() ->Void in
    print("play")
})
// 尾随闭包
play {
    print("22paly")
}

play2 { (aa) -> Int in
    print("---" + aa)
    return 1
}

play3(param: {
    print("---play3")
}, a: 12)

play3(param: { (a, b) in
    print("---play3=\(a+b)")
}, a: 12)

var a = 11
var str: String = "play ground"
for char in str {
    print("char = " + String(char))
}

var charr:Character = "a"
print(type(of: charr))


str.append("with guo")
var str2 = String(format: "%d --%f--%.2f", a, 12.22, 12.3344)

let str3 = str2 + "gogogo"

/*
// [1, 5]
for idx in 1...5 {
    print(idx)
}
// [1, 5)
for idx in 1..<5 {
    print(idx)
}
*/

var nums:[Int] = [12, 23, 33, 12, 44, 23]
for num in nums where num > 20 {
    print("num=" + String(num))
}

var value:(Int, String) = (1, "小明")
switch value {
case let (x, _) where x < 60:
    print("不及格")
default:
    print("及格")
}

// 元组
var man = (age: 12, name: "guo", married: true)
//print(man.age)
//print(man.name)
//print(man.married)


let names = ["zhangs", "wang", "liu", "zhuang"]
names.forEach { (name) in
    switch name {
    case let name where name.hasPrefix("zh"): // 条件
        print(name)
    default:
        print("dd")
    }
}


enum TestError: Error {
    case httpCode(Int)
}

func throwError(a: Int) throws -> String? {
    if (a < 0) {
        throw TestError.httpCode(500)
    }
    
    return ""
}

do {
    try throwError(a: 10)
} catch TestError.httpCode(let httpcode) where httpcode > 500 {
    
}

let result = try? throwError(a: -2)
 

func dd(){
    print("12")
    return
}

func cc() {
    dd()
    print("444")
}

cc()











