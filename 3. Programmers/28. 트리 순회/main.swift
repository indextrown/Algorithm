//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 10/25/25.
//

import Foundation

/*
func preOrderOne(nodes: [Int], idx: Int) -> String {
    if idx >= 1 && idx < nodes.count {
        var ret = String(nodes[idx-1]) + " "
        ret += preOrder(nodes: nodes, idx: idx * 2)
        ret += preOrder(nodes: nodes, idx: idx * 2 + 1)
        return ret
    }
    return ""
}
 */

func preOrder(nodes: [Int], idx: Int) -> String {
    if idx < nodes.count {
        var ret = String(nodes[idx]) + " "
        ret += preOrder(nodes: nodes, idx: idx * 2 + 1)
        ret += preOrder(nodes: nodes, idx: idx * 2 + 2)
        return ret
    }
    return ""
}

func inOrder(nodes: [Int], idx: Int) -> String {
    if idx < nodes.count {
        var ret = inOrder(nodes: nodes, idx: idx * 2 + 1)
        ret += String(nodes[idx]) + " "
        ret += inOrder(nodes: nodes, idx: idx * 2 + 2)
        return ret
    }
    return ""
}

func postOrder(nodes: [Int], idx: Int) -> String {
    if idx < nodes.count {
        var ret = postOrder(nodes: nodes, idx: idx * 2 + 1)
        ret += postOrder(nodes: nodes, idx: idx * 2 + 2)
        ret += String(nodes[idx]) + " "
        return ret
    }
    return ""
}

func solution(_ nodes: [Int]) -> [String] {
    var answer: [String] = []
    let preOrder = preOrder(nodes: nodes, idx: 0).trimmingCharacters(in: .whitespaces)
    let inOrder = inOrder(nodes: nodes, idx: 0).trimmingCharacters(in: .whitespaces)
    let postOrder = postOrder(nodes: nodes, idx: 0).trimmingCharacters(in: .whitespaces)
    answer.append(contentsOf: [preOrder, inOrder, postOrder])
    print(answer)
    return answer
}

func printSolution(_ arr: [String]) {
    // print(arr.joined(separator: " "))
    print("Preorder :", arr[0])
    print("Inorder  :", arr[1])
    print("Postorder:", arr[2])
}

func play() {
    printSolution(solution([1, 2, 3, 4, 5, 6, 7]))
}

play()



