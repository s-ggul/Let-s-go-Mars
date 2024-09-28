#     각 쿼리문의 실행 순서:
# 1. FROM ECOLI_DATA e: e라는 별칭으로 첫 번째 테이블을 읽습니다.
# 2. LEFT JOIN ECOLI_DATA c ON e.ID = c.PARENT_ID: 조인 조건(e.ID = c.PARENT_ID)에 따라 두 번째 테이블 c와 e를 연결합니다. 여기서 LEFT JOIN은 자식이 없는 부모도 포함시키는 역할을 합니다.
# 3. GROUP BY e.ID: e.ID를 기준으로 그룹화하여, 각 부모 개체별로 데이터를 모읍니다.
# 4. COUNT(c.PARENT_ID): 그룹화된 각 부모 개체에 대해 자식 개체 수를 셉니다. 자식이 없는 경우는 NULL이 되므로, 이후에 이를 처리합니다.
# 5. COALESCE(COUNT(c.PARENT_ID), 0): 자식이 없는 경우는 COUNT 결과가 NULL이 될 수 있기 때문에, COALESCE를 사용하여 NULL을 0으로 변환합니다.
# 6. SELECT: 최종적으로 선택할 컬럼들을 지정합니다. 여기서는 e.ID와 CHILD_COUNT를 선택합니다.
# 7. ORDER BY e.ID ASC: 결과를 e.ID 기준으로 오름차순으로 정렬하여 출력합니다.
    
# +) COALESCE : 컬럼을 병합하지 않고 하나의 컬럼 안에 있는 결측치를 다른 값으로 바꾸고 싶을 때 사용할 수 있습니다.

    SELECT E.ID, COALESCE(COUNT(C.PARENT_ID), 0) AS CHILD_COUNT
      FROM ECOLI_DATA  E
 LEFT JOIN ECOLI_DATA  C
        ON E.ID = C.PARENT_ID
  GROUP BY E.ID
  ORDER BY E.ID ASC;
       