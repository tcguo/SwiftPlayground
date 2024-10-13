//: # 元组------------------

var status:(Int, String) = (404, "no found")

// 一种方法就是利用从零开始的索引数字访问元组中的单独元素：
var score = (100, 99, 98)
print(score.0, score.1, score.2)

// 你可以在定义元组的时候给其中的单个元素命名
var scores = (yuwen: 22, shuxue: 33, english: 44);
print("各科成绩：\(scores.yuwen),\(scores.shuxue),\(scores.english)")

// 作为参数和返回值
func makeLine(pointA:(Int,Int), pointB:(Int,Int)) -> (Int,Int){
    let pointA = (x:pointA.0, y: pointA.1)
    let pointB = (x:pointB.0, y: pointB.1)
    let lengthX = pointA.x - pointB.x
    let lengthY = pointA.y - pointB.y
    return (lengthX, lengthY)
}

makeLine(pointA: (12, 12), pointB: (14, 19))



//: # 枚举 ------------------

//:  ## 枚举定义
enum Currency {
    case Dollar
    case Euro
    
    func toString() -> String {
        switch self {
        case .Dollar :
            return "dollar"
        case .Euro :
            return "Euro"
        }
    }
    
    static func toRMB() -> String {
        return "rmb"
    }
    
    // 计算属性
    public var rmbEquable:Float {
        get {
            return 6.15
        }
        set {
        }
    }
    
    // static属性 和 static方法
    static var name: String = "汇率"
    static func read() -> String {
        return name
    }
}

let readd = Currency.read();
print("readd= \(readd)")



/**
 In addition to being able to define a number of members of an enumeration they also share many of the same capabilities that classes and structures have. These include:

 - properties. Enumerations can have computed properties, but not stored properties.
 - instance methods.
 - type methods (using the static keyword).
 - initializers.
 - extensions.
 - protocols.
 */

protocol LiuTongAble {
    func liutong() -> Void;
    func huikuan();
}

extension Currency: LiuTongAble {
    func huikuan() {
    
    }
    
    func liutong() -> Void {
        
    }
    
}

//: ## Raw values
enum Suit:String {
    case Heart = "♥️"
    case Diamond = "♦️"
    case Spade = "♠️"
    case Club = "♣️"
}

enum Rank: Int {
    case Two = 2
    case Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack
    case Queen
    case King
    case Ace
}


//: ## Associated values
enum Result {
    case Success(Int)
    case Error(Int, String)
    case Fail
    case Notnetwork
    
}
var arr:[Result] = [.Success(1), .Fail, .Error(12, "erroror")]

for val in arr {
    switch val {
    case .Success(_):
        print("Success")
    case .Error(_, let msg):
        print("Error", msg)
    case .Fail:
        print("Fail")
    case .Notnetwork:
        print("")
    }

}


//let succ = Result.Success(3)
//let err = Result.Error(-1, "Oh no, It's an error")
//
//func handleResult(result: Result){
//    switch result{
//    case .Success(let answer):
//        print("Success: The answer is \(answer)")
//    case .Error(_, let message):
//        print("Error: \(message)")
//    }
//}
//
//handleResult(result: succ)
//handleResult(result: err)



//: # dd------------------

var add: Character = "a"
print(type(of: add))

