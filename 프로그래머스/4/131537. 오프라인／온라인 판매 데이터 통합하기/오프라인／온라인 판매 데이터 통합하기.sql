# MYSQL에는 기본적으로 FULL OUTER JOIN 을 지원하지 않음 -> 따라서 해당 문제를 풀기위해선 leftjoin의 결과와 rightjoin의 결과를 union 하여 fullouterjoin 효과를 내야함. 
# 하지만 해당 문제는 단순히 UNION을 활용해서도 풀어낼 수 있음.
# 그 과정에서 두개의 테이블의 컬럼 종류가 다를때 아래의 OFFLINE 테이블에서 의도적으로 컬럼에 NULL을 가진 컬럼을 추가하는 방식을 사용
# 맞는 방식인지는 모르겠으나 필요시 요긴한 방법으로 생각됨.
# +) 추가적으로 앞서서 NULL로 값을 넣어놓다 보니 뒤에서도 추가적인 장치가 필요없었음.

SELECT date_format(SALES_DATE, "%Y-%m-%d") as SALES_DATE, 
       PRODUCT_ID,
       USER_ID, 
       SALES_AMOUNT
  FROM (
    SELECT SALES_DATE, 
           PRODUCT_ID, 
           USER_ID, 
           SALES_AMOUNT
    FROM ONLINE_SALE
    WHERE SALES_DATE BETWEEN '2022-03-01' AND '2022-03-31'

    UNION

    SELECT SALES_DATE, 
           PRODUCT_ID, 
           NULL AS USER_ID,  -- USER_ID는 NULL로 설정
           SALES_AMOUNT
    FROM OFFLINE_SALE
    WHERE SALES_DATE BETWEEN '2022-03-01' AND '2022-03-31'
) as FULLTABLE
ORDER BY SALES_DATE ASC, PRODUCT_ID ASC, USER_ID ASC;
 -- 정렬 조건: 판매일 오름차순, 상품 ID 오름차순, 유저 ID 오름차순