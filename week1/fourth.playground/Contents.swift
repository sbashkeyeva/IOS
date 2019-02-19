class Solution {
    func fib(_ N: Int) -> Int {
        var number:Int=N
        if(number<=1){
            return number
        }
        var a=1
        var b=0
        while(number>=1)
        {
            let sum=a+b
            a=b
            b=sum
            number-=1
            
        }
        return b
    }
}
