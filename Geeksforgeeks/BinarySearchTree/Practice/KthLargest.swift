//Given a Binary search tree. Your task is to complete the function which will return the Kth largest element 
//without doing any modification in Binary Search Tree.

struct Stack<T> {

    var array = [T]()

    var isEmpty : Bool {
        return array.isEmpty
    }

    mutating func push(_ data : T) {
        self.array.append(data)
    }

    @discardableResult
    mutating func pop() -> T? {
        if array.isEmpty {
            return nil
        }
        return array.removeLast()
    }

}

struct Heap<T : Equatable> {
    
    var array = [T]()
    let sort : ((T, T) -> Bool)

    init(_ array : [T], _ sort : @escaping (T, T) -> Bool) {
        self.array = array
        self.sort = sort
    }

    init(_ sort : @escaping (T, T) -> Bool) {
        self.init([], sort)
    } 

    var isEmpty : Bool {
        return array.isEmpty
    }

    func parent(_ i : Int) -> Int {
        return (i - 1) / 2
    }

    func lChild(_ i : Int) -> Int {
        return 2 * i + 1
    }

    func rChild(_ i : Int) -> Int {
        return 2 * i + 2
    }

    var top : T? {
        if isEmpty {
            return nil
        }
        return array[0]
    }

    mutating func heapify(_ i : Int) {
        let l = lChild(i)
        let r = rChild(i)
        var candidate = i
        if l < array.count && self.sort(self.array[l], self.array[candidate]) {
            candidate = l
        }
        if r < array.count && self.sort(self.array[r], self.array[candidate]) {
            candidate = r
        }
        if candidate != i {
            self.array.swapAt(i, candidate)
            heapify(candidate)
        }
    }

    mutating func insert(_ val : T) {
        self.array.append(val)
        var i = self.array.count - 1
        var p = parent(i)
        while i != 0 && sort(array[i], array[p]) {
            array.swapAt(i, p)
            i = p
            p = parent(i)
        }
    }

    @discardableResult
    mutating func remove() -> T? {
        if isEmpty {
            return nil
        }
        let root = array[0]
        array.swapAt(0, array.count - 1)
        array.removeLast()
        heapify(0)
        return root
    }

}

class Node<T> {
    var data : T
    var left : Node?
    var right : Node?

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
        var root : Node<Int>?
        for a in arr {
            root = insert(root, a)
        }
        return root
    }

    func insert(_ node : Node<Int>?, _ key : Int) -> Node<Int>? {
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

    // func kthLargest(_ node : Node<Int>?, _ k : Int) -> Int? {
    //     if node == nil {
    //         return nil
    //     }
    //     var arr = [Int]()
    //     //let rSum = kthLargest(node?.right, k)
    //     inorder(node, &arr)
    //     let resArr : [Int] = arr.sorted().reversed()
    //     if !resArr.isEmpty {
    //         for i in 0..<resArr.count {
    //             if i == k - 1 {
    //                 return resArr[i] 
    //             }
    //         }
    //     }
    //     return nil
    // }

    // func inorder(_ node : Node<Int>?, _ arr : inout [Int]) {
    //     if node == nil {
    //         return
    //     }
    //     inorder(node?.left, &arr)
    //     arr.append(node!.data)
    //     inorder(node?.right, &arr)
    // }

    // func kthLargest(_ node : Node<Int>?, _ k : Int) -> Int? {
    //     if node == nil {
    //         return nil
    //     }
    //     var count = 0
    //     let res = kthLargestUtil(node, k, &count)
    //     return res
    // }

    // func kthLargestUtil(_ node : Node<Int>?, _ k : Int, _ count : inout Int) -> Int? {
    //     if node == nil || count >= k {
    //         return nil
    //     }
    //     let r = kthLargestUtil(node?.right, k, &count)
    //     if r != nil {
    //         return r
    //     }
    //     count += 1
    //     if count == k {
    //         return node!.data
    //     }
    //     let l = kthLargestUtil(node?.left, k, &count)
    //     if l != nil {
    //         return l
    //     }
    //     return nil
    // }

    // func kthLargest(_ node : Node<Int>?, _ k : Int) -> Int? {
    //     if node == nil {
    //         return nil
    //     }
    //     var st = Stack<Node<Int>>()
    //     var curr = node
    //     var count = 0
    //     while curr != nil || !st.isEmpty {
    //         while curr != nil {
    //             st.push(curr!)
    //             curr = curr?.right
    //         }
    //         if let n = st.pop() {
    //             count += 1
    //             if count == k {
    //                 return n.data
    //             }
    //             curr = n.left
    //         }
    //     }
    //     return nil
    // }

    func kthLargest(_ node : Node<Int>?, _ k : Int) -> Int? {
        if node == nil {
            return nil
        }
        var st = Stack<Node<Int>>()
        var h = Heap<Int> { $0 > $1 }
        var curr = node
        while curr != nil || !st.isEmpty {
            while curr != nil {
                st.push(curr!)
                curr = curr?.right
            }
            if let n = st.pop() {
                h.insert(n.data)
                curr = n.left
            }
        }
        for _ in 1..<k {
            h.remove()
        }
        return h.top
    }

}

let arr = [50, 30, 20, 40, 70, 60, 80]
let s = Solution()

var root : Node<Int>? = nil
root = s.createBST(arr)
if let res = s.kthLargest(root, 5) {
    print(res)
}
