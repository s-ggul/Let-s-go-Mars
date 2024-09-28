-- 초기 내 풀이

# SELECT 
#         RANK_TABLE.ID,
#         CASE 
#             WHEN RANK_TABLE.RANK_OF_SIZE <= 0.25 * COUNT(*) THEN "CRITICAL"
#             WHEN RANK_TABLE.RANK_OF_SIZE <= 0.5 * COUNT(*) THEN "HIGH"
#             WHEN RANK_TABLE.RANK_OF_SIZE <= 0.75 * COUNT(*) THEN "MEDIUM"
#             ELSE "LOW"
#         END AS COLONY_NAME
# FROM ECOLI_DATA E, 
#       (
#           SELECT ID, SIZE_OF_COLONY, ROW_NUMBER() OVER (ORDER BY SIZE_OF_COLONY DESC) AS RANK_OF_SIZE
#             FROM ECOLI_DATA
#       ) RANK_TABLE
#     GROUP BY RANK_TABLE.RANK_OF_SIZE, RANK_TABLE.ID
#     ORDER BY RANK_TABLE.ID ASC
    
-- ---------------------------------------------------------
# 개선된 풀이
# GPT 답변 : https://chatgpt.com/share/66f82945-8fb0-8006-8dc6-0d933f31c050

WITH RANKED_ECOLI AS (
    SELECT
        ID,
        SIZE_OF_COLONY,
        NTILE(4) OVER (ORDER BY SIZE_OF_COLONY DESC) AS RANKING
    FROM
        ECOLI_DATA
)
SELECT
    ID,
    CASE 
        WHEN RANKING = 1 THEN 'CRITICAL'
        WHEN RANKING = 2 THEN 'HIGH'
        WHEN RANKING = 3 THEN 'MEDIUM'
        ELSE 'LOW'
    END AS COLONY_NAME
FROM
    RANKED_ECOLI
ORDER BY
    ID ASC;


/*
쿼리 설명:
WITH RANKED_ECOLI AS: 먼저 SIZE_OF_COLONY를 내림차순으로 정렬하고, NTILE(4)를 사용하여 데이터를 4등분합니다. 이때 각 개체는 1~4까지의 등급(RANKING)을 부여받습니다.

NTILE(4) 함수는 데이터를 4개의 구간으로 나누고 각 구간에 숫자 1, 2, 3, 4를 부여합니다. 내림차순으로 정렬하므로 1이 가장 큰 값에 해당하고, 4가 가장 작은 값에 해당합니다.
CASE WHEN: 각 RANKING 값을 기반으로 새로운 그룹 이름(COLONY_NAME)을 설정합니다.

RANKING = 1: 'CRITICAL'
RANKING = 2: 'HIGH'
RANKING = 3: 'MEDIUM'
RANKING = 4: 'LOW'
ORDER BY ID ASC: 결과는 ID 기준으로 오름차순으로 정렬됩니다.

NTILE(4) 함수 설명:
NTILE(n) 함수는 데이터를 n개의 구간으로 나눠서 각 데이터에 1부터 n까지의 번호를 할당합니다. 이 번호는 데이터의 순서에 따라 결정되며, 여기서는 내림차순으로 크기를 기준으로 나눴기 때문에, 큰 값일수록 1에 가까운 구간에 할당됩니다.
*/