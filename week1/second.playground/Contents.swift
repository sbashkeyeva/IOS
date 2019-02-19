class Solution {
    func sortArrayByParity(_ A: [Int]) -> [Int] {
        var listeven=[Int]()
        var listodd=[Int]()
        for element in A{
            if(element%2==0){
                listeven.append(element)
            }
            else{
                listodd.append(element)
            }
            
        }
        return listeven+listodd
    }
}
