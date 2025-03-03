//
//  2178. 미로탐색.swift
//  Algorithm
//
//  Created by 김동현 on 7/26/24.
//

import Foundation

@main
struct Main {
    static func main() {
        // 파일 경로 설정 (input.txt 파일이 현재 작업 디렉토리에 있다고 가정)
        let filePath = "input.txt"
        
        // 파일 내용 읽기
        do {
            // 파일 데이터를 읽어 문자열로 변환
            let content = try String(contentsOfFile: filePath, encoding: .utf8)
            // 문자열을 공백과 줄바꿈을 기준으로 나누어 배열로 변환
            let input = content.split { $0.isWhitespace || $0.isNewline }.map { String($0) }
            
            if input.count >= 2 {
                if let N = Int(input[0]), let M = Int(input[1]) {
                    // N과 M 출력
                    print(N, M)
                } else {
                    print("정수로 변환할 수 없습니다.")
                }
            } else {
                print("파일 내용이 충분하지 않습니다.")
            }
        } catch {
            print("파일을 열 수 없습니다: \(error)")
        }
    }
}
