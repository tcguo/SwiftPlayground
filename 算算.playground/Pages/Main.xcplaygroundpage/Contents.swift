import UIKit

func binarySearch(nums: [Int], target: Int) -> Int {
    var left = 0
    var right = nums.count - 1
    
    while (left <= right) {
        let mid = left + (right - left)/2 // 可能溢出
        if (nums[mid] == target) {
            return mid
        } else if (nums[mid] > target) {
            right = mid - 1
        } else if (nums[mid] < target) {
            left = mid + 1
        }
    }
    
    return -1;
}

var num: String = "1a3"

public enum ConverError: Error {
    case invalidInput(Character)
    case success
}

func toInt(num: String) throws -> Int {
    var sum = 0
    for ch in num {
        let val: Int? = Int(String(ch))
        if let val = val {
            sum = sum * 10 + val
        } else {
            throw ConverError.invalidInput(ch)
        }
    }
    return sum
}

class TreeNode {
    public var left: TreeNode?
    public var right: TreeNode?
    public var val: Int = 0
    
    public init() {
        val = -1
        left = nil
        right = nil
    }
    
    public init(val: Int) {
        self.val = val
    }
    
    public init(val: Int, left:TreeNode?, right: TreeNode?) {
        self.val =  val
        self.left = left
        self.right = right
    }
}

class ListNode {
    var val: Int =  -1
    var next: ListNode?
    
    init(val: Int) {
        self.val = val
        self.next = nil
    }
    
    init(val: Int, next: ListNode?) {
        self.val = val
        self.next = next
    }
}

func createTree() -> TreeNode {
    let leftleft = TreeNode(val: 3)
    let leftright = TreeNode(val: 4)
    let left = TreeNode(val: 5, left: leftleft, right: leftright)
    
    let rightleft = TreeNode(val: 7)
    let rightright = TreeNode(val: 8)
    let right = TreeNode(val: 6, left: rightleft, right: rightright)
    let root = TreeNode(val: 10, left: left, right: right)
    return root
}


func getDepth(root: TreeNode?) -> Int {
    if root == nil {
        return 0
    }
    let left = getDepth(root: root?.left)
    let right = getDepth(root: root?.right)
    return max(left, right) + 1
}

func levelPrint(root: TreeNode?) {
    guard let root = root else { return }
    
    var stack: [TreeNode] = [ root ]
    while !stack.isEmpty {
        let curr: TreeNode = stack.removeFirst()
        print("curr =", curr.val)
        if let left = curr.left {
            stack.append(left)
        }
        if let right = curr.right {
            stack.append(right)
        }
    }
}

var root = createTree()
levelPrint(root: root);
print("-------")

// 最近公共祖先
func lowCommonParents(root: TreeNode?, p: TreeNode?, q: TreeNode?) -> TreeNode? {
    if root == nil || p === root || q === root {
        return root
    }
    
    let lef = lowCommonParents(root: root?.left, p: p, q: q)
    let rig = lowCommonParents(root: root?.right, p: p, q: q)
    
    if lef != nil && rig != nil {
        return root
    }
    
    return lef != nil ? lef : rig
}

func addStrings(_ num1: String, _ num2: String) -> String {
    
    var length1 = num1.count
    var length2 = num2.count
    var i = length1 - 1, j = length2 - 1
    
    var chars1 = Array(num1)
    var chars2 = Array(num2)
    let zero: Character = "0"
    var carry: Int = 0
    
    var res = ""
    while i >= 0 || j >= 0 {
        var a = chars1[i]
        var b = chars2[j]
        
        let m = i >= 0 ? chars1[i].asciiValue! - zero.asciiValue! : 0
        let n = j >= 0 ? chars2[j].asciiValue! - zero.asciiValue! : 0
        
        var sum = Int(m) + Int(n) + carry
        carry = sum / 10
        res = String(sum % 10) + res
    }
    
    if carry == 1 {
        res = "1" + res
    }
    
    return res
}


func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
    guard let root = root else {
        return false
    }
    
    if root.left == nil && root.left == nil {
        return root.val == targetSum
    } else {
        return hasPathSum(root.left, targetSum - root.val) || hasPathSum(root.right, root.val)
    }
}

func hasCycle(_ head: ListNode?) -> Bool {
    guard let head = head else {
        return false
    }
    
    var slow: ListNode? = head
    var fast: ListNode? = head
    
    while fast != nil && fast?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
        if slow === fast {
            return true
        }
    }
    return false
}

func detectCycle(_ head: ListNode?) -> ListNode? {
    guard let head = head else {
        return nil
    }
    
    var slow: ListNode? = head
    var fast: ListNode? = head
    
    while fast != nil && fast?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
        if slow === fast {
            break
        }
    }
    if fast == nil || fast?.next == nil {
        return nil
    }
    
    fast = head
    while fast !== slow {
        fast = fast?.next
        slow = slow?.next
    }
    return fast
}

func findMin(_ nums: [Int]) -> Int {
    var left = 0
    var right = nums.count - 1
    
    while left < right {
        var mid = left + (right - left)/2
        if nums[mid] == nums[right] {
            right = mid
        } else if nums[mid] > nums[right] {
            left = mid + 1
        } else {
            right -= 1
        }
    }
    return nums[left]
    
    
}










