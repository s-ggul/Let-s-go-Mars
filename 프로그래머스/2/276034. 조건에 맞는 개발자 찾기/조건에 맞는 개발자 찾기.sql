# SQL 비트마스킹 문제임.
# [CONV 사용해서 src 진수에서 trg 진수로 형변환 가능]
# 1. CONV : 숫자 기반 시스템을 다른 진법의 수로 변환해줌
# 2. CONV(데이터, 원본진법, 변환할 진법) 으로 문법 사용

# e.g.) CONV(15, 10, 2) -> 10진수 15를 2진수로 변환

-- 문제풀이에서 안되던 풀이가 있었음.
# SELECT ID, EMAIL, FIRST_NAME, LAST_NAME
#   FROM DEVELOPERS DEV
#  WHERE (CONV(DEV.SKILL_CODE, 10, 2) & CONV(256, 10, 2)) != 0
#     OR (CONV(DEV.SKILL_CODE, 10, 2) & CONV(1024, 10, 2)) != 0
-- 해당 풀이는 CONV를 통해 문자열 비트를 가져와 비트연산을 하게되면 의도치 않은 결과가 발생함
# MySQL은 이진수 문자열을 숫자로 변환하지 않기 때문에 & 연산이 제대로 동작하지 않습니다.
# 문자열에 대해 비트 연산을 할 수 없기 때문에 원하는 결과를 얻을 수 없습니다. 
# MySQL에서 CONV() 함수는 숫자가 아닌 문자열을 반환하므로, 이 연산은 제대로 작동하지 않습니다.

-- 2번 풀이
# 두 번째 쿼리에서는 DEV.SKILL_CODE와 256, 1024는 숫자 그대로 사용되며, MySQL에서 비트 연산이 제대로 적용됩니다. 숫자끼리의 & 연산은 예상한 대로 작동하므로 비트마스킹이 정확히 수행됩니다.
# 두 번째 쿼리 방식이 올바른 방식 
# 비트마스킹을 할 때는 CONV() 함수를 사용할 필요 없이 숫자 간의 비트 연산을 직접 수행하는 것이 맞습니다.

  SELECT DISTINCT ID, EMAIL, FIRST_NAME, LAST_NAME
    FROM DEVELOPERS DEV, (
        SELECT *
          FROM SKILLCODES
         WHERE NAME = 'Python'
            OR NAME = 'C#'
    ) TARGET_SKILL
   WHERE (DEV.SKILL_CODE & TARGET_SKILL.CODE) != 0
ORDER BY ID ASC;
