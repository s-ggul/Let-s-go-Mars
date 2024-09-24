# 먼저 DATETIME 을 기준으로 정렬하여 최근에 들어온 동물이 최상단에 위치하도록 한 다음
  # LIMIT 절을 사용해서 위에서 부터 n개를 출력한다.
  SELECT NAME
    FROM ANIMAL_INS
ORDER BY DATETIME ASC
   LIMIT 1;