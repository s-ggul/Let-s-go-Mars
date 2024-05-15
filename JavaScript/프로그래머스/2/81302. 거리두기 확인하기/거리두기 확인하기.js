function solution(places) {
    var answer = [];
    
    for(const place of places)
    {
        var check = [];
        var flag = false;
        for (var i = 0; i <place.length; i++)
        {
            for(var j = 0; j < place[i].length; j++)
            {
                if (place[i][j] == 'P')
                {
                    if (!bfs(place,i,j))
                    {
                        flag = true;
                    }
                }
            }
        }

        if (flag) 
        {
            answer.push(0);
        }
        else{
            answer.push(1);
        }

    }
    
    return answer;
}

var dx = [-1, 1, 0, 0];
var dy = [0, 0, -1, 1];

function bfs(graph, x, y)
{
    var visited = Array.from(Array(5), () => Array(5).fill(false));
    //2 차원 배열 초기화 및 false로 채우기 외워두자
    
    var q = [];
    q.push([x, y, 0])
    visited[x][y] = true;

    while (q.length !== 0)
    {
        var data = q.shift();
        var x = data[0];
        var y = data[1];
        var d = data[2];

        if (d === 2){
            continue;
        }
        else
        {
            for(var i = 0; i<4;i++)
            {
                nx = x + dx[i];
                ny = y + dy[i];

                if (nx>=0 && nx<5 && ny>=0 && nx<5)
                {
                    if (visited[nx][ny] === true)
                    {
                        continue;
                    }
                    if (graph[nx][ny] === 'X')
                    {
                        continue;
                    }
                    else if(graph[nx][ny] === 'P')
                    {
                        return false;
                    }
                    else if(graph[nx][ny] === 'O')
                    {
                        q.push([nx, ny, d+1]);
                        visited[nx][ny] = true;
                    }
                }
            }   
        }
    }
    return true;
}