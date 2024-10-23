class Solution {
    public int solution(int n, int k) {
        int answer = 0;
        
        int service = n / 10;
        int realPay = k - service;
        
        answer += n * 12000 + realPay * 2000;
        
        return answer;
    }
}