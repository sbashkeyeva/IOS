class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var temp:Int=0
        for element in nums{
            if(element==0){
                temp+=1
            }
        }
        nums.removeAll{$0==0}
        if(temp>0){
            for _ in 0..<temp{
                nums.append(0)
            }
        }
        
        
    }
}
