import java.util.*;
class Solution {
    public int[] solution(int[] numbers) {
        int[] answer = Arrays.copyOfRange(numbers, 0, numbers.length);
        for(int i = 0; i < numbers.length; i++) {
            answer[i] *= 2;
        }
        return answer;
    }
}