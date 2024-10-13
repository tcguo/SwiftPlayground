import UIKit
import libxml2


/**
 异常处理
 - Author: guotianchi
 - Attention:
 */
enum LoginError: Error {
    case UserNameorPwdError
    case VerfiyCodeError
    case TimeoutError
}

func login(userName: String, pwd: String, verify: Int) throws -> Bool {
    if userName.count < 3 {
        throw LoginError.UserNameorPwdError
    }
    if String(verify).count < 3 {
        throw LoginError.VerfiyCodeError
    }
    
    return true
}

/**
 try？后面的语句可能会抛出异常， 如果抛出异常则赋值nil给左侧；如果没抛出异常则将返回值赋给左侧；

 try！取消异常捕获逻辑，语法有点任性，相当于裸奔， 明知可能抛出异常，但自信这段代码不会抛异常。 try！是try？的补充。你确定后面语句不会抛出异常，但真的抛出异常后程序会崩溃。不建议使用try！，有使用场景推荐使用try？
 */

let isSuccess = try? login(userName: "guo", pwd: "", verify: 1234)
// 与下面的相同
do {
    let ok = try login(userName: "gu", pwd: "222", verify: 2234)
    print("login is\(ok)")
} catch LoginError.UserNameorPwdError {
    print("UserNameorPwdError")
} catch LoginError.VerfiyCodeError {
    print("VerfiyCodeError")
} catch { // 捕获所有异常
    print("occur error")
}

/**
 Swift使用defer关键字作用同Java的finally， 即使代码块内有break、continue、return或者抛异常，在退出代码块后仍然会执行defer代码块
 */
func testDefer() throws {
    print("defer begin")
    defer {
        print("finally  do thing")
    }
    do {
        try login(userName: "gu", pwd: "222", verify: 2234)
        print("login is success")
    } catch LoginError.UserNameorPwdError {
        print("UserNameorPwdError")
        throw LoginError.UserNameorPwdError
    } catch LoginError.VerfiyCodeError {
        print("VerfiyCodeError")
        throw LoginError.VerfiyCodeError
    } catch { // 捕获所有异常
        print("occur error")
    }
    print("defer end")
}

try? testDefer()


struct XMLParsingError: Error {
    enum ErrorKind {
        case invalidCharacter
        case mismatchedTag
        case internalError
    }
    
    let line: Int
    let column: Int
    let kind: ErrorKind
}

func parse(_ source: String) throws -> Void {
    // ...
    throw XMLParsingError(line: 19, column: 5, kind: .mismatchedTag)
    // ...
}

