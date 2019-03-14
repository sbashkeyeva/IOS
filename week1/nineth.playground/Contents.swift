class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let b = s
        b.reversed()
        if s == b {
            return true
        }
        return false
    }
}
