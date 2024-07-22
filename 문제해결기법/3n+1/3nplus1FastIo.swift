//
//  test.swift
//  Algorithm
//
//  Created by 김동현 on 7/22/24.
//

import Foundation

final class FileIO {
    private let buffer: [UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle) {
        buffer = Array(try! fileHandle.readToEnd()!) + [UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }

    @inline(__always) private func read() -> UInt8 {
        guard index < buffer.count else { return 0 }
        defer { index += 1 }
        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now - 48)
            now = read()
        }
        return sum * (isPositive ? 1 : -1)
    }

    @inline(__always) func readString() -> String {
        var now = read()
        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index - 1
        while now != 10, now != 32, now != 0 { now = read() }
        return String(bytes: Array(buffer[beginIndex..<(index - 1)]), encoding: .ascii)!
    }

    @inline(__always) func readByteSequenceWithoutSpaceAndLineFeed() -> [UInt8] {
        var now = read()
        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        let beginIndex = index - 1
        while now != 10, now != 32, now != 0 { now = read() }
        return Array(buffer[beginIndex..<(index - 1)])
    }
}

@main
struct Main {
    static func main() {
        // 파일 핸들을 이용하여 FileIO 객체 생성
        guard let inputFileHandle = FileHandle(forReadingAtPath: "1.inp") else {
            print("Error: Unable to open input file")
            return
        }
        let fileIO = FileIO(fileHandle: inputFileHandle)

        var result = ""

        // 입력 처리
        while true {
            let a = fileIO.readInt()
            let b = fileIO.readInt()
            if a == 0 && b == 0 { break } // 입력 종료 조건

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
                        n >>= 1
                    }
                    count += 1
                }

                if maxCount < count {
                    maxCount = count
                }
            }

            result += "\(a) \(b) \(maxCount + 1)\n"
        }

        // 입력 파일 닫기
        inputFileHandle.closeFile()

        // 결과를 파일에 저장
        let oupfile = "3nplus1.out"
        do {
            try result.write(toFile: oupfile, atomically: true, encoding: .utf8)
        } catch {
            print("Error: Unable to write output file")
        }
    }
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//import Foundation
// 
//
//class FileReader {
//    let fileHandle: FileHandle
//    let buffer: Data
//    var offset = 0
//    let encoding: String.Encoding
//
//    init?(_ path: String, encoding: String.Encoding = .utf8) {
//        guard let fileHandle = FileHandle(forReadingAtPath: path) else { return nil }
//        self.fileHandle = fileHandle
//        self.buffer = fileHandle.readDataToEndOfFile()
//        self.encoding = encoding
//    }
//
//    var isEOF: Bool {
//        return offset >= buffer.count
//    }
//
//    func readLine() -> String? {
//        guard !isEOF else { return nil }
//
//        var lineEnd = offset
//        while lineEnd < buffer.count && buffer[lineEnd] != 10 && buffer[lineEnd] != 13 { // 10 is \n, 13 is \r
//            lineEnd += 1
//        }
//
//        let lineData = buffer[offset..<lineEnd]
//        offset = lineEnd + 1
//        if offset < buffer.count && buffer[offset] == 10 {
//            offset += 1
//        }
//
//        return String(data: lineData, encoding: encoding)
//    }
//}
//
//class FileWriter {
//    let fileHandle: FileHandle
//
//    init?(_ path: String) {
//        guard FileManager.default.createFile(atPath: path, contents: nil, attributes: nil) else { return nil }
//        guard let fileHandle = FileHandle(forWritingAtPath: path) else { return nil }
//        self.fileHandle = fileHandle
//    }
//
//    func write(_ string: String) {
//        if let data = string.data(using: .utf8) {
//            fileHandle.write(data)
//        }
//    }
//
//    deinit {
//        fileHandle.closeFile()
//    }
//}
//
//
//@main
//struct Main {
//    static func main() {
//        let inpfile = FileReader("1.inp")!
//        
//        // 파일 내용 출력
//        while !inpfile.isEOF {
//            if let line = inpfile.readLine() {
//                print(line)
//            }
//        }
//    }
//}
//
//

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//guard let inpfile = FileReader(inpfilePath) else {
//    print("Failed to open input file: \(inpfilePath)")
//    return
//}
//
//guard let outfile = FileWriter(outfilePath) else {
//    print("Failed to open output file: \(outfilePath)")
//    return
//}

// 여기에 결과를 작성하고 outfile.write를 사용하여 파일에 씁니다.
// 예시:
// outfile.write("결과 내용")
