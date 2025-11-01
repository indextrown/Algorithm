//
//  main.swift
//  Algorithm
//
//  Created by 김동현 on 10/31/25.
//

import Foundation

//func solution(_ lst: [Int], _ search_lst: [Int]) -> [Bool] {
//    return []
//}
//
//print(solution([5, 3, 8, 4, 2, 1, 7, 10], [1, 2, 5, 6]))

/*
 https://jeonyeohun.tistory.com/328
 https://babbab2.tistory.com/90
 */


final class Node<T: Comparable> {
    let data: T
    var leftChild: Node?
    var rightChild: Node?
    
    init(data: T) {
        self.data = data
    }
}

final class BinarySearchTree<T: Comparable> {
    var root: Node<T>?
}

// MARK: - 반복
extension BinarySearchTree {
    // 반복 삽입
    func insert(_ data: T) {
        // 루트 노드가 없으면 루트를 만들고 종료
        guard let root = self.root else {
            return self.root = Node.init(data: data)
        }
        
        var currentNode = root
        while true {
            // 현재 노드보다 > 새 값 => 새 값을 왼쪽으로
            if currentNode.data > data {
                // 왼쪽 자식이 nil이면 그 자리에 새 노드 삽입 후 종료
                guard let nextNode = currentNode.leftChild else {
                    return currentNode.leftChild = Node.init(data: data)
                }
                // 왼쪽 자식이 이미 있다면 그 자식으로 이동해서 다시 비교 반복
                currentNode = nextNode
            }
            // 현재 노드 < 새 값 => 새 값을 오른쪽으로
            else {
                // 오른쪽 자식이 nil이면 그 자리에 새 노드 삽입 후 종료
                guard let nextNode = currentNode.rightChild else {
                    return currentNode.rightChild = Node.init(data: data)
                }
                // 오른쪽 자식이 이미 있다면 그 자식으로 이동해서 다시 비교 반복
                currentNode = nextNode
            }
        }
    }
}

// MARK: - 재귀
extension BinarySearchTree {
    
    // 루트부터 시작하는 외부용 재귀 삽입 메서드
    func insertRecursive(_ data: T) {
        root = insert(root, data)
    }
    
    // 재귀 삽입
    func insert(_ node: Node<T>?, _ data: T) -> Node<T> {
        guard let node = node else {
            return Node(data: data)
        }

        if data < node.data {
            node.leftChild = insert(node.leftChild, data)
        } else {
            node.rightChild = insert(node.rightChild, data)
        }
        return node
    }
}

// 반복
//let bst = BinarySearchTree<Int>()
//[5, 3, 8, 4, 2, 1, 7, 10].forEach(bst.insert)
//print(bst.root?.asString ?? "")
//
//// 재귀 삽입
//let bst2 = BinarySearchTree<Int>()
//[5, 3, 8, 4, 2, 1, 7, 10].forEach { bst2.insertRecursive($0) }
//print(bst2.root?.asString ?? "")


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
