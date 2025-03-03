//
//  0. stack.swift
//  Algorithm
//
//  Created by 김동현 on 3/4/25.
//

struct Stack<T> {
    private var stack: [T] = []
    
    var count: Int {
        return stack.count
    }
    
    var isEmpty: Bool {
        return stack.isEmpty
    }
    
    var peek: T? {
        return stack.last
    }
    
    mutating func push(_ element: T) {
        stack.append(element)
    }
    
    mutating func pop() -> T? {
        return stack.popLast()
    }
}

@main
struct Main {
    static func main() {
        var mystack = Stack<Int>()
        
        mystack.push(1)
        mystack.push(2)
        mystack.push(3)
        
        while let element = mystack.pop() {
            print(element)
        }
    }
}
