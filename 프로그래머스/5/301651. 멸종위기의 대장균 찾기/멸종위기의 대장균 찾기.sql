# WITH RECURSIVE - AS 를 사용해서 재귀적으로 해야 동적인 세대 수를 구할 수 있음.
WITH RECURSIVE CTE_ECOLI AS (
    -- Anchor member: 재귀의 시작점 (1세대)
    SELECT ID, PARENT_ID, 1 AS GENERATION
      FROM ECOLI_DATA
     WHERE PARENT_ID IS NULL
    
    UNION
    
    -- Recursive member: 각 세대의 자식들을 찾는 부분
    SELECT CHILD.ID, CHILD.PARENT_ID, PARENT.GENERATION + 1
      FROM ECOLI_DATA CHILD
      JOIN CTE_ECOLI PARENT # 초기 1세대부터 시작하는 테이블
        ON CHILD.PARENT_ID = PARENT.ID
)

 
# 자식이 없는 개체 찾기
# LEFT JOIN 을 통해서 우선 재귀로 세대를 찾아놨던 CTE_ECOLI에 부모의 이름이 같은 행들을 다 엮어놓음
# 그러면 자식이 없는 경우에는 E2.ID 가 NULL 로 표시되게 되고 이후 GENERATION으로 GROUB BY를 한다음 COUNT를 하게됨.
# 그 후 ORDER BY 절 실행

   SELECT COUNT(*) AS COUNT, E1.GENERATION
     FROM CTE_ECOLI E1
LEFT JOIN ECOLI_DATA E2
       ON E1.ID = E2.PARENT_ID
    WHERE E2.ID IS NULL  -- 자식이 없는 경우
 GROUP BY GENERATION
 ORDER BY GENERATION;
 
/*
1. FROM CTE_ECOLI E1
먼저, 쿼리는 **CTE_ECOLI**라는 CTE(Common Table Expression)에서 데이터를 읽습니다. 여기서 E1이라는 별칭을 사용하여 각 세대의 대장균 데이터를 가져옵니다.
이 단계에서는 CTE가 먼저 실행되었다고 가정하며, 재귀적으로 세대별 대장균 정보를 가지고 있는 상태입니다.

2. LEFT JOIN ECOLI_DATA E2 ON E1.ID = E2.PARENT_ID
**CTE_ECOLI**의 각 대장균 (E1.ID)을 기준으로 ECOLI_DATA 테이블을 LEFT JOIN하여 자식 개체 (E2.PARENT_ID)가 있는지 확인합니다.
E1.ID는 부모 개체의 ID이고, E2.PARENT_ID는 자식의 부모 ID를 나타냅니다.
이 LEFT JOIN을 통해 각 개체가 자식이 있는지 여부를 확인합니다. 자식이 없는 경우 E2.ID는 NULL로 반환됩니다.

3. WHERE E2.ID IS NULL
자식이 없는 개체만을 선택하기 위해, LEFT JOIN 결과에서 E2.ID IS NULL인 행만 필터링합니다.
즉, 부모 개체이지만, 자식이 존재하지 않는 경우를 추출하는 단계입니다.

4. GROUP BY E1.GENERATION
자식이 없는 대장균들을 세대(GENERATION)별로 그룹화합니다.
세대별로 묶어서 각 세대의 자식이 없는 개체들을 구분합니다.

5. SELECT COUNT(*) AS COUNT, E1.GENERATION
각 세대에서 자식이 없는 개체의 수를 세기 위해 COUNT(*)를 사용합니다. 이 값은 각 세대의 자식이 없는 개체 수를 나타냅니다.
E1.GENERATION을 선택하여 각 세대별로 자식이 없는 개체 수를 출력합니다.

6. ORDER BY E1.GENERATION
마지막으로, 세대별로 자식이 없는 개체의 수를 오름차순으로 정렬합니다.
세대 번호가 작은 것부터 순서대로 결과를 출력합니다.
*/