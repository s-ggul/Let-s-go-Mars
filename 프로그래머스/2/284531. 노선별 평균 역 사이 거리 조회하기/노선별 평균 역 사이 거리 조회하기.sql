# 정렬할때 TOTAL_DISTANCE로 orde by를 해버리면 Concat에 의해 문자열 사전식 정렬로 진행된다.
# 이경우 사전식으로 정렬하게되기 때문에 원하는 결과가 안나올수도 있음. 
# 따라서 ORDER BY의 조건을 새롭게 정해주어야함.

SELECT ROUTE, CONCAT(ROUND(SUM(D_BETWEEN_DIST), 1), "km") AS `TOTAL_DISTANCE`, CONCAT(ROUND(AVG(D_BETWEEN_DIST), 2), "km") AS AVERAGE_DISTANCE
    FROM SUBWAY_DISTANCE
GROUP BY ROUTE
ORDER BY ROUND(SUM(D_BETWEEN_DIST), 1) DESC;