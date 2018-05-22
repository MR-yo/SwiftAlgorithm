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
 * 2.考虑边界情况
 *
 *
 */


/** 链表相关 */
var myList = List(count: 9)
//myList.reversePrintList1(listHead: myList.head)
//myList.reversePrintList2(listHead: myList.head)

var testNode = myList.head?.next?.next
//myList.deleteNode(node: &testNode)
//myList.printList()

myList.reverseList1(headNode: myList.head!)
myList.reverseList2(headNode: myList.tail!)



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


































