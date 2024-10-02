# 한글로 컬럼명을 지정해주면 ORDER BY가 잘안되는데 이럴땐 `(백틱)으로 감싸면 해결된다.
  SELECT MCDP_CD AS `진료과 코드`, COUNT(*) AS `5월예약건수`
    FROM APPOINTMENT
   WHERE APNT_YMD BETWEEN '2022-05-01' AND '2022-05-31' 
GROUP BY MCDP_CD
ORDER BY `5월예약건수` ASC, `진료과 코드` ASC;