//
//  test.swift
//  Algorithm
//
//  Created by 김동현 on 7/22/24.
//

import Foundation
 

class FileReader {
    let fileHandle: FileHandle
    let buffer: Data
    var offset = 0
    let encoding: String.Encoding

    init?(_ path: String, encoding: String.Encoding = .utf8) {
        guard let fileHandle = FileHandle(forReadingAtPath: path) else { return nil }
        self.fileHandle = fileHandle
        self.buffer = fileHandle.readDataToEndOfFile()
        self.encoding = encoding
    }

    var isEOF: Bool {
        return offset >= buffer.count
    }

    func readLine() -> String? {
        guard !isEOF else { return nil }

        var lineEnd = offset
        while lineEnd < buffer.count && buffer[lineEnd] != 10 && buffer[lineEnd] != 13 { // 10 is \n, 13 is \r
            lineEnd += 1
        }

        let lineData = buffer[offset..<lineEnd]
        offset = lineEnd + 1
        if offset < buffer.count && buffer[offset] == 10 {
            offset += 1
        }

        return String(data: lineData, encoding: encoding)
    }
}

class FileWriter {
    let fileHandle: FileHandle

    init?(_ path: String) {
        guard FileManager.default.createFile(atPath: path, contents: nil, attributes: nil) else { return nil }
        guard let fileHandle = FileHandle(forWritingAtPath: path) else { return nil }
        self.fileHandle = fileHandle
    }

    func write(_ string: String) {
        if let data = string.data(using: .utf8) {
            fileHandle.write(data)
        }
    }

    deinit {
        fileHandle.closeFile()
    }
}


@main
struct Main {
    static func main() {
        let inpfile = FileReader("1.inp")!
        
        // 파일 내용 출력
        while !inpfile.isEOF {
            if let line = inpfile.readLine() {
                print(line)
            }
        }
    }
}





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
