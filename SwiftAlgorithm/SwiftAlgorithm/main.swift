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














