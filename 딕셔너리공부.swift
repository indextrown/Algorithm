//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 2/2/25.
//

var dic = [
    "index": 26,
    "jito": 27
]

// key, value
for (key, value) in dic {
    print(key, value)
}

// key
for key in dic.keys {
    print(key)
}

// value
for key in dic.keys {
    print(dic[key]!)
}

// value
for value in dic.values {
    print(value)
}
 
