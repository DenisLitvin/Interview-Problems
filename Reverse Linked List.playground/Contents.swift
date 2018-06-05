//: Playground - noun: a place where people can play

import UIKit

/*
 Given this linked list: 1->2->3->4->5
 
 For k = 2, you should return: 2->1->4->3->5
 
 For k = 3, you should return: 3->2->1->4->5
 */

public class ListNode: CustomStringConvertible {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    public var description: String {
        return "\(val)->\(next?.description ?? "")"
    }
}


func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
    var last: ListNode? = head
    for _ in 1 ..< k {
        last = last?.next
    }
    guard last != nil else { return head }
    
    var next = head?.next
    var current = head
    
    for _ in 1 ..< k {
        if let after = next{
            next = after.next
            after.next = current
            current = after
        }
        else {
            return current
        }
    }
    
    head?.next = reverseKGroup(next, k)
    return current
}

let head = ListNode(1)
let node2 = ListNode(2)
let node3 = ListNode(3)
let node4 = ListNode(4)
let node5 = ListNode(5)

head.next = node2
node2.next = node3
node3.next = node4
//node4.next = node5

reverseKGroup(head, 2)



