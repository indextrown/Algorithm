//
//  3nplus1.swift
//  Algorithm
//
//  Created by 김동현 on 7/21/24.
//

import Foundation

@main
struct Main {
    static func main() {
        let inpfile = "1.inp"
        let oupfile = "3nplus1.out"
        
        do {
            // 입력 파일 읽기
            let inputData = try String(contentsOfFile: inpfile, encoding: .utf8)
            let lines = inputData.components(separatedBy: .newlines)
            
            var result = ""
            
            for line in lines where !line.isEmpty {
                let components = line.split(separator: " ")
                guard components.count == 2,
                      let a = Int(components[0]),
                      let b = Int(components[1]) else { continue }
                
                let x = min(a, b)
                let y = max(a, b)
                var maxCount = 0
                
                for i in x...y {
                    var n = i
                    var count = 0
                    
                    while n != 1 {
                        if n % 2 != 0 {
                            n = 3 * n + 1
                        } else {
                            n /= 2
                        }
                        count += 1
                    }
                    
                    if maxCount < count {
                        maxCount = count
                    }
                }
                
                result += "\(a) \(b) \(maxCount + 1)\n"
            }
            
            // 결과를 파일에 저장
            try result.write(toFile: oupfile, atomically: true, encoding: .utf8)
        } catch {
            print("Error: \(error)")
        }
    }
}
