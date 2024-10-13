import UIKit


var addss = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let ddddd = addss.split(separator: 4)
print(ddddd)


//:  # 数组的常见用法
var num: Int?
var nums: [Int] = [1, 2, 4, 5]

var floats: [Float] = [12.3, 21.0, 11]
for val in nums {
    print("val ='\(val)'")
}

var anyObjects: [Any] = [12, "12", 12.2, [1,1], ["key": "value"]]
print(anyObjects)


struct Apple {
    var color: String?
    var addr: String?
}
let apple1 = Apple(color: "red", addr: "shandong")
let apple2 = Apple(color: "green", addr: "weihai")
var customArr: [Apple] = [apple1]
customArr.append(apple2)

class Taozi {
    var time: Date?
    var addr: String?
}
var tao1 = Taozi()
var tao2 = Taozi()
var anyObjs: [AnyObject] = [tao1, tao2]
print(anyObjs)

func testImmutable(arr: [Any]) {
    // 不能直接使用arr，参数是不可变的
    var innerArr = arr
    innerArr.append("dd")
}

var names: [String] = ["guo", "LIU", "Zhang"]
var ages: [Int] = [12, 23, 15]
//: ## 查找
print(names[0])
var idxliu: Int? = names.firstIndex(of: "liu")
print("idxliu =\(idxliu)");

//: ## 添加
names.append("li")
names.insert("zhao", at: 2)
names += ["chen", "chi"] // 追加数组
print("追加之后 =", names)


//: ## 修改
names[0] = "guo1"
print("修改之后 =", names)
//:  ## 替换
names.replaceSubrange((1...3), with: ["liu1", "zhao1", "zhang1"])
print("替换之后 =", names)
//:  ## 合并
let namesnew = names + ["wang1", "wang2"]
print("合并新  =", namesnew)

//:  ## 删除
//names.remove(at: 1);
//names.removeFirst()
//names.removeLast()
//names.popLast()
//names.removeAll()

//:  ## 属性
let isEmpty = names.isEmpty
let count = names.count

//:  ## 数组转字符串
let strNames = names.joined(separator: ">>")
print("数组转字符串 = ", strNames)

//: ## 遍历，
//:  > forin效率最高
for name in names {
    
}

//: ## map函数应用
let mapResult = names.map { (name: String) -> String in
    return name + "000"
}
let mapResult2 = names.map { (name: String) -> String in
    return name.uppercased()
}
let mapResult21 = names.map { name in
    return name + "111" // 不知道name的类型
}
let mapResult3 = names.map { $0.lowercased() } // 最简单写法
print("map之后 =", mapResult)
print("map2之后 =", mapResult2)
print("map3之后 =", mapResult3)


//: ## compactMap：

//: > 和map对比着理解 compactMap在进行元素映射的时候，会将nil过滤掉，并且会将可选项进行解包

let numbers:[String] = ["12", "14", "15", "12g"]
let newNames = numbers.map { (name) -> Int? in
    return Int(name)
}
let newNames1 = numbers.compactMap { (num) -> Int? in
    return Int(num)
}
print("newNames =", newNames)
print("newNames1 =", newNames1)


//: ## flatMap
/**
flatMap: 对数组的每一个元素做一次处理，返回处理后的数组。
与map的区别是：
1. 返回后的数组中不存在nil，同时也会把Optional解包
2. flatMap还能把多维数组变成一维数组。
3. flatMap也能把两个不同的数组合并成一个数组，
 这个合并的数组元素个数是前面两个数组元素个数的乘积

compactMap与flatMap的区别:
1. 当闭包中的返回结果是可选的时候，使用compactMap代替flatMap，
2. 那么当闭包中的返回结果不是可选的时候，依然使用flatMap。
3. compactMap不能降维数组
*/

// filter过滤函数应用
let filterRes = names.filter { $0.hasPrefix("zh") }
let filterRes2 = names.filter { (name: String) -> Bool in
    return name.hasPrefix("ch")
}
print("filter1之后 =", filterRes)
print("filter2之后 =", filterRes2)

//: ## reduce函数
/** map/flatMap和filter方法都是通过一个已存在的数组， 生成一个新的、经过修改的数组。
 然而有时候我们需要把所有元素的值合并成一个新的值 那么就用到了Reduce
*/
var scores: [Int] = [1, 2, 3, 4, 5]
let sum: Int = scores.reduce(0) {
    $0 + $1
}
print("reduce Sum =", sum)
let namesum = names.reduce("") { (previousResult, name) -> String in
    return previousResult + "-->" + name
}
print("reduce namesum =", namesum)


//: ## 其他
let maxScore = scores.max()
let minScore = scores.min()
print("maxScore = \(maxScore) minScore =\(minScore)")
let containsGreater2 = scores.contains { (score) -> Bool in
    return score > 2
}
let containsGuo = names.contains { (name) -> Bool in
    return name.hasPrefix("guo")
}
print("containsGreater2  =", containsGreater2)
print("containsGuo  =", containsGuo)



//: ## sort
var agesArr = [12, 23, 2, 4, 5, 99, 56];
agesArr.sort { (a: Int, b: Int) -> Bool in
    return a < b
}
// agesArr.sort(by: >)
print("agesArr sort = \(agesArr)")






