//Given two Binary Search Trees. Find the nodes that are common in both of them, ie- find the intersection of the two BSTs.

//Note: Return the common nodes in sorted order.

struct Stack<T> {
    var array = [T]()

    var isEmpty : Bool {
        return array.isEmpty
    }

    var peek : T? {
        if isEmpty {
            return nil
        }
        return array[array.count - 1]
    }

    mutating func push(_ data : T) {
        self.array.append(data)
    }

    @discardableResult
    mutating func pop() -> T? {
        if isEmpty {
            return nil
        }
        return array.removeLast()
    }
}

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
        if arr.isEmpty {
            return nil
        }
        var root : Node<Int>? = nil
        for e in arr {
            root = insert(root, e)
        }
        return root
    }   

    func insert(_ node : Node<Int>?,  _ key : Int) -> Node<Int>? {
        if node == nil {
            return Node(key)
        }
        if key < node!.data {
            node?.left = insert(node?.left, key)
        } else {
            node?.right = insert(node?.right, key)
        }
        return node
    }

    // func findCommon(_ node1 : Node<Int>?, _ node2 : Node<Int>?) -> [Int] {
    //     if node1 == nil || node2 == nil {
    //         return []
    //     }
    //     var arr1 = [Int]()
    //     var arr2 = [Int]()
    //     inorder(node1, &arr1)
    //     inorder(node2, &arr2)
    //     var index1 = 0
    //     var index2 = 0
    //     var res = [Int]()
    //     while index1 < arr1.count && index2 < arr2.count {
    //         if arr1[index1] == arr2[index2] {
    //             res.append(arr1[index1])
    //             index1 += 1
    //             index2 += 1
    //         } else if arr1[index1] < arr2[index2] {
    //             index1 += 1
    //         } else {
    //             index2 += 1
    //         }
    //     }
    //     return res
    // }

    // func inorder(_ node : Node<Int>?, _ arr : inout [Int]) {
    //     if node == nil {
    //         return
    //     }
    //     inorder(node?.left, &arr)
    //     arr.append(node!.data)
    //     inorder(node?.right, &arr)
    // }

    func findCommon(_ node1 : Node<Int>?, _ node2 : Node<Int>?) -> [Int] {
        var st1 = Stack<Node<Int>>()
        var st2 = Stack<Node<Int>>()

        var curr1 = node1
        var curr2 = node2
        var res = [Int]()
        while true {
            if curr1 != nil {
                st1.push(curr1!)
                curr1 = curr1?.left
            } else if curr2 != nil {
                st2.push(curr2!)
                curr2 = curr2?.left
            } else if (!st1.isEmpty && !st2.isEmpty) {
                let n1 = st1.peek!
                let n2 = st2.peek!
                if n1.data == n2.data {
                    res.append(n1.data)
                    st1.pop()
                    st2.pop()
                    curr1 = n1.right
                    curr2 = n2.right
                } else if n1.data < n2.data {
                    st1.pop()
                    curr1  = n1.right
                    curr2 = nil
                } else if n1.data > n2.data {
                    st2.pop()
                    curr1 = nil
                    curr2 = n2.right
                }
            } else {
                break
            }
        }
        return res
    }

}

//let arr1 = [5, 1, 0, 4, 10, 7, 9]
//let arr2 = [10, 7, 4, 9, 20]

let arr1 = [10, 2, 1, 3, 11]
let arr2 = [2, 1, 3]


let s = Solution()

var root1 : Node<Int>? = nil
var root2 : Node<Int>? = nil
root1 = s.createBST(arr1)
root2 = s.createBST(arr2)

let res = s.findCommon(root1, root2)
print(res)
