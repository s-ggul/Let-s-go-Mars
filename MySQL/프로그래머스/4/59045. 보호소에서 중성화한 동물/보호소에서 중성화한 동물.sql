   SELECT AO.ANIMAL_ID, AO.ANIMAL_TYPE, AO.NAME
     FROM ANIMAL_INS AI
LEFT JOIN ANIMAL_OUTS AO
       ON AI.ANIMAL_ID = AO.ANIMAL_ID
    WHERE AI.DATETIME < AO.DATETIME
      AND AI.ANIMAL_ID NOT IN (
        SELECT ANIMAL_ID
          FROM ANIMAL_INS
         WHERE (
             SEX_UPON_INTAKE LIKE "%Spayed%" 
             OR
             SEX_UPON_INTAKE LIKE "%Neutered%"
         )
      )
      AND (
          AO.SEX_UPON_OUTCOME LIKE "%Spayed%" 
          OR
          AO.SEX_UPON_OUTCOME LIKE "%Neutered%"
          )
  ORDER BY ANIMAL_ID;