//Given a Binary Search Tree that contains positive integer values greater than 0. 
//The task is to complete the function isDeadEnd which returns true if the BST contains a dead end else returns false.
//Here Dead End means, we are not able to insert any element after that node.

class Node<T> {
    var data : T
    var left : Node<T>?
    var right : Node<T>?

    init(_ data : T) {
        self.data = data
        self.left = nil
        self.right = nil
    }
}

class Solution {

    func createBST(_ arr : [Int]) -> Node<Int>? {
        guard !arr.isEmpty else {
            return nil
        }
        var root : Node<Int>? = nil
        for a in arr {
            root = insert(root, a)
        }
        return root
    }

    func insert(_ node : Node<Int>?, _ key : Int) -> Node<Int>? {
        guard node != nil else {
            return Node(key)
        }
        if key < node!.data {
            node?.left = insert(node?.left, key)
        } else if key > node!.data {
            node?.right = insert(node?.right, key)
        }
        return node
    }

    // func findAllNodes(_ node : Node<Int>?, _ dict : inout [Int : Int]) {
    //     guard node != nil else {
    //         return
    //     }
    //     findAllNodes(node?.left, &dict)
    //     dict[node!.data] = 1
    //     findAllNodes(node?.right, &dict)
    // }

    // func check(_ node : Node<Int>?, _ dict : [Int : Int]) -> Bool {
    //     guard node != nil else {
    //         return false
    //     }
    //     if node?.left == nil && node?.right == nil {
    //         let pre = node!.data - 1
    //         let next = node!.data + 1
    //         if dict[pre] != nil && dict[next] != nil {
    //             return true
    //         }
    //     }
    //     return check(node?.left, dict) || check(node?.right, dict)
    // }

    // func isDeadEnd(_ root : Node<Int>?) -> Bool {
    //     guard root != nil else {
    //         return false
    //     }
    //     var dict = [Int : Int]()
    //     dict[0] = 1
    //     findAllNodes(root, &dict)
    //     print("dict \(dict)")
    //     return check(root, dict)
    // }

    func isDeadEnd(_ node : Node<Int>?, _ min : Int, _ max : Int) -> Bool {
        if node == nil {
            return false
        }
        if min == max {
            return true
        }
        return isDeadEnd(node?.left, min, node!.data - 1) || isDeadEnd(node?.right, node!.data + 1, max)
    }

}

let arr = [8, 5, 2, 3, 7, 11, 4]
let s = Solution()

var root : Node<Int>? = nil
root = s.createBST(arr)
let flag = s.isDeadEnd(root, 1, Int.max)
print(flag)