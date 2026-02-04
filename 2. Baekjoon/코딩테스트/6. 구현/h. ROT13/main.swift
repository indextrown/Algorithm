/*
문자열 + 13
*/

import Foundation

freopen("input.txt", "r", stdin)

func encrypt(str: String) -> String {

    var result = ""
    for char in str {
        // 알파벳이 아니면 그냥 append(이모지)
        guard let ascii = char.asciiValue else { 
            result.append(char)
            continue
        }

        switch ascii {
            case 65...90: // A-Z
                let newAscii = (ascii - 65 + 13) % 26 + 65
                result.append(Character(UnicodeScalar(newAscii)))

            case 97...122: // a-z
                let newAscii = (ascii - 97 + 13) % 26 + 97
                result.append(Character(UnicodeScalar(newAscii)))
            default: 
                // 공백, 숫자, 기호는 아스키가 있어서 여기서 처리
                result.append(Character(UnicodeScalar(ascii)))
        }
    }
    return result
}

let input = readLine()! // [Substring]

for str in input {
    let result = encrypt(str: String(str))
    print(result, terminator: "")
}

