//
//  test.swift
//  Algorithm
//
//  Created by 김동현 on 8/1/25.
//

import Foundation

class Point {
    var x: Double
    var y: Double

    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
}

func test() {
    let point1 = Point(x: 0, y: 0)
    let point2 = Point(x: 0, y: 0)
    print(point1.x) // 중단점(Breakpoint) 걸기
    print(point2.x)
}


@main
struct Main {
    static func main() {
        test()
    }
}
