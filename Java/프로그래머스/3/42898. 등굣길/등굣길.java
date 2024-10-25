class Solution {
    static int[][] board, pond;
    static int[][] prePos = {{-1,0}, {0,-1}};
    public int solution(int m, int n, int[][] puddles) {
        board = new int[n+1][m+1];
        pond = new int[n+1][m+1];
        
        board[1][1] = 1;
        
        for(int i = 0; i < puddles.length; i++){
            for(int[] puddle : puddles) {
                pond[puddle[1]][puddle[0]] = -1; // 연못 좌표도 뒤집혀 있음 ㅋㅋ
            }
        }
        
        for(int i = 1; i <= n; i++){
            for(int j = 1; j <= m; j++){
                if(i == 1 && j == 1) continue;
                if(pond[i][j] == -1) continue;
                board[i][j] = (board[i-1][j] + board[i][j-1]) % 1000000007;
            }
        }
        
        return (board[n][m]);
    }
}