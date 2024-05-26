# %M은 월의 이름(ex : january, February)을, %D는 날짜의 서수(ex : 1th, 2nd)를 나타냄

# MySQL에서는 PUBLISHED_DATE가 DATE 타입일 경우, 이를 문자열로 변환할 필요 없이 바로 비교할 수 있음

   SELECT BOOK_ID, date_format(PUBLISHED_DATE, "%Y-%m-%d") as 'PUBLISHED_DATE'
     FROM BOOK
    WHERE CATEGORY = '인문'
      AND PUBLISHED_DATE >= '2021-01-01'
      AND PUBLISHED_DATE <= '2021-12-31'
 ORDER BY PUBLISHED_DATE;
 
 #  아래도 정답
 #    SELECT BOOK_ID, date_format(PUBLISHED_DATE, "%Y-%m-%d") as 'PUBLISHED_DATE'
 #     FROM BOOK
 #    WHERE CATEGORY = '인문'
 #      AND date_format(PUBLISHED_DATE, "%Y-%m-%d") >= '2021-01-01'
 #      AND date_format(PUBLISHED_DATE, "%Y-%m-%d") <= '2021-12-31'
 # ORDER BY PUBLISHED_DATE;