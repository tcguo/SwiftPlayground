//: [Previous](字典)

import Foundation
import PlaygroundSupport
import UIKit
/**
 集合（Sets）。Set 用来存储相同类型并且无序无重复数据的值
 */
//: ## 创建
var set = Set<String>()
var fruits: Set = ["apple", "pear", "orange", "angle"]
var numbers: Set<Int> = [1, 3, 4, 5]
var letter: Set = Set<Character>()
//var colors: Set = [] // error
var colors: Set<Float> = []

var num = Set<Float>()
num.insert(123.3)
num.insert(123.4)
num.insert(123.5)

print(numbers)

// 将数组转为集合,由于集合里的值是不能重复的，多余的重复值将会被丢弃掉。
let array = ["apple", "apple", "orange"]
let setFromArr = Set(array)
print(setFromArr)


//: ## 元素访问与操作
print(fruits.count)
if fruits.isEmpty {
    print("集合空")
}
// 添加一个新元素：insert()
fruits.insert("banana")

// 删除一个元素：remove()
fruits.remove("pear")
//fruits.removeAll()
//fruits.remove(at: 1)
//fruits.removeFirst()

// 判断集合中是否包含特定值：contains()
if fruits.contains("apple") {
    print("contains apple")
}

// 遍历集合元素
for item in fruits {
    print(item)
}
// 如果想按照特定顺序来遍历一个 Set 中的值可以使用 sorted() 方法。它将返回一个有序数组，这个数组的元素排列顺序由操作符“<”对元素进行比较的结果来确定。
for item in fruits.sorted(by: >) {
    print(item)
}

//: ## 集合的操作

let filterRes = fruits.filter { (item:String) -> Bool in
    item.hasPrefix("a")
}
print(filterRes)

// 两个集合的基本操作
/**
 intersection(_:)：根据两个集合中都包含的值创建的一个新的集合。
 symmetricDifference(_:)：根据在一个集合中但不在两个集合中的值创建一个新的集合。
 union(_:)：根据两个集合的值创建一个新的集合。
 subtracting(_:)：根据不在该集合中的值创建一个新的集合。
 */
    
//:  ![集合](set1.png)

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
 
let set1 = oddDigits.union(evenDigits).sorted() // [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
let set2 = oddDigits.intersection(evenDigits).sorted() // []
let set3 = oddDigits.subtracting(singleDigitPrimeNumbers).sorted() // [1, 9]
let set4 = oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted() // [1, 2, 9]


//3，判断两个集合之间的关系
/**
我们可以通过如下几种方法进行判断：
==：判断两个集合是否包含全部相同的值。
isSubset(of:)：判断一个集合中的值是否也被包含在另外一个集合中。
isSuperset(of:)：判断一个集合中包含另一个集合中所有的值。
isStrictSubset(of:)：判断一个集合是否是另外一个集合的子集合，并且两个集合并不相等。
isStrictSuperset(of:)：判断一个集合是否是另外一个集合的父集合，并且两个集合并不相等。
isDisjoint(with:)：判断两个集合是否不含有相同的值（是否没有交集）。
*/
let set11: Set = [1, 3, 5]
let set22: Set = [1, 3, 5, 7, 9]
let set33: Set = [1, 2, 3]
 
set11 == set22 // false
set11.isSubset(of: set22) // true
set11.isSuperset(of: set22) // false
set11.isStrictSubset(of: set22) // true
set11.isStrictSuperset(of: set22) // false
set11.isDisjoint(with: set22) // false





//: [Next](@next)
