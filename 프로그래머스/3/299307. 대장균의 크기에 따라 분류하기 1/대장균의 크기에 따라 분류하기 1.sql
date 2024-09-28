# GROUP BY CASE 에 대한 질문
# https://chatgpt.com/share/66f82945-8fb0-8006-8dc6-0d933f31c050

  SELECT ID, 
         CASE
              WHEN SIZE_OF_COLONY > 1000 THEN "HIGH"
              WHEN SIZE_OF_COLONY > 100 THEN "MEDIUM"
              ELSE "LOW"
         END AS SIZE
    FROM ECOLI_DATA

       
         