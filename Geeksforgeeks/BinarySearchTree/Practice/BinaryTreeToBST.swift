//Given a Binary Tree, convert it to Binary Search Tree in such a way that keeps the original structure of Binary Tree intact.


class Node {
    var data : Int
    var left : Node?
    var right : Node?

    init(_ data : Int) {
        self.data = data
        self.left = nil
        self.right = nil
    }
}

class Solution {

    func binaryTreeToBST(_ node : Node?) -> Node? {
        guard node != nil else {
            return nil
        }
        var arr = [Int]()
        inorder(node, &arr)
        arr.sort()
        inorderBST(node, &arr)
        return node
    }

    func inorder(_ node : Node?, _ arr : inout [Int]) {
        if node == nil {
            return
        }
        inorder(node?.left, &arr)
        arr.append(node!.data)
        inorder(node?.right, &arr)
    }

    func inorderBST(_ node : Node?, _ arr : inout [Int]) {
        guard node != nil else {
            return
        }
        inorderBST(node?.left, &arr)
        if !arr.isEmpty {
            node!.data = arr[0]
        }
        arr.removeFirst()
        inorderBST(node?.right, &arr)
    }

    func printBSTInorder(_ node : Node?) {
        if node == nil {
            return
        }
        printBSTInorder(node?.left)
        print(node!.data)
        printBSTInorder(node?.right)
    }

}

// var root = Node(1)
// //root = Node(16)
// root.left = Node(2)
// root.right = Node(3)
// root.left?.left = Node(4)
// //root?.left?.right = Node(10)

var root = Node(10)
//root = Node(16)
root.left = Node(2)
root.right = Node(7)
root.left?.left = Node(8)
root.left?.right = Node(4)

let s = Solution()
let resNode = s.binaryTreeToBST(root)
s.printBSTInorder(resNode)