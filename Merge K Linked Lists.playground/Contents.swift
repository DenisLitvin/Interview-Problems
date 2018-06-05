//: Playground - noun: a place where people can play

import UIKit
/**
 * Definition for singly-linked list.
 
 */
class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    var lists = lists
    var result: ListNode?
    var hasChange = true
    var lastNode: ListNode?
    
    while hasChange {
        var min = Int.max
        var minIdx = 0
        hasChange = false
        for (idx, list) in lists.enumerated() {
            if let value = list?.val, value < min {
                minIdx = idx
                min = value
                hasChange = true
                print(value < min)
            }
        }
        if min != .max {
            if lastNode != nil {
                lastNode?.next = lists[minIdx]
                lastNode = lists[minIdx]
            }
            else if lastNode == nil, let result = result {
                result.next = lists[minIdx]
                lastNode = lists[minIdx]
            }
            else {
                result = ListNode(min)
            }
            lists[minIdx] = lists[minIdx]?.next
        }
    }
    return result
}
let l1 = ListNode(1)
let l2 = ListNode(4)
let l3 = ListNode(5)
l1.next = l2
l2.next = l3

let l4 = ListNode(1)
let l5 = ListNode(3)
l4.next = l5
let node = mergeKLists([l1, l4])
node?.next?.next?.val
