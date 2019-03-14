class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if needle == "" {
            return 0
        }
        if let range = haystack.range(of: needle) {
            let endPos = haystack.distance(from: haystack.startIndex, to: range.lowerBound)
            return endPos  // Prints ab
        }
        return -1
    }
}
