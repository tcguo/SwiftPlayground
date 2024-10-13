import UIKit


func testBarrier() {
    let queue = DispatchQueue.global()
    queue.async {
        print("1")
    }

    queue.async {
        print("2")
    }

    let write = DispatchWorkItem(flags: .barrier) {
        print("bar==\(Thread.current)")
    }

    queue.async(execute: write)


    queue.async {
        print("3")
    }

    queue.async {
        print("4")
    }
}

func testSemaphore() {
    let queue = DispatchQueue.global()
    let sem = DispatchSemaphore(value: 0)
    queue.asyncAfter(deadline: DispatchTime.now() + 2) {
        sem.signal()
    }
    sem.wait(timeout: .distantFuture)
    print("pk");
}

func testGCD() {
    // 创建并行队列
    let queue = DispatchQueue(label: "test", qos: .default, attributes: .concurrent, autoreleaseFrequency: .inherit, target: nil)
    
    let group = DispatchGroup()
    print("begin=\(Thread.current)")
    
    queue.async(group: group, qos: .default, flags: .inheritQoS) {
        Thread.sleep(forTimeInterval: 5)
        print("1=====\(Thread.current)")
    }
    
    queue.async(group: group, qos: .default, flags: .inheritQoS) {
        Thread.sleep(forTimeInterval: 7)
        print("2=====\(Thread.current)")
    }
    
    queue.async(group: group, qos: .default, flags: .inheritQoS) {
        Thread.sleep(forTimeInterval: 5)
        print("3=====\(Thread.current)")
    }
    
    queue.async(group: group, qos: .default, flags: .inheritQoS) {
        Thread.sleep(forTimeInterval: 7)
        print("4=====\(Thread.current)")
    }
    
    group.wait()
    
    queue.async(group: group, qos: .default, flags: .inheritQoS) {
        Thread.sleep(forTimeInterval: 7)
        print("5=====\(Thread.current)")
    }
    
    group.notify(queue: DispatchQueue.main) {
        print("notify\(Thread.current)")
    }
    
    print("end===\(Thread.current)")
}



func testMain() {
    testGCD()
}

testMain()







