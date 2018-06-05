//: Playground - noun: a place where people can play

import UIKit

"""
   a
  / \
 a   a
     /\
    a  a
        \
         A
"""

class Node {
    var left: Node?
    var right: Node?
    
    let value: String
    
    init(value: String) {
        self.value = value
    }
}


func countUnivalSubtrees(for root: Node?) -> (Int, Bool) {
    guard let root = root else { return (0, true) } // null leaf
    if root.left == nil, root.right == nil { return (1, true) } //leaf
    
    var unival: (Int, Bool) = (0, false)
    let leftUnival = countUnivalSubtrees(for: root.left)
    let rightUnival = countUnivalSubtrees(for: root.right)
    unival.0 += leftUnival.0 + rightUnival.0

//    print(leftUnival, rightUnival, "value -", root.value)
    
    if leftUnival.1, rightUnival.1,
       root.value == root.left?.value ?? root.value,
       root.value == root.right?.value ?? root.value
    {
        unival.0 += 1
        unival.1 = true
    }
    return unival
}



let root = Node(value: "a")
let left1 = Node(value: "a")
let right1 = Node(value: "a")
let left2 = Node(value: "a")
let right2 = Node(value: "a")
let right3 = Node(value: "A")
let right4 = Node(value: "a")

root.left = left1
root.right = right1
right1.left = left2
right1.right = right2
right2.right = right3
right3.right = right4
print(countUnivalSubtrees(for: root))





