//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 6/22/26.
//

import Foundation

class UserInfo {
    static let shared = UserInfo()
    private init() {}
    
    var id: String?
    var passward: String?
    var nickname: String?
}

func main() {
    let userInfo = UserInfo.shared
    userInfo.id = "Index"
    userInfo.passward = "1234"
    userInfo.nickname = "Index"
    
    let userInfo2 = UserInfo.shared
    print(userInfo === userInfo2) // true
}

main()
