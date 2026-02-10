/*
문자열 + 13

[배운점]
문자열을 아스키코드로 만들기 혹은 아스키코드를 문자열로 만들 수 있다
모듈러 연산을 활용해서 순환 로직을 작성할 수 있다
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

