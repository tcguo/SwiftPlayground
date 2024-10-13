import UIKit
import Foundation

// 别名
typealias CompletionBlock = () -> Bool
typealias ProgressBlock = (_ progress: Float) -> Bool
 
let b_millisecond = CLongLong(round(Date().timeIntervalSince1970*1000))
for i in 0...100000 {
    print(i)
}
let end_millisecond = CLongLong(round(Date().timeIntervalSince1970*1000))
print("total time is ", (end_millisecond - b_millisecond))


func download(progress: ProgressBlock?) {
    if let progress = progress {
        for i in 1...100 {
            progress(Float(i))
        }
    }
}
download { (progress:Float) in
    print("progress is ==", progress)
    return false
}



// GCD
var serialQueue = DispatchQueue(label: "com.queue")
print(Thread.current);
serialQueue.async {
    print(Thread.current);
    print("122")
}

DispatchQueue.main.async {
    print("main.async ",  Thread.current)
}

DispatchQueue.global(qos: .background).async {
    print("global.async", Thread.current)
}

var concurrentQueue = DispatchQueue(label: "com.concurrent", attributes: .concurrent)
concurrentQueue.async {

};


// NSOperation
let operationQueue = OperationQueue()
operationQueue.maxConcurrentOperationCount = 10
operationQueue.addOperation {
    print("doSomething1 block \(Thread.current)")
}
operationQueue.addOperation {
    print("doSomething2 block \(Thread.current)")
}
operationQueue.addOperation {
    print("doSomething3 block \(Thread.current)")
}
operationQueue.addOperation {
    print("doSomething4 block \(Thread.current)")
}

//创建operation
let operation = BlockOperation()
//当operation有多个任务的时候会自动分配多个线程并发执行,
//如果只有一个任务，会自动在主线程同步执行
//operation.start()
operation.addExecutionBlock { () -> Void in
    print("doSomething operation1 \(Thread.current)")
}
operation.addExecutionBlock { () -> Void in
    print("doSomething operation1 \(Thread.current)")
}
var operation2 = BlockOperation {
    sleep(1)
    print("doSomething operation2 \(Thread.current)")
}
operationQueue.addOperation(operation)
operationQueue.addOperation(operation2)

// 会阻塞当前线程，等到某个operation执行完毕
operation2.waitUntilFinished()
print("operation2 阻塞完成执行")

// 阻塞当前线程，等待queue的所有操作执行完毕
operationQueue.waitUntilAllOperationsAreFinished();
print("operationQueue 阻塞后")

//队列的取消
//当前正在处于执行状态的任务是不能够取消的,只能取消等待的任务
operationQueue.cancelAllOperations()

//队列的挂起和恢复
//当前正在处于执行状态的任务是不能够暂停的,只能暂停等待的任务
operationQueue.isSuspended = true    //暂停队列
operationQueue.isSuspended = false  //恢复队列








