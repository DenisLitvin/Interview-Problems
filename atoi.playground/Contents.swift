//: Playground - noun: a place where people can play

import UIKit

//class Solution {
    let set: Set<String> = ["+", "-", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

func myAtoi(_ str: String) -> Int {
    let str = str.trimmingCharacters(in: .whitespacesAndNewlines)
    guard !str.isEmpty,
          set.contains(String(str.first!)) else { return 0 }
    
    var result = ""
    for char in str {
        let char = String(char)
        if set.contains(char) {
            result += char
        }
        else if !result.isEmpty {
            break
        }
    }
    print(result)
    
    
    let signed = result.hasPrefix("-")
    var dropCount = 0
    result = String(result.drop { char in
        defer { dropCount += 1}
        return char == "-" || char == "+"
    })
    if dropCount > 2 { return 0 }
    result = String(result.prefix { char in
        char != "-" && char != "+"
    })
    var shouldReturn = false
    result = String(result.drop { char in
        if char == "-" || char == "+" { shouldReturn = true }
        return char == "0"
    })
    if shouldReturn { return 0 }
    if signed { result = "-\(result)" }
    if result.count > 11 { result = String(result[result.startIndex...result.index(result.startIndex, offsetBy: 11)]) }
    print(result)
    let resInt = Int(result) ?? 0
    guard resInt <= Int32.max else { return Int(Int32.max) }
    guard resInt >= Int32.min else { return Int(Int32.min) }
    return resInt
}
myAtoi(" -43")
//}
class Solution {
    func myAtoi(_ str: String) -> Int {
        var isNegative = false
        var isStarted = false
        var currentNumber = 0;
        for char in str {
            switch (char) {
            case "+":
                if (!isStarted) {
                    isNegative = false
                    isStarted = true
                }
                else {
                    return 0
                }
            case "-":
                if (!isStarted) {
                    isNegative = true
                    isStarted = true
                }
                else {
                    return 0
                }
                
            case "0":
                isStarted = true
                currentNumber = multiplyValue(value: currentNumber, add: 0, isNegative: isNegative)
            case "1":
                isStarted = true
                currentNumber = multiplyValue(value: currentNumber, add: 1, isNegative: isNegative)
            case "2":
                isStarted = true
                currentNumber = multiplyValue(value: currentNumber, add: 2, isNegative: isNegative)
            case "3":
                isStarted = true
                currentNumber = multiplyValue(value: currentNumber, add: 3, isNegative: isNegative)
            case "4":
                isStarted = true
                currentNumber = multiplyValue(value: currentNumber, add: 4, isNegative: isNegative)
            case "5":
                isStarted = true
                currentNumber = multiplyValue(value: currentNumber, add: 5, isNegative: isNegative)
            case "6":
                isStarted = true
                currentNumber = multiplyValue(value: currentNumber, add: 6, isNegative: isNegative)
            case "7":
                isStarted = true
                currentNumber = multiplyValue(value: currentNumber, add: 7, isNegative: isNegative)
            case "8":
                isStarted = true
                currentNumber = multiplyValue(value: currentNumber, add: 8, isNegative: isNegative)
            case "9":
                isStarted = true
                currentNumber = multiplyValue(value: currentNumber, add: 9, isNegative: isNegative)
            default:
                if (isStarted) {
                    if (isNegative) {
                        return currentNumber * -1;
                    }
                    else {
                        return currentNumber
                    }
                }
                else if (char != " ") {
                    return 0
                }
            }
        }
        
        if (isNegative) {
            return currentNumber * -1;
        }
        else {
            return currentNumber
        }
    }
    
    func multiplyValue(value: Int, add: Int, isNegative: Bool) -> Int {
        var checkValue: Int
        if isNegative {
            checkValue = 2147483648
        }
        else {
            checkValue = 2147483647
        }
        
        
        if (((checkValue - add) / 10) >= value)
        {
            return (value * 10) + add
        }
        else {
            
            return checkValue
        }
    }
}
