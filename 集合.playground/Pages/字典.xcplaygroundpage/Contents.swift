//: [Previous](@previous)

import Foundation
import UIKit

/**
 为了能够检查字典的工作方式，你需要了解什么是哈希以及哈希如何工作。散列是将值（字符串，整数，双精度，布尔等）转换为数字值（称为散列值）的过程。然后，可以使用此值快速查找哈希表中的值。

 一个字典的Key类型必须遵循Hashable协议，
 
 Swift字典对键有类型要求。key必须是可哈希的，否则会出现编译器错误。
 幸运的是，在Swift中，所有基本类型都已经可以哈希并且具有哈希值。此值必须是确定性的-意味着给定值必须始终返回相同的哈希值。无论你为某个字符串计算哈希值多少次，它始终会给出相同的值。但是，永远不要保存哈希值，因为每次运行程序时哈希值都会不同。
*/

//: # 字典的常见用法
//:  ## 创建
var dict: [String : Any] = [:]
dict["name"] = "guo"
dict["age"] = 12
dict["addr"] = ["heann", "bei"]
print(dict)

// 定义可变字典
//var mutableDict = Dictionary<String, NSObject>() //方式一
//AnyObject: 一般指定类型  NSObject: 一般用于创建对象
//var mutableDict = [String : NSObject]()   //方式二
//var mutableDict = [String : AnyObject]() //常用  方式三
var mutableDict: [String : Any] = [:]

/**
 Any 可以处理任何结构体、枚举、元组或者其他你在 Swift 语言中可以定义的类型。
 Swift 现在引入 Cocoa API 作为 Any 和（或） AnyHashable 的可接受集合，所以我们可以改变集合的类型来使用 [AnyHashable: Any] 代替 [NSObject: AnyObject]
 */
var anykeyaa:[AnyHashable: Any] = [:]



dict["name"] = "guo1"
print(dict)
dict["sex"] = true // 追加
print(dict)

//: ## 更新
dict.updateValue("guotian", forKey: "name")
dict["age"] = 14
print(dict)

//: ## 取值
var name = dict["name"]

//:   ## 遍历
for person in dict {
    print(person)
}
for (key, val) in dict {
    print("key=\(key), val =\(val)")
}
for val in dict.values {
    
}
for kk in dict.keys {
    
}

//: ## 移除
dict["name"] = nil
print(dict)
dict.removeValue(forKey: "age")
print(dict)


/// fdsf

//: [Next](@next)
