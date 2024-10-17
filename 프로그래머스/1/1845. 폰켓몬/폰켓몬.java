import java.util.*;

class Solution {
    static int N; 
    public int solution(int[] nums) {
        N = nums.length;
        Set<Integer> pocke_set = new HashSet<>();
        for(int i = 0; i < N; i++){
            pocke_set.add(nums[i]);
        }
        
        int typeNum = pocke_set.size(); // 종류의 수 
        int maxNum = N/2;
        
        if(typeNum > maxNum) return maxNum;
        else return typeNum;
    }
}