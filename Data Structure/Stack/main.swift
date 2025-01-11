//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 12/23/24.
//

/*
 Swift에서 struct, enumdms 기본적으로 값타입이다.
 값타입은 객체를 복사해서 전달하므로, Swift는 기본적으로 값 타입의 인스턴스를 수정할 수 없도록 막아둔다.
 하지만 구조체나 열거형에서 값을 수정하고 싶을 때 mutating키워드를 사용한다
 
 MARK: - 예시
 - Point라는 값 타입의 구조체에서 프로퍼티를 수정하는 동작이 허용되지 않아서 에러가 발생한다.
 - 값 타입이 기본적으로 변경되지 않는다고 가정하므로 x, y를 변경하려면 mutating 키워드로 수정 가능성을 명시해야 한다.
 struct Point {
     var x: Int
     var y: Int

     func moveBy(dx: Int, dy: Int) {
         x += dx // ❌ 에러 발생
         y += dy // ❌ 에러 발생
     }
 }

 
 */

import Foundation

// https://conandevdaily.tistory.com/30
// https://nasneyland.tistory.com/11

// MARK: - 사용자 정의
struct Stack<T>: Sequence {
    private var elements: [T] = []
    
    // 스택이 비어있는지
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    // 데이터 추가
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    // 데이터 추출
    mutating func pop() -> T? {
        return isEmpty ? nil : elements.popLast()
    }
    
    // 상단 데이터 반환
    func peek() -> T? {
        return elements.last
    }
    
    // 스택의 크기 반환
    var count: Int {
        return elements.count
    }
    
    // Sequence 프로토콜 준수를 위한 makeIterator 메서드 구현
    func makeIterator() -> IndexingIterator<[T]> {
        return elements.makeIterator()
    }
    
    
}

var stack = Stack<Int>()
stack.push(10)
stack.push(20)
stack.push(30)

// print(stack.pop()!)
// print(stack.pop()!)
// print(stack.pop()!)

// MARK: - Array방식
var arrStack = [Int]()
arrStack.append(1)
arrStack.append(2)

// print(arrStack.popLast() ?? 0)   // pop
// print(arrStack.last ?? 0)        // peek

