//
//  0.구조체.swift
//  Algorithm
//
//  Created by 김동현 on 8/2/25.
//

import Foundation

struct Student {
    var name: String
    var age: Int
    var gpa: Double
}

typealias People = Student



@main
struct Main {
    static func main() {
        let student = People(name: "Index",
                             age: 26,
                             gpa: 4.5)
        print(student)
    }
}
