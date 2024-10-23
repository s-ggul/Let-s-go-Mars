class Solution {
    public int solution(String[] s1, String[] s2) {
        int answer = 0;
        
        for(int i = 0; i < s1.length; i++) {
            String target = s1[i];
             for(int j = 0; j < s2.length; j++) {
                if(target.equals(s2[j])) {
                    answer++; 
                    break;
                }
             }   
        }
        
        return answer;
    }
}