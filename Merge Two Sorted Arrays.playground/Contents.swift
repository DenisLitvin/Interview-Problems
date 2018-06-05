
//: Playground - noun: a place where people can play

import UIKit

func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    var n1 = nums1
    var n2 = nums2
    var arr = [Int]()
    while !n1.isEmpty && !n2.isEmpty {
        if n1.first! > n2.first! {
            arr.append(n2.removeFirst())
        } else {
            arr.append(n1.removeFirst())
        }
    }
    arr += n1 + n2
    let mid = arr.count / 2
    let median: Double
    if arr.count % 2 == 0 {
        median = (Double(arr[mid]) + Double(arr[mid - 1])) / 2
    }
    else {
        median = Double(arr[mid])
    }
    return median
}
findMedianSortedArrays([1,2,3], [4,4,5])
