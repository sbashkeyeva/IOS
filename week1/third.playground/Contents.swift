class Solution {
    func flipAndInvertImage(_ A: [[Int]]) -> [[Int]] {
        var final:[[Int]]=A
        for  i in 0..<A.count{
            var temp=A[i]
            for  j in 0..<temp.count{
                final[i][j]=temp[temp.count-j-1]
            }
        }
        for  i in 0..<final.count{
            for  j in 0..<final[i].count{
                if(final[i][j]==0){
                    final[i][j]=1
                }else{
                    final[i][j]=0
                }
            }
        }
        return final
    }
}
