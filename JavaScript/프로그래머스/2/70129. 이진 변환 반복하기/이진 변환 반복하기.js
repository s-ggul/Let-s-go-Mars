function solution(s) {
    const answer = [0,0];
    
    while(s !== "1"){
        answer[0]++;
        const {cntOne, cntZero} = removeZeroInStr(s);
        
        s = cntOne.toString(2);
        answer[1] += cntZero;
    }
    
    return answer;
}

function removeZeroInStr(s) {
    let cntOne = 0;
    let cntZero = 0;
    
    for(let i = 0; i < s.length; i++) {
        if(s[i] === "0") cntZero++;
        else cntOne++;
    }
    
    return {cntOne, cntZero};
}