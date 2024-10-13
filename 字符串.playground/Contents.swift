import UIKit

var str = "Helloplayground"

// 追加
var str1 = "hello,swift"
let allStr = str + str1
let allstr2 = str.appending(str1)
print(allstr2)

for charr in str {
    print(charr)
}

for i in 0..<2 {
    print(i)
}
var names: [String] = ["a", "b", "c"]
print(names.joined(separator: ","))

let count = names.count
for i in 0..<count {
    names[0] = "22" // 可以修改数组的值
    print(names[i])
}
