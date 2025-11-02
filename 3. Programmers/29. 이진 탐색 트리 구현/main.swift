//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 11/3/25.
//

/*
 [시간 복잡도]
 N: lst 길이
 M: search_list 길이
 lst길이(N)만큼 삽입하고 search_lst길이(M)만큼 탐색한다
 삽입 N개 = N * O(logN) or N * O(N)
 탑색 M개 = M * O(logN) or M * O(N)
 
 삽입 + 탐색
 - 균형트리 = O((N+M)logN)
 - 편항트리 = O(N*(N+M))
    - N이 M보다 훨씬 크다면 M을 무시할 수 있으므로 시간 복잡도는 O(N^2)이다
 
 [참고]
 이진 탐색 트리의 삽입 및 탐색 연산은 최악의 경우 O(N), 군형 잡힌 경우는 O(logN)에 끝난다
 균형 잡힌 이진 탐색트리의 탐색, 연산: O(logN)
 편향 이진 탐색 트리의 삽입, 탐색, 연산 O(n)
 
 [삽입 연산]
 - 루트에서 삽입될 위치까지 내려가는 깊이(depth)에 비례한다
 - 균형트리면 매번 절반씩 줄어들어 시간복잡도가            평균 O(logn)
 - 편향트리면 한쪽으로만 계속 붙어서(ex) 정렬된 데이터 삽입) 최악 O(n)
 
 [탐색 연산]
 - 삽입처럼 트리의 깊이만큼 내려감
 - 균형 트리 평균 O(logn)
 - 편향 트리 최악 O(n)
 */

import Foundation

final class Node<T: Comparable> {
    var data: T
    var leftChild: Node?
    var rightChild: Node?
    
    init(data: T) {
        self.data = data
    }
}

final class BinaryTree<T: Comparable> {
    var root: Node<T>?
    
    // MARK: - Insert
    // 실제 삽입을 담당하는 재귀 함수
    func insertNode(node: Node<T>?, data: T) -> Node<T> {
        
        guard let node = node else {
            return Node(data: data)
        }
        
        if data < node.data {
            node.leftChild = insertNode(node: node.leftChild,
                                        data: data)
        } else {
            node.rightChild = insertNode(node: node.rightChild, data: data)
        }
        
        return node
    }
    
    // 사용자가 호출하는 외부 인터페이스
    func insert(data: T) {
        root = insertNode(node: root, data: data)
    }
    
    // MARK: - Search
    func search(node: Node<T>?, data: T) -> Bool {
        
        // 찾는 키 값이 없는 경우
        guard let node = node else {
            return false
        }
        
        // 이진 탐색 트리에서 키 값을 찾은 경우
        if node.data == data {
            return true
        }
        
        // 아직 값을 못 찾았다면 현재 노드 깂과 data를 비교해서 탐색할 노드 결정
        return data < node.data ?
        search(node: node.leftChild, data: data) :
        search(node: node.rightChild, data: data)
    }
}

func solution(_ lst: [Int], _ search_list: [Int]) -> [Bool] {
    var result: [Bool] = []
    
    let tree = BinaryTree<Int>()
    lst.forEach { tree.insert(data: $0) }
    search_list.forEach { result.append(tree.search(node: tree.root, data: $0)) }
    return result
}

let result1 = solution([5, 3, 8, 4, 2, 1, 7, 10], [1, 2, 5, 6])
let result2 = solution([1, 3, 5, 7, 9], [2, 4, 6, 8, 10])

print(result1)
print(result2)


// MARK: - https://jeonyeohun.tistory.com/328
extension Node {
    var asString:String { return treeString(self){("\($0.data)",$0.leftChild,$0.rightChild)}  }
}

