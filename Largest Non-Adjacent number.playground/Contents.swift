//: Playground - noun: a place where people can play

import UIKit

"""
This problem was asked by Airbnb.

Given a list of integers, write a function that returns the largest sum of non-adjacent numbers. Numbers can be 0 or negative.

For example, [2, 4, 6, 8] should return 12, since we pick 4 and 8. [5, 1, 1, 5] should return 10, since we pick 5 and 5.

Follow-up: Can you do this in O(N) time and constant space?
"""


struct Item {
    let value: Int
    let index: Int
}

func findBiggestNonAjacent(in array: [Int]) -> Int {
    if array.isEmpty { return 0 }

    let max = array.enumerated().max { $0.element < $1.element }!
    return findMax(for: Item(value: max.element, index: max.offset), in: array, exclusionIndeces: [max.offset])
}
//if adjacent
//1.add to exclusion list
//2.find pair for two values with the same exclusion list
//3.compare two values and return biggest int

func findMax(for item: Item, in array: [Int], exclusionIndeces: Set<Int>) -> Int {
    var max = Item(value: 0, index: -2)
    for i in 0 ..< array.count {
        if !exclusionIndeces.contains(i), array[i] > max.value {
            max = Item(value: array[i], index: i)
        }
    }
    print("max -", max, "item -", item)
    if -1...1 ~= item.index - max.index {
        var indeces = exclusionIndeces
        indeces.insert(max.index)
        let left = findMax(for: max, in: array, exclusionIndeces: indeces)
        let right = findMax(for: item, in: array, exclusionIndeces: indeces)
        let result = left > right ? left : right
        return result
    }
    
    return max.value + item.value
}

findBiggestNonAjacent(in: [2, 4, 6, 8, 11, 11])
