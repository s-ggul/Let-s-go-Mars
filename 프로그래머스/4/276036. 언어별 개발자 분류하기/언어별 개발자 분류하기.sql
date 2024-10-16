/*
조건도 SELECT 절에서와 마찬가지로 특정하게 지정해줘야함.
그냥 포함되었는지를 or로만 하면안되고 front이면서 python인거 or C#인거 or 그외 프론트인거 이렇게 가야함.
*/
WITH FrontendGroup AS (
    SELECT * 
      FROM SKILLCODES
     WHERE CATEGORY = "Front End"
),
CSharpCode AS (
    SELECT *
      FROM SKILLCODES
     WHERE NAME = "C#"
),
PythonCode AS (
    SELECT *
      FROM SKILLCODES
     WHERE NAME = "Python"
)

  SELECT CASE 
          WHEN (D.SKILL_CODE & (SELECT SUM(CODE) FROM FrontendGroup)) > 0 
           AND (D.SKILL_CODE & (SELECT CODE FROM PythonCode)) > 0 THEN "A"
          WHEN (D.SKILL_CODE & (SELECT CODE FROM CSharpCode)) > 0 THEN "B"
          WHEN (D.SKILL_CODE & (SELECT SUM(CODE) FROM FrontendGroup)) > 0 THEN "C"
          END AS GRADE,
          D.ID, D.EMAIL
    FROM DEVELOPERS D
   WHERE ((D.SKILL_CODE & (SELECT SUM(CODE) FROM FrontendGroup)) > 0
     AND (D.SKILL_CODE & (SELECT CODE FROM PythonCode))  > 0)
      OR (D.SKILL_CODE & (SELECT CODE FROM CSharpCode))  > 0
      OR (D.SKILL_CODE & (SELECT SUM(CODE) FROM FrontendGroup))
ORDER BY GRADE ASC, D.ID ASC;