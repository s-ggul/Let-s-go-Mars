import java.util.*;
class Solution {
    public int solution(int[][] triangle) {
        int answer = 0;
        int[][] sum = new int[triangle.length][];
        for(int i = 0; i < triangle.length; i++){
            sum[i] = new int[i+1];
        }
        sum[0][0] = triangle[0][0];
            
        for(int stair = 0; stair < triangle.length - 1; stair++) {
            int[] arr = triangle[stair];
            
            for(int i = 0; i < stair + 1; i++){
                int leftIdx = i; 
                int rightIdx = i + 1;
                
                sum[stair + 1][leftIdx] = sum[stair + 1][leftIdx] < (sum[stair][i] + triangle[stair+1][leftIdx]) ? (sum[stair][i] + triangle[stair+1][leftIdx]) : sum[stair + 1][leftIdx];
                
                sum[stair + 1][rightIdx] = sum[stair + 1][rightIdx] < (sum[stair][i] + triangle[stair+1][rightIdx]) ? (sum[stair][i] + triangle[stair+1][rightIdx]) : sum[stair + 1][rightIdx];    
            }
        }   
        
        for(int i = 0; i < sum[triangle.length-1].length; i++){
            if(sum[triangle.length-1][i] > answer) answer = sum[triangle.length-1][i];
        }
        
        return answer;
    }
    
    
    
}