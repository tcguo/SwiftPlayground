import UIKit


/**
 异步函数， swift5.5更新
 */

/**
 要标记对应函数或者方法是异步的，你在声明中形式参数的后面使用 async  关键字， 和你使用 throw  关键字一样。如果函数或者方法返回值，就把 async  写在返回箭头（ -> ）之前
 */



//func listPhotos(inGallery name: String) async -> [String] {
//    // ... some asynchronous networking code ...
//    let result = []
//    return result
//}


/**
 Task.sleep(_:) 在学习并发如何工作时很好用。这个方法什么都不做，只是在返回前等待照少给定数量的微秒。这里有一个使用 sleep() 来模拟等待网络任务的 listPhotos(inGallery:) 版本：
 */


//func listPhotos(inGallery name: String) async -> [String] {
//    await Task.sleep(2 * 1_000_000_000)  // Two seconds
//    return ["IMG001", "IMG99", "IMG0404"]
//}
