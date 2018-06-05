//: Playground - noun: a place where people can play

import UIKit

"""
Given a string, find the length of the longest substring without repeating characters.

Examples:

Given "abcabcbb", the answer is "abc", which the length is 3.

Given "bbbbb", the answer is "b", with the length of 1.

Given "pwwkew", the answer is "wke", with the length of 3. Note that the answer must be a substring, "pwke" is a subsequence and not a substring.

"""
//O(n^2)
func lengthOfLongestSubstring(_ s: String) -> Int {
    let time = CACurrentMediaTime()

    var idx = s.startIndex
    var max = 0
    
    while idx != s.endIndex && s.distance(from: idx, to: s.endIndex) >= max {
        
        var set: Set<String> = []
        var count = 0
        
        for i in s[idx..<s.endIndex] {
            if !set.contains(String(i)) {
                set.insert(String(i))
                count += 1
            }
            else {
                break
            }
        }
        
        if count > max {
            max = count
        }
        
        idx = s.index(after: idx)
    }
    print(CACurrentMediaTime() - time)

    return max
}

//O(n)
func lengthOfLongestSubstring2(_ s: String) -> Int {
    let time = CACurrentMediaTime()

    var table: [Character: String.Index] = [:]
    var maxCount = 0
    var currentCount = 0
    
    var idx = s.startIndex
    
    while idx != s.endIndex {
        if table[s[idx]] == nil {
            table[s[idx]] = idx
            currentCount += 1
        }
        else {
            let previous = table[s[idx]]!
            let distance = s.distance(from: previous, to: idx)
            if distance <= currentCount {
                currentCount = distance
            } else {
                currentCount += 1
            }
            table[s[idx]] = idx
        }
        if currentCount > maxCount {
            maxCount = currentCount
        }
        idx = s.index(after: idx)
    }
    print(CACurrentMediaTime() - time)

    return maxCount
}

//even faster
func lengthOfLongestSubstring3(_ s: String) -> Int {
    
    let time = CACurrentMediaTime()

    var charsIndex = [Int](repeating:-1,count:256)
    var lastRePos = 0
    var lastMaxL = 0
    var maxL = 0
    var index = -1
    
    for cha in s.utf8 {
        
        let asciiV = Int(cha)
        index += 1
        let lastPos = charsIndex[asciiV]
        
        if lastPos < lastRePos {
            lastMaxL += 1
            if lastMaxL > maxL {
                maxL = lastMaxL
            }
        }
        else {
            lastMaxL = index - lastPos
            lastRePos = lastPos + 1
        }
        charsIndex[asciiV] = index
    }
    
    print(CACurrentMediaTime() - time)

    return maxL
}
lengthOfLongestSubstring("asdfghjkl09876543poiuytrewqzxcvbnmnbvcxjhgfdsdfuytrdazxcvbnmlkjhgfdsapoiuytrewq0987654321")
lengthOfLongestSubstring2("asdfghjkl09876543poiuytrewqzxcvbnmnbvcxjhgfdsdfuytrdazxcvbnmlkjhgfdsapoiuytrewq0987654321")
lengthOfLongestSubstring3("asdfghjkl09876543poiuytrewqzxcvbnmnbvcxjhgfdsdfuytrdazxcvbnmlkjhgfdsapoiuytrewq0987654321")

