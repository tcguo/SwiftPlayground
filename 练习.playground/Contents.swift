import UIKit

var ddd3 = ["", nil, nil]
print(ddd3.count)

var greeting = "Hello, playground"

var set1:Set<String> = ["3", "d", "3"]


print(type(of: set1))

var sset = Set<String>()
sset.insert("a")
sset.insert("b")
sset.insert("c")
sset.insert("d")

sset.remove("c")

for item in sset {
    print(item)
}

if !sset.isEmpty {
    print("is not empty")
}

if sset.contains("a") {
    print("containes a")
}

/*
func quickSort(nums: inout [Int], start: inout Int, end: inout Int) {
    while start < end {
        var mid = quickSortHelper(nums: &nums, start: &start, end: &end)
        quickSort(nums: &nums, start: &start, end: &(mid - 1))
        quickSort(nums: &nums, start: &(mid+1), end: &end)
    }
}

private func quickSortHelper(nums: inout [Int], start: inout Int, end: inout Int) -> Int {
    var i = start
    var j = end
    let key = nums[i]
    while i < j {
        while key <= nums[j] && i < j {
            j -= 1
        }
        
        nums[i] = nums[j]
        
        while i < j && nums[i] <= key  {
            i += 1
        }
        
        nums[j] = nums[i]
    }
    
    nums[i] = key
    
    return i
}

var nums = [12, 4, 5, 3, 14, 8, 6, 20]
print(nums)
quickSort(nums: &nums, start: &0, end: &nums.count-1))
print(nums)
*/

var nums = [12, 4, 5, 3, 14, 8, 6, 20]

var min = Int.min
for num in nums {
    if num > min {
        min = num
    }
}
var lastinde = nums.lastIndex(of: min)
nums.remove(at: lastinde!)


print("max = \(min)")

