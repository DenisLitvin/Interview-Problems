//: Playground - noun: a place where people can play

import UIKit

func plotToDict(matrix: [[Int]]) -> [String: Int] {
    var dict = [String:Int]()
    for (rowIndex, row) in matrix.enumerated() {
        for (colomnIndex, item) in row.enumerated() {
            dict["\(rowIndex + 1)\(colomnIndex + 1)"] = item
        }
    }
    return dict
}
var currentDir = 0

func findNext(for position: String, in dict: [String:Int]) -> String? {
    let left = Int(String(position.first!)) ?? 0
    let right = Int(String(position.last!)) ?? 0
    let directions = [
        "\(left + 1)\(right)",
        "\(left)\(right + 1)",
        "\(left - 1)\(right)",
        "\(left)\(right - 1)"
    ]
    while dict[directions[currentDir]] == nil {
        currentDir += 1
        if currentDir > 3 {
            currentDir = 0
            return nil
        }
    }
    return directions[currentDir]
}

func shiftDict(by shifts: Int, dict: [String: Int]) -> [String: Int] {
    
    guard shifts > 0 else { return dict }
    
    var dict = dict
    var shiftedDict = [String: Int]()
    var currentPos = "11"
    for i in 1... {
        guard dict["\(i)\(i)"] != nil else { return shiftDict(by: shifts - 1, dict: shiftedDict) }
        
        while let nextPos = findNext(for: currentPos, in: dict) {
        shiftedDict[nextPos] = dict[currentPos]
        dict[currentPos] = nil
        currentPos = nextPos
        }
        let pos = Int(String(currentPos.last!))! - 1
        shiftedDict["\(currentPos.first!)\(pos)"] = dict[currentPos]
        dict[currentPos] = nil
//        print(currentPos)
//        print(dict: dict, m: 4, n: 4)
//        print()
    }
    return shiftDict(by: shifts - 1, dict: shiftedDict)
}

func print(dict: [String:Int], m: Int, n: Int) {
    for row in 1...m {
        var str = ""
        for column in 1...n {
            str += "\(dict["\(row)\(column)"] ?? 0) "
        }
        print(str)
    }
}
let matrix =
    [[1, 2, 3, 4],
    [5, 6, 7, 8],
    [9, 10, 11, 12],
    [13, 14, 15, 16]]

let dict = plotToDict(matrix: matrix)
//shiftDict(by: 1, dict: dict)
print(dict: shiftDict(by: 2, dict: dict), m: 4, n: 4)

