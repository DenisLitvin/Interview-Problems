
//: Playground - noun: a place where people can play

import Foundation

//DEBUG
extension Node: CustomStringConvertible {
    var description: String {
        return "anchors - \(self.anchors) \nbranches - \(self.branches)"
    }
}

struct Anchor {
    let index: Int
    let health: Int
}

class Node {
    var branches = [String: Node]()
    var anchors: [Anchor]
    
    init(branches: [String: Node], anchors: [Anchor]) {
        self.branches = branches
        self.anchors = anchors
    }
    
    init() {
        self.branches = [:]
        self.anchors = []
    }
}



//idx     0  1  2
//gen     a aa ab
//hp      2  3  4

let rootNode = Node()

func insertGene(str: String, index: Int, health: Int) {
    if str.isEmpty { return }
    
    var lastNode = rootNode
    
    for i in str {
        let node = lastNode.branches[String(i)] ?? Node()
        lastNode.branches[String(i)] = node
        
        lastNode = node
    }
    lastNode.anchors.append(Anchor(index: index, health: health))
}

func calculateHealth(in strand: String, lowerBound: Int, higherBound: Int, node: Node = rootNode) -> Int {
    if strand.isEmpty { return 0 }
    
    var health = 0

    for (idx, value) in strand.enumerated() {
//        print(idx, value)
        if let node = node.branches[String(value)] {
            node.anchors.forEach { (anchor) in
                if lowerBound...higherBound ~= anchor.index {
                    health += anchor.health
//                    print(String(value), "index - \(anchor.index)", "health - \(anchor.health)")
                }
            }
//            print("recursive")
            health += calculateHealthTest(in: String(strand.dropFirst(idx + 1)), lowerBound: lowerBound, higherBound: higherBound, node: node)
        }
    }
    return health
}
func calculateHealthTest(in strand: String, lowerBound: Int, higherBound: Int, node: Node) -> Int {
    if strand.isEmpty { return 0 }

    var health = 0
    
    if let node = node.branches[String(strand.first!)] {
        node.anchors.forEach { (anchor) in
            if lowerBound...higherBound ~= anchor.index {
                health += anchor.health
//                print(String(strand.first!), "index - \(anchor.index)", "health - \(anchor.health)")
            }
        }
//        print("recursive")
        health += calculateHealthTest(in: String(strand.dropFirst()), lowerBound: lowerBound, higherBound: higherBound, node: node)
    }
    return health
}

func findResult(for input: [[String]], n: Int, health: [Int], genes: [String]) {
    var min: Int = Int.max
    var max: Int = 0
    
    //create trees
    for i in 0 ..< n {
        insertGene(str: genes[i], index: i, health: health[i])
    }
    
    for test in input {
        let lowerBound = Int(test[0])!
        let higherBound = Int(test[1])!
        let strand = test[2]

        let result = calculateHealth(in: strand, lowerBound: lowerBound, higherBound: higherBound)
        if result < min { min = result }
        if result > max { max = result }
    }
    print(min, max)
}
//insertGene(str: "fefe", index: 3, health: 5)
//insertGene(str: "fd", index: 5, health: 6)
//insertGene(str: "fd", index: 5, health: 7)
//insertGene(str: "cafdd", index: 0, health: 17)

//print(rootNode.branches["f"]?.branches["d"]?.anchors)

//calculateHealth(in: "cafd", lowerBound: 0, higherBound: 55)



let input = [["1", "5", "caaab"], ["0", "4", "xyz"], ["2", "4", "bcdybc"]]
findResult(for: input, n: 6, health: [1, 2, 3, 4, 5, 6], genes: ["a", "b", "c", "aa", "d", "b"])
//print(rootNode.branches["a"]?.anchors)
//calculateHealth(in: "caaab", lowerBound: 1, higherBound: 5)
