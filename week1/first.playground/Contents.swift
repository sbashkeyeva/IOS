import UIKit

class Solution {
    func sortedSquares(_ A: [Int]) -> [Int] {
        var list=[Int]()
        for arr in A{
            list.append(arr*arr)
            
        }
        list.sort()
        return list
    }
    
}



