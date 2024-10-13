//: [Previous](@previous)

import Foundation
import UIKit

var str = "propertyWrapper"

@propertyWrapper
struct UserDefaultWapper<T> {
    let key: String
    let defaultVal: T
    
    init(key: String, defaultVal: T) {
        self.key = key
        self.defaultVal = defaultVal
    }
    
    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultVal
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}

public class UserDefaultConfig {
    @UserDefaultWapper(key: "has_show_guide", defaultVal: false)
    static var hasShownGuide:Bool
    
    @UserDefaultWapper(key: "has_show_animated", defaultVal: false)
    static var hasShownAnimated: Bool
    
    @UserDefaultWapper(key: "original_name", defaultVal: "guotianchi")
    static var originalName: String
    
    @UserDefaultWapper(key: "age", defaultVal: 12)
    static var age: Int
}

UserDefaultConfig.hasShownGuide = false
print(UserDefaultConfig.hasShownGuide)
UserDefaultConfig.hasShownGuide = true
print(UserDefaultConfig.hasShownGuide)

UserDefaultConfig.originalName = "guo"
UserDefaultConfig.originalName = "guo2"

print(UserDefaults.standard.string(forKey: "original_name"))


//: [Next](@next)
