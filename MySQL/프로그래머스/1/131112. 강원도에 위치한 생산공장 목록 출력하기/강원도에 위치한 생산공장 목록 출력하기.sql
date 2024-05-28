# 1. 특정 문자로 시작하는 데이터 검색
# SELECT [필드명] FROM [테이블명] WHERE [필드명] LIKE '특정 문자열%';

# 2. 특정 문자로 끝나는 데이터 검색
# SELECT [필드명] FROM [테이블명] WHERE [필드명] LIKE '%특정 문자열';

# 3. 특정 문자를 포함하는  데이터  검색
# SELECT [필드명] FROM [테이블명] WHERE [필드명] LIKE '%특정 문자열%';
    
    SELECT FACTORY_ID, FACTORY_NAME, ADDRESS
      FROM FOOD_FACTORY
     WHERE ADDRESS LIKE '%강원도%'
  ORDER BY FACTORY_ID ASC;