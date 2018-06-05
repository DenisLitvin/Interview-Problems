//: Playground - noun: a place where people can play

import Foundation


let str = "ccijiji"

let checkBounds: (String.Index) -> Bool = { $0 < str.endIndex && $0 > str.startIndex }

func findString(in string: String, left: String.Index, right: String.Index) -> String{
    var left = left
    var right = right
    while checkBounds(left), checkBounds(right), checkBounds(str.index(after: right)){
        let previous = str.index(before: left)
        let next = str.index(after: right)
        
        if str[previous] == str[next] {
            left = previous
            right = next
        }
        else {
            break
        }
    }
    return String(str[left...right])
}
func findLongestPalindrom(in str: String) -> String {
    var result = ""
    
    var current = str.startIndex
    
    for _ in str {
        
        let next = str.index(after: current)
        
        var left = current
        var right = current
        
        if checkBounds(next) {
            if str[current] == str[next] {
                right = next
                let temp = findString(in: str, left: left, right: right)
                result = temp.count > result.count ? temp : result
            }
            
            let afterNext = str.index(after: next)
            if checkBounds(afterNext), str[current] == str[afterNext] {
                right = afterNext
                let temp = findString(in: str, left: left, right: right)
                result = temp.count > result.count ? temp : result

            }
            
           
        }
//        print(str.distance(from: left, to: right))
        if str[left...right].count >= result.count {
            result = String(str[left...right])
//            print("new")
        }
//        print(str[current])
        str.formIndex(after: &current)
        
    }
    return result
}

print(findLongestPalindrom(in: str))
