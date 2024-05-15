function solution(id_list, report, k) {
    
    let reports = [...new Set(report)].map(a=>{return a.split(' ')});
    // Set으로 변환한뒤 해당 원소들을 다시 배열로 가져옴 이때 각 원소에 대해 split을 진행

    let count = new Map();
    
    for(const e of reports)
    {
        count.set(e[1], count.get(e[1]) + 1 || 1)
    }

    let note = new Map();

    for (const report of reports)
    {
        if (count.get(report[1]) >= k)
        {
            note.set(report[0], note.get(report[0])+1 || 1)
        }
    }

    let answer = id_list.map(a =>{ 
            let data = note.get(a)
            if (data === undefined)
            {
                return 0
            }
            else{
                return data

            }
        });

    return answer;
}