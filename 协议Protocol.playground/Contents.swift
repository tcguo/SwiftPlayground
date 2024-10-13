import UIKit

// MARK: - Protocal
public protocol RunableProtocol {
    var foot: [String] { get set }
    var maxKm: Int { get }
    var canRun: Bool { get }
    
    func run()
    static func runwhere() -> String;
}

@objc protocol EatableProtocol {
    var food: [String] { get set}
    var eatTimes: Int { get }
    func eat()
    
    @objc optional func eatMuch()
}
// 可选接口
/*
 Swift 中的protocol 所有方法都必须被实现，不存在@optional 这样的概念。为了实现可选接口有两个办法：（一）@objc 、（二）协议扩展
在Swift2以后，我们可以对一个已有的protocol进行扩展。而扩展中实现的方法作为“实现扩展的类型”的“默认实现”
通过提供protocol的extension,我们为protocol提供了默认实现，
 这相当于“变相”将protocol中的方法设定为了optional
*/


extension RunableProtocol {
    func run() {
    }
    
    func runwhere() -> String {
        return "anywhere"
    }
}

class Heman: RunableProtocol, EatableProtocol {
    init() {
        food = []
        eatTimes = 3
    }
    
    var food: [String]
    
    var eatTimes: Int
    
    func eat() {
        
    }
    
    var maxKm: Int {
        return 100
    }
    var canRun: Bool {
        return foot.count > 0
    }
    
    // 计算属性
    private var _foots: [String] = ["左脚", "右脚"];
    var foot: [String] {
        get {
            return _foots
        }
        set {
            _foots = newValue
        }
    }
    
    func run() {
        if (canRun) {
            print("i can run");
        } else {
            print("i can't run")
        }
    }
    static func runwhere() -> String {
        return ""
    }
}


var me  = Heman()
me.foot = []
me.run()


