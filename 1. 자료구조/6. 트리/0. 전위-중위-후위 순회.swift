//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 11/3/25.
//

import Foundation
freopen("input.txt", "r", stdin)

// MARK: - Node 클래스 정의
final class Node {
    let value: Character
    var left: Node?
    var right: Node?
    
    init(_ value: Character) {
        self.value = value
    }
}

// MARK: - 트리 구성
let n = Int(readLine()!)!
var nodes: [Character: Node] = [:]

// 입력으로 트리 구성
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Character(String($0)) }
    let rootVal = input[0]
    let leftVal = input[1]
    let rightVal = input[2]
    
    // 노드 없으면 생성
    if nodes[rootVal] == nil {
        nodes[rootVal] = Node(rootVal)
    }
    
    // 왼쪽 자식
    if leftVal != "." {
        if nodes[leftVal] == nil { nodes[leftVal] = Node(leftVal) }
        nodes[rootVal]?.left = nodes[leftVal]
    }
    
    // 오른쪽 자식
    if rightVal != "." {
        if nodes[rightVal] == nil { nodes[rightVal] = Node(rightVal) }
        nodes[rootVal]?.right = nodes[rightVal]
    }
}

// 루트는 항상 A
let root = nodes["A"]!

// MARK: - 순회
func preorder(_ node: Node?) {
    guard let node = node else { return }
    print(node.value, terminator: "")
    preorder(node.left)
    preorder(node.right)
}

func inorder(_ node: Node?) {
    guard let node = node else { return }
    inorder(node.left)
    print(node.value, terminator: "")
    inorder(node.right)
}

func postorder(_ node: Node?) {
    guard let node = node else { return }
    postorder(node.left)
    postorder(node.right)
    print(node.value, terminator: "")
}

// 출력
preorder(root); print()
inorder(root); print()
postorder(root); print()
