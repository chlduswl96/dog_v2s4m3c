DROP TABLE o_pg;
 
CREATE TABLE o_pg(
  num NUMBER(5) NOT NULL,
  title  VARCHAR(20) NOT NULL,
  PRIMARY KEY(num)
);

-- 서브 쿼리: SQL 내부에 SQL 사용, ()가 존재해야함, 독립적으로 실행 가능.
-- (SELECT NVL(MAX(num), 0) +1 as num FROM pg)
-- MAX(): 최대값을 가져오는 함수, 레코드가 없으면 null을 리턴
-- NVL(MAX(num), 0): MAX 함수가 null이면 특정값으로 대체
SELECT NVL(MAX(num), 0) +1 as num FROM o_pg

INSERT INTO o_pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM o_pg), '01월');
INSERT INTO o_pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM o_pg), '02월');
INSERT INTO o_pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM o_pg), '03월');
INSERT INTO o_pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM o_pg), '04월');
INSERT INTO o_pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM o_pg), '05월');
INSERT INTO o_pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM o_pg), '06월');
INSERT INTO o_pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM o_pg), '07월');
INSERT INTO o_pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM o_pg), '08월');
INSERT INTO o_pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM o_pg), '09월');
INSERT INTO o_pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM o_pg), '10월');
INSERT INTO o_pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM o_pg), '11월');
INSERT INTO o_pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM o_pg), '12월');
 
SELECT num, title FROM o_pg;
 
 NUM TITLE
 --- -----
   1 01월
   2 02월
   3 03월
   4 04월
   5 05월
   6 06월
   7 07월
   8 08월
   9 09월
  10 10월
  11 11월
  12 12월
 
-- 분기별로 분할하여 레코드를 추출하는 경우(페이징)
SELECT num, title FROM o_pg;
 
-- rownum: oralce system에서 select시에 자동으로 붙여주는 일련번호
SELECT num, title, rownum FROM o_pg;
 
 NUM TITLE ROWNUM
 --- ----- ------
   1 01월        1
   2 02월        2
   3 03월        3
   4 04월        4
   5 05월        5
   6 06월        6
   7 07월        7
   8 08월        8
   9 09월        9
  10 10월       10
  11 11월       11
  12 12월       12
 
-- 2,3월 삭제
DELETE FROM o_pg WHERE num=2 or num=3;
 
SELECT num, title, rownum FROM o_pg;
 
 NUM TITLE ROWNUM
 --- ----- ------
   1 01월        1
   4 04월        2
   5 05월        3
   6 06월        4
   7 07월        5
   8 08월        6
   9 09월        7
  10 10월        8
  11 11월        9
  12 12월       10
 
 
-- 페이징시는 일정한 순차값이 생성되는 rownum 값을 사용합니다.
-- rownum주의: rownum은 정렬(ORDER BY ~)보다 먼저 생성됨으로
   정렬을 한 후 rownum 컬럼을 사용합니다.
 
INSERT INTO o_pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM pg), '봄');
INSERT INTO o_pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM pg), '여름');
INSERT INTO o_pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM pg), '가을');
INSERT INTO o_pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM pg), '겨울');
 
-- Paging Step 1
-- SELECT → ROWNUM 생성 → ORDER BY ~
SELECT num, title, rownum 
FROM o_pg
ORDER BY title ASC;
 
 NUM TITLE ROWNUM
 --- ----- ------
   1 01월        1
   4 04월        4
   5 05월        5
   6 06월        6
   7 07월        7
   8 08월        8
   9 09월        9
  10 10월       10
  11 11월       11
  12 12월       12
  15 가을         2
  16 겨울         3
  13 봄         13
  14 여름        14
  
  
-- Paging Step 2, subquery, 내부 View의 사용
SELECT num, title, rownum
FROM (
           SELECT num, title 
           FROM o_pg
           ORDER BY num ASC
);
 
  NUM TITLE ROWNUM
 --- ----- ------
   1 01월        1
   4 04월        2
   5 05월        3
   6 06월        4
   7 07월        5
   8 08월        6
   9 09월        7
  10 10월        8
  11 11월        9
  12 12월       10
  13 봄          11
  14 여름        12
  15 가을        13
  16 겨울        14

-- 존재하지 않는 컬럼의 사용시 ERROR
SELECT num, title, rownum
FROM (
           SELECT num 
           FROM o_pg
           ORDER BY num ASC
);  
-- ORA-00904: "TITLE": invalid identifier
  
-- 2,3 월을 추가하세요.
INSERT INTO o_pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM pg), '02월');
INSERT INTO o_pg(num, title)
VALUES((SELECT NVL(MAX(num), 0) +1 as num FROM pg), '03월');
 
SELECT num, title
FROM pg;

 NUM TITLE
 --- -----
   1 01월
  15 가을
  16 겨울
   4 04월
   5 05월
   6 06월
   7 07월
   8 08월
   9 09월
  10 10월
  11 11월
  12 12월
  13 봄
  14 여름
  17 02월
  18 03월
  

-- 목록 다시 출력, ☆ rownum이 생성되고 정렬 기능이 작동함
-- SELECT → ROWNUM 생성 → ORDER BY ~
SELECT num, title, rownum
FROM o_pg
ORDER BY title ASC;
  
 NUM TITLE ROWNUM
 --- ----- ------
   1 01월        1
  17 02월       15
  18 03월       16
   4 04월        4
   5 05월        5
   6 06월        6
   7 07월        7
   8 08월        8
   9 09월        9
  10 10월       10
  11 11월       11
  12 12월       12
  15 가을         2
  16 겨울         3
  13 봄          13
  14 여름        14
  
-- Subquery에서 정렬후 rownum을 사용
SELECT num, title, rownum
FROM (
           SELECT num, title
           FROM o_pg
           ORDER BY title ASC
);
 
 NUM TITLE ROWNUM
 --- ----- ------
   1 01월        1
  17 02월        2
  18 03월        3
   4 04월        4
   5 05월        5
   6 06월        6
   7 07월        7
   8 08월        8
   9 09월        9
  10 10월       10
  11 11월       11
  12 12월       12
  15 가을        13
  16 겨울        14
  13 봄          15
  14 여름        16
 
-- 2단으로 레코드 분할시 문제점 발생 
-- 하나의 페이지는 레코드 3개로 구성 
SELECT num, title, rownum
FROM (
           SELECT num, title
           FROM o_pg
           ORDER BY title ASC
)
WHERE rownum>=1 AND rownum <=3;
 
 NUM TITLE ROWNUM
 --- ----- ------
   1 01월        1
  17 02월        2
  18 03월        3
 
-- 2 페이지 출력시 문제 발생 
SELECT num, title, rownum
FROM (
           SELECT num, title
           FROM o_pg
           ORDER BY title ASC
)
WHERE rownum>=4 AND rownum <=6;
 
 NUM TITLE ROWNUM
 --- ----- ------
 
-- Paging Step 3, subquery
-- 1 분기
SELECT num, title, r
FROM(
         SELECT num, title, rownum as r
         FROM (
                   SELECT num, title 
                   FROM o_pg
                   ORDER BY title ASC
         )  
)
WHERE r>=1 AND r <=3;
 
 NUM TITLE R
 --- ----- -
   1 01월   1
  17 02월   2
  18 03월   3
   
-- 2 분기
SELECT num, title, r
FROM(
         SELECT num, title, rownum as r
         FROM (
                   SELECT num, title 
                   FROM o_pg
                   ORDER BY title ASC
         )  
)
WHERE r>=4 AND r <=6;
   
 NUM TITLE R
 --- ----- -
   4 04월   4
   5 05월   5
   6 06월   6