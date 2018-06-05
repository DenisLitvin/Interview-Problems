//: Playground - noun: a place where people can play

import Foundation

func numWays(stepsLeft: Int, stepsAtOnce: [Int]) -> Int {
    return stepsAtOnce
        .filter { $0 <= stepsLeft }
        .reduce(0) { (result, value) in
            let add = value == stepsLeft ? 1 : 0
            return result + add + numWays(stepsLeft: stepsLeft - value, stepsAtOnce: stepsAtOnce)
    }
        
}

numWays(stepsLeft: 10, stepsAtOnce: [5, 10])