public func treeString<T>(_ node:T, reversed:Bool=false, isTop:Bool=true, using nodeInfo:(T)->(String,T?,T?)) -> String
{
   // node value string and sub nodes
   let (stringValue, leftNode, rightNode) = nodeInfo(node)

   let stringValueWidth  = stringValue.count

   // recurse to sub nodes to obtain line blocks on left and right
   let leftTextBlock     = leftNode  == nil ? []
                         : treeString(leftNode!,reversed:reversed,isTop:false,using:nodeInfo)
                           .components(separatedBy:"\n")

   let rightTextBlock    = rightNode == nil ? []
                         : treeString(rightNode!,reversed:reversed,isTop:false,using:nodeInfo)
                           .components(separatedBy:"\n")

   // count common and maximum number of sub node lines
   let commonLines       = min(leftTextBlock.count,rightTextBlock.count)
   let subLevelLines     = max(rightTextBlock.count,leftTextBlock.count)

   // extend lines on shallower side to get same number of lines on both sides
   let leftSubLines      = leftTextBlock
                         + Array(repeating:"", count: subLevelLines-leftTextBlock.count)
   let rightSubLines     = rightTextBlock
                         + Array(repeating:"", count: subLevelLines-rightTextBlock.count)

   // compute location of value or link bar for all left and right sub nodes
   //   * left node's value ends at line's width
   //   * right node's value starts after initial spaces
   let leftLineWidths    = leftSubLines.map{$0.count}
   let rightLineIndents  = rightSubLines.map{$0.prefix{$0==" "}.count  }

   // top line value locations, will be used to determine position of current node & link bars
   let firstLeftWidth    = leftLineWidths.first   ?? 0
   let firstRightIndent  = rightLineIndents.first ?? 0


   // width of sub node link under node value (i.e. with slashes if any)
   // aims to center link bars under the value if value is wide enough
   //
   // ValueLine:    v     vv    vvvvvv   vvvvv
   // LinkLine:    / \   /  \    /  \     / \
   //
   let linkSpacing       = min(stringValueWidth, 2 - stringValueWidth % 2)
   let leftLinkBar       = leftNode  == nil ? 0 : 1
   let rightLinkBar      = rightNode == nil ? 0 : 1
   let minLinkWidth      = leftLinkBar + linkSpacing + rightLinkBar
   let valueOffset       = (stringValueWidth - linkSpacing) / 2

   // find optimal position for right side top node
   //   * must allow room for link bars above and between left and right top nodes
   //   * must not overlap lower level nodes on any given line (allow gap of minSpacing)
   //   * can be offset to the left if lower subNodes of right node
   //     have no overlap with subNodes of left node
   let minSpacing        = 2
   let rightNodePosition = zip(leftLineWidths,rightLineIndents[0..<commonLines])
                           .reduce(firstLeftWidth + minLinkWidth)
                           { max($0, $1.0 + minSpacing + firstRightIndent - $1.1) }


   // extend basic link bars (slashes) with underlines to reach left and right
   // top nodes.
   //
   //        vvvvv
   //       __/ \__
   //      L       R
   //
   let linkExtraWidth    = max(0, rightNodePosition - firstLeftWidth - minLinkWidth )
   let rightLinkExtra    = linkExtraWidth / 2
   let leftLinkExtra     = linkExtraWidth - rightLinkExtra

   // build value line taking into account left indent and link bar extension (on left side)
   let valueIndent       = max(0, firstLeftWidth + leftLinkExtra + leftLinkBar - valueOffset)
   let valueLine         = String(repeating:" ", count:max(0,valueIndent))
                         + stringValue
   let slash             = reversed ? "\\" : "/"
   let backSlash         = reversed ? "/"  : "\\"
   let uLine             = reversed ? "¯"  : "_"
   // build left side of link line
   let leftLink          = leftNode == nil ? ""
                         : String(repeating: " ", count:firstLeftWidth)
                         + String(repeating: uLine, count:leftLinkExtra)
                         + slash

   // build right side of link line (includes blank spaces under top node value)
   let rightLinkOffset   = linkSpacing + valueOffset * (1 - leftLinkBar)
   let rightLink         = rightNode == nil ? ""
                         : String(repeating:  " ", count:rightLinkOffset)
                         + backSlash
                         + String(repeating:  uLine, count:rightLinkExtra)

   // full link line (will be empty if there are no sub nodes)
   let linkLine          = leftLink + rightLink

   // will need to offset left side lines if right side sub nodes extend beyond left margin
   // can happen if left subtree is shorter (in height) than right side subtree
   let leftIndentWidth   = max(0,firstRightIndent - rightNodePosition)
   let leftIndent        = String(repeating:" ", count:leftIndentWidth)
   let indentedLeftLines = leftSubLines.map{ $0.isEmpty ? $0 : (leftIndent + $0) }

   // compute distance between left and right sublines based on their value position
   // can be negative if leading spaces need to be removed from right side
   let mergeOffsets      = indentedLeftLines
                           .map{$0.count}
                           .map{leftIndentWidth + rightNodePosition - firstRightIndent - $0 }
                           .enumerated()
                           .map{ rightSubLines[$0].isEmpty ? 0  : $1 }


   // combine left and right lines using computed offsets
   //   * indented left sub lines
   //   * spaces between left and right lines
   //   * right sub line with extra leading blanks removed.
   let mergedSubLines    = zip(mergeOffsets.enumerated(),indentedLeftLines)
                           .map{ ( $0.0, $0.1, $1 + String(repeating:" ", count:max(0,$0.1)) ) }
                           .map{ $2 + String(rightSubLines[$0].dropFirst(max(0,-$1))) }

   // Assemble final result combining
   //  * node value string
   //  * link line (if any)
   //  * merged lines from left and right sub trees (if any)
   let treeLines = [leftIndent + valueLine]
                 + (linkLine.isEmpty ? [] : [leftIndent + linkLine])
                 + mergedSubLines

   return (reversed && isTop ? treeLines.reversed(): treeLines)
          .joined(separator:"\n")
}
