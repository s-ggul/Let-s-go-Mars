import java.util.*;

class Solution {
    class Song {
        int songNum;
        int playNum;
        
        public Song(int songNum, int playNum) {
            this.songNum = songNum;
            this.playNum = playNum;
        }
    }
    
    static int N;
    static HashMap<String, ArrayList<Song>> songMap = new HashMap<>();
    static HashMap<String, Integer> countSong = new HashMap<>();
    
    public int[] solution(String[] genres, int[] plays) {
        ArrayList<Integer> temp = new ArrayList<>();
        N = genres.length;
        
        for(int i = 0; i < N; i++) {
            ArrayList<Song> list = songMap.getOrDefault(genres[i], new ArrayList<>());
            list.add(new Song(i, plays[i]));
            
            /*
            람다식 안쓰면 
            new Comparator<Integer>(){
                @Override
	                public int compare(String o1, String o2) {...}
            } 
            클래스 추가해야함 
            */
            // playNum 기준으로 내림차순 정렬, 같은 경우엔 고유번호가 낮은순으로
            Collections.sort(list, (Song a, Song b) -> {
                if(a.playNum != b.playNum) return b.playNum - a.playNum;
                else return a.songNum - b.songNum;
            });
            songMap.put(genres[i], list);
            
            int count = countSong.getOrDefault(genres[i], 0);
            countSong.put(genres[i], count + plays[i]);
        }
        
        ArrayList<String> keySet = new ArrayList<>(songMap.keySet());
        keySet.sort((String a, String b) -> countSong.get(b) - countSong.get(a));
        
        for(String key : keySet) {
            ArrayList<Song> songs = songMap.get(key);
            int cnt = 0;
            while(true){
                if(cnt == 2) break;
                if(songs.size() < 2 && cnt == 1) break;
                
                temp.add(songs.get(cnt).songNum);
                cnt++;
            }
        }  
        int[] answer = new int[temp.size()];
        
        for(int i = 0; i < temp.size(); i++){
            answer[i] = temp.get(i);
        }
      
        
        return answer;
    }
}