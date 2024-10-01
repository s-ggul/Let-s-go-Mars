/*
    YEAR() : 년만 추출
    MONTH() : 월만 추출
    DAY() : 일만 추출
    */
WITH CTE_CAR_RENTAL AS (
    SELECT CAR_ID, COUNT(*) AS COUNT
      FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
     WHERE START_DATE BETWEEN "2022-08-01" AND "2022-10-31"
    # 대여 시작일을 기준으로 2022년 8월부터 2022년 10월까지 총 대여 횟수가 5회 이상인 자동차들 정보를 추출하기 위함 [1]
  GROUP BY CAR_ID
    HAVING COUNT >= 5
)

    SELECT MONTH(C2.START_DATE) AS MONTH, C2.CAR_ID, COUNT(*) AS RECORDS
      FROM CTE_CAR_RENTAL C1
INNER JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY C2
        ON C1.CAR_ID = C2.CAR_ID
     WHERE START_DATE BETWEEN "2022-08-01" AND "2022-10-31"
     # CTE 테이블과 별개로 새로운 JOIN 대상인 C2에 대한 기간을 설정하기 위함.
     # 만일 설정하지 않는다면?
     # C2 테이블에 7월에 해당하는 데이터가 있다고 가정
     # CTE를 통해서는 걸러지겠지만 이후 join하는 과정에서 C2에 있는 CAR_ID 와 CTE의 CAR_ID 가 동일하게 되고
     # 이후 결과에 7월이 포함되는 경우가 생길 수 있음. 
  GROUP BY MONTH(C2.START_DATE), CAR_ID
    HAVING RECORDS != 0
  ORDER BY MONTH ASC, CAR_ID DESC;