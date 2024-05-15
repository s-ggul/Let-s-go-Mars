-- 코드를 입력하세요
SELECT new_table.USER_ID, new_table.PRODUCT_ID
FROM (
    SELECT *,count(*) as 'row_count'
    FROM ONLINE_SALE
    GROUP BY USER_ID, PRODUCT_ID
) as new_table
WHERE new_table.row_count >= 2
ORDER BY new_table.USER_ID, new_table.PRODUCT_ID DESC;