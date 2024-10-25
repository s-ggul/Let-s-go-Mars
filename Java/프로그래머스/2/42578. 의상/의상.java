import java.util.*;

class Solution {
    static int N, R;
    static HashMap<String, ArrayList<String>> clothMap = new HashMap<>();
    public int solution(String[][] clothes) {
        int answer = 1;
        
        for(int i = 0; i < clothes.length; i++){
            String value = clothes[i][0];
            String key = clothes[i][1];
            
            ArrayList<String> type = clothMap.getOrDefault(key, new ArrayList<>());
            type.add(value);
            
            clothMap.put(key, type);
        }
        
        Set<String> keySet = clothMap.keySet();
        
        
        for(String key : keySet){
            answer *= clothMap.get(key).size() + 1; // 안입는 경우
        }
        
        return answer - 1; // 모두 안입는 경우 제외
    }


}