/*
최소 시간은 1분, 최대 시간은 모든 사람이 가장 느린 심사관에게 심사를 받을 경우
중간 시간(mid)을 설정하고, 각 심사관이 mid 시간 동안 처리할 수 있는 사람 수를 계산하여, 그 합이 n명 이상인지를 확인
n명 이상 처리할 수 있다면 더 적은 시간으로도 가능하므로 right 값을 줄이고, 그렇지 않으면 left 값을 늘려서 계속 이분 탐색을 수행
*/

function solution(n, times) {
    let left = 1;
    let right = Math.max(...times) * n;
    let answer = right;

    while (left <= right) {
        const mid = Math.floor((left + right) / 2);
        let people = 0;

        // 주어진 mid 시간 동안 각 심사관이 처리할 수 있는 사람 수를 계산
        for (const time of times) {
            people += Math.floor(mid / time);
        }

        // 모든 사람을 처리할 수 있는 경우
        if (people >= n) {
            answer = mid;
            right = mid - 1;
        } else {
            left = mid + 1;
        }
    }

    return answer;
}
