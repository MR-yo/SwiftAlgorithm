//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 一只皮卡丘 on 2018/5/10.
//  Copyright © 2018年 一只皮卡丘. All rights reserved.
//

import Foundation

/**
 * 心得总结
 * 1.函数必须对参数进行验证
 * 2.尽可能考虑所有边界情况
 */


/** 链表相关 */
var myList = List(count: 9)
//myList.reversePrintList1(listHead: myList.head)
//myList.reversePrintList2(listHead: myList.head)

var testNode = myList.head?.next?.next
//myList.deleteNode(node: &testNode)
//myList.printList()

//myList.reverseList1(headNode: myList.head!)
//myList.reverseList2(headNode: myList.tail!)

var mergeListNode = mergeTwoList(firstNode: myList.head, secondNode: testNode)

/** 二叉树相关 */
var rootTreeNode = TreeNode(value: 0)

var treeNode1 = TreeNode(value: 1)
var treeNode2 = TreeNode(value: 2)
var treeNode3 = TreeNode(value: 3)
var treeNode4 = TreeNode(value: 4)
var treeNode5 = TreeNode(value: 5)
var treeNode6 = TreeNode(value: 6)
var treeNode7 = TreeNode(value: 7)
rootTreeNode.leftNode = treeNode1
rootTreeNode.rightNode = treeNode2
treeNode1.leftNode = treeNode3
treeNode3.leftNode = treeNode4
treeNode2.leftNode = treeNode5
treeNode2.rightNode = treeNode6
treeNode5.rightNode = treeNode7

var anotherTree = TreeNode(value: 7)
anotherTree.leftNode = TreeNode(value: 8)
anotherTree.rightNode = TreeNode(value: 9)


rootTreeNode.printPreorder(treeNode: rootTreeNode)
print("---------")

let isChild = judgeTreeA(rootTreeNode, hasChildB: anotherTree)
print("isChild = " + String(isChild))



/** 数组相关 */
var arrayTest1 = [1,2,3,3,3,4,4,5]
print(removeDuplicates(&arrayTest1))

var arrayTest2 = [7,1,5,3,6,4]
let x = maxProfit(arrayTest2)
print(x)

var arrayTest3 = [1,2,2,3,3]
rotate1(&arrayTest3, 3)

let s = singleNumber(arrayTest3)
print(s)


let a : [[Character]] = [[".",".",".",".","5",".",".","1","."],[".","4",".","3",".",".",".",".","."],[".",".",".",".",".","3",".",".","1"],       ["8",".",".",".",".",".",".","2","."],[".",".","2",".","7",".",".",".","."],[".","1","5",".",".",".",".",".","."], [".",".",".",".",".","2",".",".","."],[".","2",".","9",".",".",".",".","."],[".",".","4",".",".",".",".",".","."]]

isValidSudoku(a)
























