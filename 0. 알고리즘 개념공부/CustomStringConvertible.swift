//
//  1.swift
//  Algorithm
//
//  Created by 김동현 on 8/1/25.
//

/*
 Struct는 기본적으로 CustomStringConvertible를 따른다
 
 Class는 편의생성자가 존재한다
 https://ios-development.tistory.com/1457
 */
struct People {
    var name: String
    var age: Int
}

class People2: CustomStringConvertible {
    var description: String {
        return "People2(name: \(formatValue(name)), age: \(formatValue(age)))"
    }
    
    func formatValue(_ value: Any) -> String {
        if let stringValue = value as? String {
            return "\"\(stringValue)\"" // 문자열은 따옴표 추가
        } else {
            return "\(value)" // 그 외는 그대로
        }
    }
    
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    convenience init(name: String) {
        self.init(name: name, age: 20)
    }

}

@main
struct Main {
    static func main() {
        
        let value: Any = "Hello"
        
        if let str = value as? String {
            print("문자열입니다: \(str)")
        } else {
            print("문자열이 아닙니다.")
        }
        
        let length = (value as? String)!.count
        print(length)
        
    }
}

