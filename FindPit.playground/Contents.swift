//: Playground - noun: a place where people can play

import UIKit

func findFirstDeceasing(startIndex: Int, _ A: [Int]) -> (start: Int, stop: Int) {
    if startIndex > A.count-1 {
        return (-1,-1)
    }
    var start:Int = 0
    var stop:Int = 0
    
    for i in startIndex..<A.count-1 {
        if A[i] > A[i+1] {
            start = i
            stop = i+1
            break
        }
    }
    
    if stop == 0 {
        return (-1,-1)
    }
    
    for i in stop..<A.count-1 {
        if A[i] > A[i+1] {
            stop+=1
        } else {
            break
        }
    }
    
    return (start, stop)
}

func findFirstIncreasing(startIndex: Int, _ A: [Int]) -> (start: Int, stop: Int) {
    if startIndex > A.count-1 {
        return (-1,-1)
    }
    var start:Int = 0
    var stop:Int = 0
    
    for i in startIndex..<A.count-1 {
        if A[i] < A[i+1] {
            start = i
            stop = i+1
            break
        }
    }
    
    if stop == 0 {
        return (-1,-1)
    }
    
    for i in stop..<A.count-1 {
        if A[i] < A[i+1] {
            stop+=1
        } else {
            break
        }
    }
    
    return (start, stop)
}

func findDeepestDepth(from pits: [(P:Int, Q:Int, R:Int)], in A: [Int]) -> Int {
    
    var mins: [Int] = []
    var depth = Int.min
    for pit in pits {
        let p = pit.P
        let q = pit.Q
        let r = pit.R
        print(pit)
        mins.append(min(A[p] - A[q], A[r] - A[q]))
    }
    
    print(mins)
    
    for i in mins {
        depth = max(depth, i)
    }
    
    return depth == Int.min ? -1 : depth
}

public func solution(_ A : inout [Int]) -> Int {
    var pits:[(P:Int, Q:Int, R:Int)] = []
    
    var pos = 0
    
    while pos < A.count {
        let desc = findFirstDeceasing(startIndex: pos, A)
        if desc.stop == -1 {
            break
        }
        let incr = findFirstIncreasing(startIndex: desc.stop, A)
        if incr.stop == -1 {
            break
        }
        if desc.stop == incr.start {
            for f in desc.start...desc.stop-1 {
                for i in incr.start+1...incr.stop {
                    pits.append((P: f, Q: desc.stop, R: i ))
                }
            }
            //pits.append((P: desc.start, Q: desc.stop, R: incr.stop ))
        }
        pos = incr.stop
    }
    
    //print(pits)
    return findDeepestDepth(from: pits, in: A)
}

//var A = [0,1,3,-2,0,1,0,-3,2,3]
//var W = [0,1,0,-1,0,1,2,3,2,1]
//var Z = [2,1,0,0,1,2,1,2,1,2,3]
//
//var Y = [-2,-3,-1,3,4,5,9,10,12,14,15,15]

var M = [2,1,0,-1,0,-1,-2,-3,-1,2]
let result = solution(&M)

print(result)



Int.min