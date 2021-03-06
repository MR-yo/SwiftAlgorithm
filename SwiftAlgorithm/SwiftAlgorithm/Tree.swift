//
//  Tree.swift
//  SwiftAlgorithm
//
//  Created by 一只皮卡丘 on 2018/5/21.
//  Copyright © 2018年 一只皮卡丘. All rights reserved.
//

import Foundation

/**
 * **************** *
 *   二叉树相关算法题  *
 * **************** *
 * Line xx: 重建二叉树
 * Line xx: 判断树 B 是否为树 A 的子结构
 * Line xx: 输出一棵二叉树的镜像
 * Line xx:
 */


class TreeNode {
    var val : Int
    var leftNode : TreeNode?
    var rightNode : TreeNode?
    
    private init() {
        self.val = 0
    }
    
    init(val: Int) {
        self.val = val
    }
    
    // 前序打印二叉树
    func printPreorder(treeNode: TreeNode?) -> Void {
        guard treeNode != nil else {
            return
        }
        // 1.递归
//        print(treeNode!.val)
//        printPreorder(treeNode: treeNode?.leftNode)
//        printPreorder(treeNode: treeNode?.rightNode)
        // 2.借助栈
        var stack : [TreeNode] = []
        var temp = treeNode
        var result : [Int] = []
        while !stack.isEmpty || temp != nil {
            if temp != nil {
                result.append(temp!.val)
                stack.append(temp!)
                temp = temp?.leftNode
            }else{
                temp = stack.removeLast().rightNode
            }
        }
        print(result)
    }
    
    // 中序打印二叉树: 先找到最左节点，再递归打印？
    func printInorder(treeNode: TreeNode?) -> Void {
        guard treeNode != nil else {
            return
        }
        printPreorder(treeNode: treeNode?.leftNode)
        print(treeNode!.val)
        printPreorder(treeNode: treeNode?.rightNode)
    }
    
    // 后序打印二叉树
    func printPostorder(treeNode: TreeNode?) -> Void {
        guard treeNode != nil else {
            return
        }
        printPreorder(treeNode: treeNode?.leftNode)
        printPreorder(treeNode: treeNode?.rightNode)
        print(treeNode!.val)
    }
    
    // 层序遍历
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard root != nil else {
            return [[]]
        }
        var stack = [root!]
        var result = [[root!.val]]
        while !stack.isEmpty {
            var array = [TreeNode]()
            var valArray = [Int]()
            for node in stack {
                if node.leftNode != nil {
                    array.append(node.leftNode!)
                    valArray.append(node.leftNode!.val)
                }
                if node.rightNode != nil {
                    array.append(node.rightNode!)
                    valArray.append(node.rightNode!.val)
                }
            }
            stack = array
            result.append(valArray)
        }
        return result
    }
}

/**
 * 题目：根据给出一棵二叉树的前序遍历和中序遍历结果（无重复数字），重建二叉树。
 * 分析：1. 前序遍历第一个值为根节点
 *      2. 根据跟节点在中序遍历结果中的位置可以区分左子树跟右子树
 */
func rebuildTree(preorder:[Int]?, inorder:[Int]?, treeLength: Int) -> Void {
    guard preorder != nil , inorder != nil , preorder?.count == inorder?.count else {
        return
    }
    
    
    
}

/**
 * 题目：输入两颗树A 和 B，判断 B 是否为 A 的子结构
 * 分析：1. 拿到 B 的根节点，去 A 中遍历，找到相同的节点就开始进行判断，没有就直接返回
 *      2. 如何判断？递归，每个值都做比较
 */
func judgeTreeA(_ treeA: TreeNode?, hasChildB treeB:TreeNode?) -> Bool {
    guard treeA != nil ,treeB != nil else {
        return false
    }
    var result = treeA!.val == treeB!.val
    if result {
        result = hasSubTree(treeA: treeA!, treeB: treeB!)
    }
    if !result {
        result = judgeTreeA(treeA!.leftNode, hasChildB: treeB)
    }
    if !result {
        result = judgeTreeA(treeA!.rightNode, hasChildB: treeB)
    }
    return result
}

func hasSubTree(treeA : TreeNode?, treeB: TreeNode?) -> Bool {
    if treeB == nil {
        return true
    }
    if treeA == nil{
        return false
    }
    if treeA!.val != treeB!.val {
        return false
    }
    return hasSubTree(treeA: treeA!.leftNode, treeB: treeB!.leftNode) && hasSubTree(treeA: treeA!.rightNode, treeB: treeB!.rightNode)
}


/**
 * 题目：输出一棵二叉树的镜像
 * 分析：1. 可以通过画图找找思路，发现应该交换所有有子节点的左右子树
 *      2. 直接改变初始对象还是新生成一棵树
 */
func mirrorTree(targetTree:TreeNode?) -> Void {
    
    
    
}

/**
 * 题目：输出一棵二叉树的最大深度。
 * 分析：1.需要好好理解
 */
func maxDepth(_ root: TreeNode?) -> Int {
    guard root != nil else {
        return 0
    }
    let leftDeep = maxDepth(root?.leftNode) + 1
    let rightDeep = maxDepth(root?.rightNode) + 1
    return max(leftDeep, rightDeep)
}


/**
 * 题目：给定一个二叉树，判断其是否是一个有效的二叉搜索树。
 * 分析：1.
 */
func isValidBST(_ root: TreeNode?) -> Bool {
    guard root != nil else {
        return true
    }
    
    var temp = root
    var stack = [TreeNode]()
    var array = [Int]()
    
    while temp != nil || !stack.isEmpty {
        
        while temp != nil {
            stack.append(temp!)
            temp = temp?.leftNode
        }
        
        if !stack.isEmpty {
            temp = stack.last
            array.append(temp!.val)
            temp = temp!.rightNode
            stack.removeLast()
        }
    }
    
    return array == array.sorted() && array.count == Set(array).count
}

func getLeftTreeArray(node: TreeNode?) -> Void {
    
}

/**
 * 题目：给定两个二叉树，编写一个函数来检验它们是否相同。
 * 分析：1.
 */
func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    if (p == nil && q != nil) || (p != nil && q == nil){
        return false
    }
    if p == nil && q == nil {
        return true
    }
    if p!.val != q!.val{
        return false
    }
    
    let resultLeft = isSameTree(p?.leftNode, q?.leftNode)
    if resultLeft == false {
        return false
    }
    
    let resultRight = isSameTree(p?.rightNode, q?.rightNode)
    if resultRight == false {
        return false
    }
    
    return true
}


/**
 * 题目：给定一个二叉树，检查它是否是镜像对称的。
 * 分析：1.
 */
func isSymmetric(_ root: TreeNode?) -> Bool {
    guard root != nil else {
        return false
    }
    return isNodeEqual(root!.leftNode,root!.rightNode)
}

func isNodeEqual(_ first: TreeNode?,_ second: TreeNode?) -> Bool {
    if first == nil && second == nil {
        return true
    }
    if first?.val != second?.val {
        return false
    }
    return isNodeEqual(first?.leftNode,second?.rightNode) && isNodeEqual(first?.rightNode,second?.leftNode)
}



