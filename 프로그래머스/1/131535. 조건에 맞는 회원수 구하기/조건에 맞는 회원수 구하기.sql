SELECT COUNT(USER_ID)
  FROM USER_INFO
 WHERE JOINED BETWEEN "2021-01-01" and "2021-12-31"
   AND AGE BETWEEN 20 and 29;