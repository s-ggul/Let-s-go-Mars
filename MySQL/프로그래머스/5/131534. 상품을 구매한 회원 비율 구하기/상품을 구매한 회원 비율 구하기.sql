WITH CTE_2021 AS (
    SELECT OS.ONLINE_SALE_ID, UI.USER_ID, OS.PRODUCT_ID, OS.SALES_AMOUNT, OS.SALES_DATE
      FROM USER_INFO UI
 LEFT JOIN ONLINE_SALE OS
        ON UI.USER_ID = OS.USER_ID
     WHERE UI.JOINED BETWEEN "2021-01-01" AND "2021-12-31"
)

  SELECT YEAR(C.SALES_DATE) AS `YEAR`, MONTH(C.SALES_DATE) AS `MONTH`, 
          COUNT(DISTINCT USER_ID) AS PURCHASED_USERS, 
          ROUND((COUNT(DISTINCT USER_ID) / (SELECT COUNT(DISTINCT USER_ID) FROM CTE_2021)), 1) AS PUCHASED_RATIO
    FROM CTE_2021 C
   WHERE SALES_AMOUNT IS NOT NULL
GROUP BY `YEAR`, `MONTH`
ORDER BY `YEAR` ASC, `MONTH` ASC;