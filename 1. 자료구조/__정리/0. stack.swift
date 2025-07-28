//
//  0. stack.swift
//  Algorithm
//
//  Created by 김동현 on 3/4/25.
//

import Foundation

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

struct MyStack<T> {
    @propertyWrapper
    struct IsNonNegative {
        private var value: Int
        
        init(wrappedValue: Int) {
            self.value = wrappedValue
        }
        
        var wrappedValue: Int {
            get { value }
            set { value = max(newValue, 0) }
        }
    }
    
    final class _StackStorage {
        var buffer: [T] = []
        @IsNonNegative var count = 0
        
        func copy() -> _StackStorage {
            let newStorage = _StackStorage()
            newStorage.buffer = buffer
            newStorage.count = count
            return newStorage
        }
    }
    
    private var _storage = _StackStorage()
    
    var isEmpty: Bool {
        _storage.buffer.isEmpty
    }
    
    var peek: T? {
        _storage.buffer.last
    }
    
    var count: Int {
        _storage.count
    }
    
    mutating func push(_ value: T) {
        ensureUnique()
        _storage.count += 1
        return _storage.buffer.append(value)
    }
    
    mutating func pop() -> T? {
        ensureUnique()
        guard !_storage.buffer.isEmpty else { return nil }
        _storage.count -= 1
        return _storage.buffer.popLast()
    }
    
    private mutating func ensureUnique() {
        if !isKnownUniquelyReferenced(&_storage) {
            _storage = _storage.copy()
        }
    }
}

public struct OptimizedStack<T> {
    private var buffer: [T]
    
    public init() {
        self.buffer = []
    }
    
    public init(capacity: Int) {
        self.buffer = []
        self.buffer.reserveCapacity(capacity)
    }
    
    public var isEmpty: Bool {
        buffer.isEmpty
    }
    
    public var count: Int {
        buffer.count
    }
    
    public var peek: T? {
        buffer.last
    }
    
    public mutating func push(_ value: T) {
        buffer.append(value)
    }
    
    public mutating func pop() -> T? {
        buffer.popLast()
    }
}


func performanceTest() {
    let testCount = 100_000
    
    print("--- Custom Stack ---")
    var customStack = Stack<Int>()
    var start = CFAbsoluteTimeGetCurrent()
    for i in 0..<testCount {
        customStack.push(i)
    }
    var duration = CFAbsoluteTimeGetCurrent() - start
    print("  - Push: \(String(format: "%.4f", duration))초")
    
    start = CFAbsoluteTimeGetCurrent()
    while !customStack.isEmpty {
        _ = customStack.pop()
    }
    duration = CFAbsoluteTimeGetCurrent() - start
    print("  - Pop:  \(String(format: "%.4f", duration))초")
    
    
    
    print("--- Swift Array (as Stack) ---")
    var arrayStack: [Int] = []
    start = CFAbsoluteTimeGetCurrent()
    for i in 0..<testCount {
        arrayStack.append(i)
    }
    duration = CFAbsoluteTimeGetCurrent() - start
    print("  - Append: \(String(format: "%.4f", duration))초")
    
    start = CFAbsoluteTimeGetCurrent()
    while !arrayStack.isEmpty {
        _ = arrayStack.popLast()
    }
    duration = CFAbsoluteTimeGetCurrent() - start
    print("  - popLast: \(String(format: "%.4f", duration))초")
    
    // MARK: - MyStack<T>
    print("--- MyStack ---")
    var myStack = MyStack<Int>()
    start = CFAbsoluteTimeGetCurrent()
    for i in 0..<testCount {
        myStack.push(i)
    }
    duration = CFAbsoluteTimeGetCurrent() - start
    print("  - Push: \(String(format: "%.4f", duration))초")
    
    start = CFAbsoluteTimeGetCurrent()
    while !myStack.isEmpty {
        _ = myStack.pop()
    }
    duration = CFAbsoluteTimeGetCurrent() - start
    print("  - Pop:  \(String(format: "%.4f", duration))초")
    
    // MARK: - MyStack<T>
    print("--- OptimizedStack ---")
    var optimizedStack = OptimizedStack<Int>()
    start = CFAbsoluteTimeGetCurrent()
    for i in 0..<testCount {
        optimizedStack.push(i)
    }
    duration = CFAbsoluteTimeGetCurrent() - start
    print("  - Push: \(String(format: "%.4f", duration))초")
    
    start = CFAbsoluteTimeGetCurrent()
    while !optimizedStack.isEmpty {
        _ = optimizedStack.pop()
    }
    duration = CFAbsoluteTimeGetCurrent() - start
    print("  - Pop:  \(String(format: "%.4f", duration))초")
    
    // MARK: -
    print("--- Swift Array (with reserveCapacity) ---")
    var reservedArrayStack: [Int] = []
    reservedArrayStack.reserveCapacity(testCount)
    
    start = CFAbsoluteTimeGetCurrent()
    for i in 0..<testCount {
        reservedArrayStack.append(i)
    }
    duration = CFAbsoluteTimeGetCurrent() - start
    print("  - Append: \(String(format: "%.4f", duration))초")
    
    start = CFAbsoluteTimeGetCurrent()
    while !reservedArrayStack.isEmpty {
        _ = reservedArrayStack.popLast()
    }
    duration = CFAbsoluteTimeGetCurrent() - start
    print("  - popLast: \(String(format: "%.4f", duration))초")
}

@main
struct Main {
    static func main() {
        /*
        var mystack = Stack<Int>()
        
        mystack.push(1)
        mystack.push(2)
        mystack.push(3)
        
        while let element = mystack.pop() {
            print(element)
        }
         */
        performanceTest()
    }
}

