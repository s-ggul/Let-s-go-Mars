# 문제 출력 똑바로 읽을 것.
# 댓글 작성일인지 게시글 작성일인지 확실하게 구분 필요

SELECT TITLE, A.BOARD_ID, B.REPLY_ID, B.WRITER_ID, B.CONTENTS, date_format(B.CREATED_DATE, "%Y-%m-%d") as 'CREATED_DATE'    
  FROM USED_GOODS_BOARD as A
INNER JOIN USED_GOODS_REPLY as B
    ON A.BOARD_ID = B.BOARD_ID
 WHERE A.CREATED_DATE BETWEEN '2022-10-01' AND '2022-10-31'
ORDER BY B.CREATED_DATE asc, A.TITLE asc;

# SELECT TITLE, A.BOARD_ID, B.REPLY_ID, B.WRITER_ID, B.CONTENTS, date_format(B.CREATED_DATE, "%Y-%m-%d") as 'CREATED_DATE'    
#   FROM USED_GOODS_BOARD as A
# INNER JOIN USED_GOODS_REPLY as B
#     ON A.BOARD_ID = B.BOARD_ID
#  WHERE YEAR(A.CREATED_DATE) = 2022
#    AND MONTH(A.CREATED_DATE) = 10
# ORDER BY B.CREATED_DATE asc, A.TITLE asc;