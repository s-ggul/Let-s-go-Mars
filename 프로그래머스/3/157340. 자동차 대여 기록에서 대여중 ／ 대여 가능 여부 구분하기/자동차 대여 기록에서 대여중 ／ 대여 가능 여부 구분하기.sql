SELECT CAR_ID, 
       CASE 
           WHEN COUNT(
           CASE 
               WHEN START_DATE <= '2022-10-16' AND END_DATE >= '2022-10-16' THEN 1
               ELSE NULL
               END
           ) >= 1 
       THEN "대여중"
       ELSE "대여 가능"
       END AS AVAILABILITY
  FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
 GROUP BY CAR_ID
 ORDER BY CAR_ID DESC;
 
 /*
 ## ELSE 조건이 0 이 아니라 NULL 이여야 정답이 되는 이유
 
 1. COUNT() 함수의 동작
**COUNT(expression)**는 expression이 NULL이 아닌 값의 개수를 셉니다.
즉, COUNT()는 NULL을 무시하고, NULL이 아닌 값만 계산합니다.

2. CASE 문의 동작
CASE 문에서 THEN 1은 대여 중인 경우에 1을 반환하고, ELSE NULL은 대여 중이 아닌 경우에 NULL을 반환합니다.
만약 ELSE 0으로 설정하면, 0은 NULL이 아니므로 COUNT()에 포함됩니다.

3. 왜 NULL을 사용해야 하는가?
COUNT()가 NULL을 무시하기 때문에, 대여 중이 아닌 경우 0을 포함하지 않도록 해야 합니다. NULL을 반환하면 그 값은 무시되므로 대여 중인 경우에만 카운트됩니다.
만약 0을 반환하게 되면, COUNT(0)은 0을 유효한 값으로 간주하여 해당 레코드도 카운트하게 되어 잘못된 결과를 초래할 수 있습니다.
예시
START_DATE <= '2022-10-16' AND END_DATE >= '2022-10-16'가 참인 경우에만 1이 반환되고, 그 외에는 NULL이 반환되므로 대여 중인 경우만 카운트됩니다.
정리
NULL을 사용하면 대여 중이 아닌 경우는 카운트되지 않기 때문에 정확히 "대여중"인 경우만 계산됩니다. 0을 사용하면 COUNT(0)에서 대여 중이 아닌 행도 카운트되기 때문에 원하는 결과를 얻을 수 없습니다.
 */