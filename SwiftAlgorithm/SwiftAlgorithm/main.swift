//
//  main.swift
//  SwiftAlgorithm
//
//  Created by 一只皮卡丘 on 2018/5/10.
//  Copyright © 2018年 一只皮卡丘. All rights reserved.
//

import Foundation
import QuartzCore


/**
 * 心得总结
 * 1.函数必须对参数进行验证
 * 2.尽可能考虑所有边界情况
 */


// --  树  ---------------------------------------------------------------------------------------
// 生成一些树节点
let treeNode1 = TreeNode(val: 1)
let treeNode2 = TreeNode(val: 2)
let treeNode3 = TreeNode(val: 3)
let treeNode4 = TreeNode(val: 4)
let treeNode5 = TreeNode(val: 5)
let treeNode6 = TreeNode(val: 6)

/** 设置两颗测试的树
 *  1.      0           2.      0
 *        1   2               1   2
 *      3   4                   5   6
 */
let treeHead1 = TreeNode(val: 0)
treeHead1.leftNode = treeNode1
treeHead1.rightNode = treeNode2
treeNode1.leftNode = treeNode3
treeNode1.rightNode = treeNode4

let treeHead2 = TreeNode(val: 0)
treeHead2.leftNode = treeNode1
treeHead2.rightNode = treeNode2
treeNode2.leftNode = treeNode5
treeNode2.rightNode = treeNode6

let r1 = isSameTree(treeHead1, treeHead2)


threeSum([-1, 0, 1, 2, -1, -4])














