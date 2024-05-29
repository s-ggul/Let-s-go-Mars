# MYSQL 숫자 함수 : 반올림, 올림, 내림 => https://jjeongil.tistory.com/928
# MYSQL 집계 함수 : COUNT, SUM, AVG, GROUP BY https://m-datastudy.tistory.com/10
# 단순히 두 개의 테이블을 나열하는 것은 각 테이블 별 행에 대한 카르테시안 곱을 의미한다. 
# 즉, 각각의 테이블에 3, 2 개의 행이 존재한다면 결과 테이블에는 3 * 2 = 6개의 행을 가진다는 의미이다.
# 해당 문제는 "%서울%로 풀면 틀림... 왜? => 후반 트스트 케이스 중 '부산광역시 서울빌딩' 이라고 있으면 틀리긴함.. ㄷㄷ" 
# 심지어 LEFT OUTER JOIN 인줄 암.. 값이 없으면 0으로 나오게 하라는 문장이 없다고 이러는건 좀 아닌듯
 
         SELECT RI.REST_ID, REST_NAME, FOOD_TYPE, FAVORITES, ADDRESS, AVG_SCORE as SCORE
           FROM REST_INFO AS RI
     INNER JOIN (
                SELECT REST_ID,ROUND(AVG(REVIEW_SCORE),2) AS AVG_SCORE
                  FROM REST_REVIEW
                  WHERE REST_ID IS NOT NULL
                GROUP BY REST_ID
            ) 
             AS RR
             ON RI.REST_ID = RR.REST_ID
          WHERE RI.ADDRESS LIKE('서울%')
       ORDER BY RR.AVG_SCORE DESC, RI.FAVORITES DESC;