import UIKit



// 二分查找, // 二分查找需要数组有序
func binarySearch(nums: [Int], target: Int) -> Int {
    var low = 0
    var high = nums.count - 1
    
    while low < high {
        let mid = low + (high - low)/2
        if nums[mid] == target {
            return mid
        } else if nums[mid] < target {
            low = mid + 1
        } else {
            high = mid - 1
        }
    }
    
    return -1
}

// 搜索旋转数组
func search(_ nums: [Int], _ target: Int) -> Int {
    var low = 0
    var high = nums.count - 1
    
    while low < high {
        let mid = low + (high - low)/2
        if target == nums[mid] {
            return mid
        }
        
        if nums[low] <= nums[mid] {
            if nums[low] <= target, target < nums[mid] {
                high = mid - 1
            } else {
                low = mid + 1
            }
        } else {
            if nums[mid] < target, target <= nums[high] {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
    }
    
    return -1
    
}
