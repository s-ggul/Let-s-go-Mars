# IS NULL, IS NOT NULL, IF NULL 관련 참고 사이트 
# https://ssafy-story.tistory.com/64
# "여성" 회원 이라고 문제에 박혀있었음
# 조건 추출 => 문제 똑바로 읽을 것.
# YEAR, MONTH, DATE 함수 값 비교는 숫자 혹은 문자가 가능한 것 같음 

    SELECT MEMBER_ID, MEMBER_NAME, GENDER, date_format(DATE_OF_BIRTH, "%Y-%m-%d") as 'DATE_OF_BIRTH'
      FROM MEMBER_PROFILE
     WHERE MONTH(DATE_OF_BIRTH) = 3
       AND TLNO IS NOT NULL
       AND GENDER = 'W'
  ORDER BY MEMBER_ID ASC;