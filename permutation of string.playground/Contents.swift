//: Playground - noun: a place where people can play

import UIKit


func find(in str: String, idx: Int) {
    guard idx < str.count else {
        print(str)
        return
    }
    
    for curIdx in idx ..< str.count {
        var chars = Array(str)
        chars.swapAt(idx, curIdx)
        find(in: String(chars), idx: idx + 1)
    }
}

var str = "ABGS"
str = String(str.sorted(by: <))
find(in: str, idx: 0)

