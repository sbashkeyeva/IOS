class Solution {
    func arrayPairSum(_ nums: [Int]) -> Int {
        var arr:[Int]=nums
        arr.sort()
        var sum=0
        var i=0
        while(i<=arr.count-1)
        {
            sum+=arr[i]
            i+=2
        }
        return sum
    }
}
