//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 11/3/25.
//

import Foundation
freopen("input.txt", "r", stdin)

// 전위 순회
func preorder(node: Character?) {
    guard let node = node else { return }
    print(node, terminator: "")
    preorder(node: tree[node]?.0)
    preorder(node: tree[node]?.1)
}

// 중위 순회
func inorder(node: Character?) {
    guard let node = node else { return }
    inorder(node: tree[node]?.0)
    print(node, terminator: "")
    inorder(node: tree[node]?.1)
}

// 후위 순회
func postorder(node: Character?) {
    guard let node = node else { return }
    postorder(node: tree[node]?.0)
    postorder(node: tree[node]?.1)
    print(node, terminator: "")
}

let n = Int(readLine()!)!
var tree: [Character: (Character?, Character?)] = [:]

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Character(String($0)) }
    let root = input[0]
    let left = input[1] == "." ? nil : input[1]
    let right = input[2] == "." ? nil : input[2]
    tree[root] = (left, right)
}

preorder(node: "A"); print()
inorder(node: "A"); print()
postorder(node: "A"); print()




