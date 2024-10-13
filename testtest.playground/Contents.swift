import UIKit



var array: [Int] = [1]

var add = Double((Float(array.count) / 2).rounded(.up))
print(add)

class SS {
    var name: String
    init(name: String) {
        self.name = name
    }
}
var me = SS.init(name: "22")
var arrddd: [SS] = []
arrddd.append(me)
arrddd.append(me)

print(arrddd)

var arr1 = [1, 2]
var arr2 = [3, 2]
var arr3:[Int] = []
var arr4 = arr1 + arr2 + arr3

print(arr4)


/*

//项目工程
// 数据结构
// key code

class classNode {
    var refs = [classNode]()
    var name = "classname"
}

public func main_enter() {
    var classList:[classNode] = findAllClass(path: "use/project/yitian")
    
    // 多线程
    for item in classList {
        var refs =  findRefList(node: item)
        var hasCycle = detecterCycle(node: refs)
        if !hasCycle {
            continue
        }
        writeLog(node: item)
    }
}

func findAllClass(path: String) -> [classNode] {
    return []
}

func findRefList(node: classNode) -> [classNode] {
    var res = [classNode]()
    for node in node.refs {
        if node.refs.count > 0 {
            findRefList(node: node)
        }
    }
    return res
}

func detecterCycle(node: [classNode]) -> Bool {
    
    return true
}

func writeLog(node: classNode) {
    //
    print("")
}

*/
















