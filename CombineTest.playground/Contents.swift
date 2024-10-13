//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import Combine

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        
        view.addSubview(label)
        self.view = view

        testSubject()
    }

    func testSubject() {
        let relay = PassthroughSubject<String, Never>()
        let subscription = relay
            .sink { value in
                print("subscription1 received value: \(value)")
        }

        relay.send("Hello")
        relay.send("World!")
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
