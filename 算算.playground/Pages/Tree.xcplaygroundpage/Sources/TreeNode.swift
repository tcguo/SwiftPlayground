import Foundation

open class TreeNode {
    public var left: TreeNode?
    public var right: TreeNode?
    public var val: Int = 0
    
    public init(val: Int) {
        self.val = val
    }
    
    public init(val: Int, left:TreeNode, right: TreeNode) {
        self.left = left
        self.right = right
        self.val =  val
    }
}

public func createTree() -> TreeNode {
    let leftleft = TreeNode(val: 3)
    let leftright = TreeNode(val: 4)
    let left = TreeNode(val: 5, left: leftleft, right: leftright)
    
    let rightleft = TreeNode(val: 7)
    let rightright = TreeNode(val: 8)
    let right = TreeNode(val: 6, left: rightleft, right: rightright)
    let root = TreeNode(val: 10, left: left, right: right)
    return root
}


// BFS
public func printLayerNode(root:TreeNode?) {
    guard let root = root else {
        return
    }
    
    var stack:[TreeNode] = []
    stack.append(root)
    while (!stack.isEmpty) {
        if let firstNode = stack.first {
            print("node is \(firstNode.val)")
            stack.removeFirst()
            
            if let left = firstNode.left {
                stack.append(left)
            }
            if let right = firstNode.right {
                stack.append(right)
            }
        }
    }
}

public func levelOrder(_ root: TreeNode?) -> [[Int]] {
    var stack:[TreeNode] = []
    guard let root = root else {
        return []
    }
    stack.append(root)
    var res:[[Int]] = [];
    
    while !stack.isEmpty {
        var arr: [TreeNode] = [];
        while !stack.isEmpty {
            if let first = stack.first {
                arr.append(first)
                stack.removeFirst()
            }
        }
        var intArr: [Int] = []
        for node in arr {
            intArr.append(node.val)
            if let left = node.left {
                stack.append(left)
            }
            if let right = node.right {
                stack.append(right)
            }
        }
        res.append(intArr)

    }
    return res
}


/// 锯齿遍历
/// - Parameter root: <#root description#>
/// - Returns: <#description#>
public func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
    var stack:[TreeNode] = []
    guard let root = root else {
        return []
    }
    stack.append(root)
    var res:[[Int]] = [];
    var level = 0
    while !stack.isEmpty {
        var arr: [TreeNode] = [];
        while !stack.isEmpty {
            if let first = stack.first {
                arr.append(first)
                stack.removeFirst()
            }
        }
        
        
        var intArr: [Int] = []
        for node in arr {
            if (level % 2) != 0 {
                intArr.insert(node.val, at: 0)
            } else {
                intArr.append(node.val)
            }
            
            if let left = node.left {
                stack.append(left)
            }
            if let right = node.right {
                stack.append(right)
            }
        }
        res.append(intArr)
        
        level += 1
    }
    
    return res
}

public func inorderTraversal(_ root: TreeNode?) -> [Int] {
    var res: [Int] = []
    guard let root = root else {
        return res
    }
    
    var stack: [TreeNode] = []
    var curr: TreeNode? = root;
    while (!stack.isEmpty) || curr != nil {
        while let crr = curr {
            stack.append(crr)
            curr = crr.left
        }
        
        curr = stack.popLast()
        res.append(curr!.val)
        curr = curr?.right
    }
    
    return res
}


/// 二叉树的最近公共祖先
/// - Parameters:
///   - root: <#root description#>
///   - p: <#p description#>
///   - q: <#q description#>
/// - Returns: <#description#>
func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    
    return nil
}

public func reverseTree(root: TreeNode?) {
    
}


