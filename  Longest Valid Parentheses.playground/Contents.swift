//: Playground - noun: a place where people can play

import UIKit

/*
Given a string containing just the characters '(' and ')', find the length of the longest valid (well-formed) parentheses substring.
*/


var str = "(((()(())))"

//O(n)
func longestValidParentheses(_ s: String) -> Int {
    if s.count < 2 { return 0 }
    
    var map = Array(repeating: false, count: s.count)
    var stack: [(char: Character, index: String.Index)] = []
    var index = s.startIndex
    
    for char in s {
        if char == "(" {
            stack.append((char: char, index: index))
        }
        else if char == ")", let last = stack.last, last.char == "(" {
            map[last.index.encodedOffset] = true
            map[index.encodedOffset] = true
            stack.removeLast()
        }
        index = s.index(after: index)
    }
    var max = 0
    var count = 0
    map.forEach {
        if $0 {
            count += 1
            if count > max { max = count }
        }
        else { count = 0 }
    }
    return max
}

longestValidParentheses(str)
