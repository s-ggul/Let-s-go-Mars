-- 내풀이
/*
# 2세대 추출
WITH ECOLI_2ND AS (
    SELECT E1.ID AS PARENT_ID, E2.ID
      FROM ECOLI_DATA E1
 INNER JOIN ECOLI_DATA E2
        ON E1.ID = E2.PARENT_ID
),
# 3세대 이상 추출
ECOLI_OVER_3RD AS (
    SELECT E1.PARENT_ID, E2.ID
      FROM ECOLI_DATA E1
INNER JOIN ECOLI_2ND E2
        ON E1.ID = E2.PARENT_ID
     WHERE E1.PARENT_ID IS NOT NULL
)
  
# 3세대만 추출
    SELECT E2.ID
      FROM ECOLI_DATA E1
INNER JOIN ECOLI_OVER_3RD E2
        ON E1.ID = E2.PARENT_ID
     WHERE E1.PARENT_ID IS NULL
*/
     
-- GPT 형님 풀이

/*
SELF JOIN 개념을 사용했음. 
- SELF JOIN 과 INNER JOIN은 SQL 에서 같은 개념임. 다만, JOIN을 수행하는 테이블이 서로 다른 테이블이냐, 같은 테이블이냐 의 차이만 존재할 뿐임. 
- 이런 경우에는 SELF JOIN (JOIN) 이라고 명시해서 같은 테이블을 사용한다는 것을 알려줄 수 있음.
- 참고로 SQL 서버에서 SELF JOIN은 내부적으로 INNER JOIN으로 처리해서 사용됨.(결국 똑같은 동작이라는 뜻.)

해결 방법:
1세대: PARENT_ID가 NULL인 개체들.
2세대: 1세대를 부모로 하는 개체들.
3세대: 2세대를 부모로 하는 개체들.
이를 바탕으로 작성한 SQL 쿼리는 다음과 같습니다:
*/

SELECT E3.ID
  FROM ECOLI_DATA E1
  JOIN ECOLI_DATA E2 ON E1.ID = E2.PARENT_ID
  JOIN ECOLI_DATA E3 ON E2.ID = E3.PARENT_ID
 WHERE E1.PARENT_ID IS NULL
ORDER BY E3.ID;

/*
설명:
E1: 1세대 대장균(최초의 개체들)으로, PARENT_ID IS NULL 조건을 만족합니다.
E2: E1을 부모로 하는 2세대 대장균들.
E3: E2를 부모로 하는 3세대 대장균들.
최종적으로 E3에서 3세대 대장균의 ID를 오름차순 정렬하여 출력합니다.
이 쿼리는 대장균의 세대별 관계를 추적해 3세대 개체를 찾는 효율적인 방법입니다.
*/