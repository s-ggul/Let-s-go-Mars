function solution(lines) {
    let answer = 0;
    let data = [];
    let minTime = 100000000;
    let maxTime = 0;

    for (const line of lines)
    {
        var temp = line.split(' ');
        var time = temp[1].split(':');
        var h = parseInt(time[0]) * 3600;
        var m = parseInt(time[1]) * 60;
        var s = parseFloat(time[2]);

        var endTime = (h + m + s) * 1000;
        var startTime = endTime - (parseFloat(temp[2].split('s').join(''))*1000 - 1);
        data.push([startTime, endTime]);
    }
    
    // 문자열을 숫자로 바꾸어 저장
    // 초로 변환해서 해보자 

    let count = 0;
    for (let i =0; i < data.length; i++)
    {
        let boundL = data[i][1];
        let boundR = boundL + 999;
        let temp = 1;

        for (let j = i+1; j<data.length; j++)
        {
            if (data[j][0] > boundR)
            {
                continue;
            }
            else
            {
                temp+=1;
            }
        }

        if (temp > count)
        {
            count = temp;
        }
    }
    return count;
}