# IS NULL, IS NOT NULL, IF NULL 관련 참고 사이트 
# https://ssafy-story.tistory.com/64

    SELECT MEMBER_ID, MEMBER_NAME, GENDER, date_format(DATE_OF_BIRTH, "%Y-%m-%d") as 'DATE_OF_BIRTH'
      FROM MEMBER_PROFILE
     WHERE MONTH(DATE_OF_BIRTH) = 3
       AND TLNO IS NOT NULL
       AND GENDER = 'W'
  ORDER BY MEMBER_ID asc;