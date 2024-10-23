class Solution {
    public int solution(int num1, int num2) {
        double ans = (double) num1 / (double) num2;
        ans *= 1000;
        return (int) ans;
    }
}