//: Playground - noun: a place where people can play

import Foundation

/*
 Given an integer k and a string s, find the length of the longest substring that contains at most k distinct characters.
 
 For example, given s = "abcba" and k = 2, the longest substring with k distinct characters is "bcb".
 */

// 1. build a set with unique values
// 2. iterate and append
// 3. if > k -> leftIndex ++
// 4. max = distance between indeces > previous max ? dist : max

func findLongest(in string: String, k: Int) -> Int{
    var set: Set<Character> = []
    var rIndex = string.startIndex
    var lIndex = string.startIndex
    var max = 0
    
    for char in string {
        set.insert(char)
        if set.count > k {
            set.remove(string[lIndex])
            lIndex = string.index(after: lIndex)
        }
        var distance = string.distance(from: lIndex, to: rIndex)
        if lIndex == string.startIndex { distance += 1}
        if distance > max { max = distance }
        rIndex = string.index(after: rIndex)
    }
    return max
}

findLongest(in: "fffffdddddd", k: 2)
