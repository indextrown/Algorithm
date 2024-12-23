//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 12/21/24.
//

import Foundation

/*
   MARK: - inout은 함수 파라미터 값을 내부에서 수정하고 수정된 값을 함수 호출자에게 반환할 수 있도록 하는 키워드다.
   - 기본적으로 swift함수 파라미터는 값복사 방식으로 전달되어 함수 내부에서 파라미터를 수정하더라도 호출자에게 영향을 주지 않는다.
   - 하지만 inout키워드를 사용하면 참조로 전달되어 호출자의 값이 수정된다
 */
func mySwap<T>(_ a: inout T, _ b: inout T) {
    let temp = a
    a = b
    b = temp
}

var a = 10
var b = 20

print(a, b)
mySwap(&a, &b)
print(a, b)
