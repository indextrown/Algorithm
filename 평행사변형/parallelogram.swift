//
//  평행사변형.swift
//  Algorithm
//
//  Created by 김동현 on 7/19/24.
//

import Foundation


struct Point {
    var x: Int
    var y: Int
    
    static func compare(_ a: Point, _ b: Point) -> Bool {
        return a.x < b.x
    }

    static func distanceSquared(_ a: Point, _ b: Point) -> Int {
        return (b.x - a.x) * (b.x - a.x) + (b.y - a.y) * (b.y - a.y)
    }
}


@main
struct Main {
    static func main() {
        let inpfile = "1.inp"
        let outfile = "parallelogram.out"

        var points: [Point] = []

        do {
            let input = try String(contentsOfFile: inpfile, encoding: .utf8)
            let lines = input.components(separatedBy: .newlines)
            var output = ""

            for line in lines {
                if line.isEmpty { continue }
                let values = line.split(separator: " ").map { Int($0)! }
                for i in 0..<4 {
                    points.append(Point(x: values[2 * i], y: values[2 * i + 1]))
                }

                // 기저사례
                if points.allSatisfy({ $0.x == 0 && $0.y == 0 }) { break }

                // x좌표 기준 오름차순 정렬
                points.sort(by: Point.compare)

                let d1 = Point.distanceSquared(points[0], points[1])
                let d2 = Point.distanceSquared(points[2], points[3])
                let d3 = Point.distanceSquared(points[0], points[2])
                let d4 = Point.distanceSquared(points[1], points[3])

                if d1 == d2 && d3 == d4 {
                    output += "1\n"
                } else {
                    output += "0\n"
                }

                points.removeAll()
            }

            try output.write(toFile: outfile, atomically: true, encoding: .utf8)
        } catch {
            print("An error occurred: \(error)")
        }
    }
}
