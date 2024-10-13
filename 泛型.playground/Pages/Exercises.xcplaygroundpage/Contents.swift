//: [Previous](@previous)

import Foundation


func firstLast(arr: [Int]) -> (Int, Int) {
    return (arr[0], arr[arr.count - 1])
}

func firstLast(arr: [String]) -> (String, String) {
    return (arr[0], arr[arr.count - 1])
}

// Creating a generic function
func firstLast<T>(arr: [T]) -> (T, T) {
    return (arr[0], arr[arr.count - 1])
}


// 范型约束

// The function signature is not finished yet!
func lowest<T>(_ array: [T]) -> T? {
    // 这里的T类型不具备比较的特性
    let sortedArray = array.sorted { (lhs, rhs) -> Bool in
        return lhs < rhs
    }
    return sortedArray.first
}

func lowest<T: Comparable>(arr: [T]) -> T? {
    return arr.sorted().first
}

// 多类型范型约束

func lowestOccurrences<T: Comparable & Hashable>(values: [T]) -> [T: Int]
    where T: Comparable & Hashable {
        // ... snip
        return [:]
}

// But, a where clause is just the same.
func lowestOccurrences2<T>(values: [T]) -> [T: Int]
    where T: Comparable & Hashable {
        // ... snip
        return [:]
}

// 范型和继承的用法，区别







//: [Next](@next)
