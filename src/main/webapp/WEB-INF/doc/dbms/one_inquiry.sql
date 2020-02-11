/**********************************/
/* Table Name: 1대1 문의 */
/**********************************/
drop table one_inquiry;
CREATE TABLE one_inquiry(
    iqynum                    NUMBER(10)          NOT NULL  PRIMARY KEY,
    memno                    NUMBER(10)          NOT NULL,
    title                        VARCHAR2(100)     NOT NULL,
    content                   CLOB             NOT NULL,
    idate                       DATE                  NOT NULL,
    status                      VARCHAR2(10)   DEFAULT  'N'   NOT NULL ,
  FOREIGN KEY (memno) REFERENCES mem (memno)
);

COMMENT ON TABLE one_inquiry is '1대1 문의';
COMMENT ON COLUMN one_inquiry.iqynum is '문의번호';
COMMENT ON COLUMN one_inquiry.memno is '회원번호';
COMMENT ON COLUMN one_inquiry.title is '제목';
COMMENT ON COLUMN one_inquiry.content is '내용';
COMMENT ON COLUMN one_inquiry.idate is '등록일';
COMMENT ON COLUMN one_inquiry.status is '답변상태';

-- 등록
INSERT INTO one_inquiry(iqynum, memno, title, content, idate)
VALUES((SELECT NVL(MAX(iqynum), 0) + 1 as iqynum FROM one_inquiry), 1, '환불하고싶어요', '환불 어떻게 해요?', sysdate);

INSERT INTO one_inquiry(iqynum, memno, title, content, idate)
VALUES((SELECT NVL(MAX(iqynum), 0) + 1 as iqynum FROM one_inquiry), 1, '품절된 상품 언제 들어오나요?', '얼른 들어왔으면 하는데', sysdate);

INSERT INTO one_inquiry(iqynum, memno, title, content, idate)
VALUES((SELECT NVL(MAX(iqynum), 0) + 1 as iqynum FROM one_inquiry), 1, '품절된 상품 언제 들어오나요?', '얼dfsd데', sysdate);

INSERT INTO one_inquiry(iqynum, memno, title, content, idate)
VALUES((SELECT NVL(MAX(iqynum), 0) + 1 as iqynum FROM one_inquiry), 1, '품절된 상품 언제 들어오나요?', '얼d는데', sysdate);

INSERT INTO one_inquiry(iqynum, memno, title, content, idate)
VALUES((SELECT NVL(MAX(iqynum), 0) + 1 as iqynum FROM one_inquiry), 1, '품절된 상품 언제 들어오나요?', '얼hfgh데', sysdate);

INSERT INTO one_inquiry(iqynum, memno, title, content, idate)
VALUES((SELECT NVL(MAX(iqynum), 0) + 1 as iqynum FROM one_inquiry), 1, '품절된 상품 언제 들어오나요?', '얼른asdg데', sysdate);

INSERT INTO one_inquiry(iqynum, memno, title, content, idate)
VALUES((SELECT NVL(MAX(iqynum), 0) + 1 as iqynum FROM one_inquiry), 1, '품절된 상품 언제 들어오나요?', '얼dfgg하는데', sysdate);

INSERT INTO one_inquiry(iqynum, memno, title, content, idate)
VALUES((SELECT NVL(MAX(iqynum), 0) + 1 as iqynum FROM one_inquiry), 1, '품절된 상품 언제 들어오나요?', '얼sdf는데', sysdate);

INSERT INTO one_inquiry(iqynum, memno, title, content, idate)
VALUES((SELECT NVL(MAX(iqynum), 0) + 1 as iqynum FROM one_inquiry), 1, '품절된 상품 언제 들어오나요?', ' ㄴㅇㄹ', sysdate);

INSERT INTO one_inquiry(iqynum, memno, title, content, idate)
VALUES((SELECT NVL(MAX(iqynum), 0) + 1 as iqynum FROM one_inquiry), 1, '품절된 상품 언제 들어오나요?', 'sdfff', sysdate);


INSERT INTO one_inquiry(iqynum, memno, title, content, idate)
VALUES((SELECT NVL(MAX(iqynum), 0) + 1 as iqynum FROM one_inquiry), 2, '환불하고싶어요', '환불 어떻게 해요?', sysdate);

INSERT INTO one_inquiry(iqynum, memno, title, content, idate)
VALUES((SELECT NVL(MAX(iqynum), 0) + 1 as iqynum FROM one_inquiry), 2, '품절된 상품 언제 들어오나요?', '얼른 들어왔으면 하는데', sysdate);

-- 조회
SELECT iqynum, memno, title, content, idate, status
FROM one_inquiry
WHERE memno = 1;

SELECT iqynum, memno, title, content, idate, status
FROM one_inquiry
ORDER BY iqynum DESC
WHERE memno = 2;

-- 회원별 목록 조회
SELECT mem_iqyno ,memno
FROM (select rownum as mem_iqyno , memno from one_inquiry where memno=1);

-- 수정

UPDATE one_inquiry
SET content = '상품 교환하고 싶어요'
WHERE iqynum=1;

-- 삭제 
DELETE FROM one_inquiry
WHERE iqynum = 29;

-- 컬럼 추가

ALTER TABLE one_inquiry
ADD (status VARCHAR2(9) DEFAULT 'N' NOT NULL);

COMMENT ON COLUMN one_inquiry.status is '답변 상태';

UPDATE one_inquiry
SET status = 'Y'
WHERE (SELECT awcontent 
           FROM answer 
           WHERE one_inquiry.iqynum = answer.iqynum) is not null;

select * from one_inquiry order by iqynum desc;
select * from attachfile_inquiry;
SELECT NVL(MAX(iqynum), 0)  as iqynum FROM one_inquiry;

SELECT rownum as r, iqynum, memno, title, content, idate, status 
FROM one_inquiry 
WHERE memno = 2

-- step 1
SELECT iqynum, memno, title, content, idate, status
FROM one_inquiry
WHERE memno=1 
ORDER BY iqynum DESC;

-- step 2

SELECT rownum as r, iqynum, memno, title, content, idate, status
FROM (
          SELECT iqynum, memno, title, content, idate, status
          FROM one_inquiry
          WHERE memno=1 
          ORDER BY iqynum DESC
);


SELECT contentsno, memberno, categrpno, title, content, 
           recom, cnt, replycnt, rdate, word, rownum as r
FROM (
          SELECT contentsno, memberno, categrpno, title, content, 
                     recom, cnt, replycnt, rdate, word
          FROM contents
          WHERE categrpno=1 AND word LIKE '%스위스%'
          ORDER BY contentsno DESC
);

 R  IQYNUM MEMNO TITLE            CONTENT              IDATE                 STATUS
 -- ------ ----- ---------------- -------------------- --------------------- ------
  1     59     1 3333             3333                 2020-01-30 17:01:46.0 N
  2     56     1 gdfg             dfgdfgadfg           2020-01-15 09:55:23.0 N
  3     55     1 ggg              ggg                  2020-01-15 09:52:42.0 N
  4     54     1 ddd              dddd                 2020-01-15 09:49:34.0 N
  5     53     1 sdf              sdf                  2020-01-15 09:49:19.0 N
  6     52     1 불량 상품 반품 문의      불량 상품 반품             2020-01-08 17:17:07.0 N
  7     51     1 회원 탈퇴 문의         탈퇴하면 몇일 동안 재가입 불가인가요 2020-01-08 17:09:29.0 N
  8     49     1 ㅇㅁㅇ              ㅇㅁㅇ                  2019-12-26 14:44:36.0 N
  9     48     1 마이페이지            마이페이지                2019-12-23 16:07:25.0 N
 10     47     1 ㅈㄷㄱㄴ             ㄴㅇㄹ                  2019-12-16 18:04:29.0 N
 11      9     1 품절된 상품 언제 들어오나요? sdfff                2019-12-16 16:25:23.0 N
 12      8     1 품절된 상품 언제 들어오나요? 얼sdf는데               2019-12-06 18:02:43.0 N
 13      7     1 품절된 상품 언제 들어오나요? 얼dfgg하는데             2019-12-06 18:02:42.0 N
 14      6     1 품절된 상품 언제 들어오나요? 얼른asdg데              2019-12-06 18:02:41.0 N
 15      5     1 품절된 상품 언제 들어오나요? 얼hfgh데               2019-12-06 18:02:40.0 N
 16      3     1 품절된 상품 언제 들어오나요? 얼dfsd데               2019-12-06 18:02:38.0 N
 17      2     1 품절               품절                   2019-12-06 17:41:09.0 Y
 18      1     1 환불하고싶어요          환불 어떻게 해요?           2019-12-06 17:41:05.0 Y



-- step 3

SELECT r, iqynum, memno, title, content, idate, status
FROM (
					SELECT rownum as r, iqynum, memno, title, content, idate, status
					FROM (
					          SELECT iqynum, memno, title, content, idate, status
					          FROM one_inquiry
					          WHERE memno=1 
					          ORDER BY iqynum DESC
					)
);

 R  IQYNUM MEMNO TITLE            CONTENT              IDATE                 STATUS
 -- ------ ----- ---------------- -------------------- --------------------- ------
  1     59     1 3333             3333                 2020-01-30 17:01:46.0 N
  2     56     1 gdfg             dfgdfgadfg           2020-01-15 09:55:23.0 N
  3     55     1 ggg              ggg                  2020-01-15 09:52:42.0 N
  4     54     1 ddd              dddd                 2020-01-15 09:49:34.0 N
  5     53     1 sdf              sdf                  2020-01-15 09:49:19.0 N
  6     52     1 불량 상품 반품 문의      불량 상품 반품             2020-01-08 17:17:07.0 N
  7     51     1 회원 탈퇴 문의         탈퇴하면 몇일 동안 재가입 불가인가요 2020-01-08 17:09:29.0 N
  8     49     1 ㅇㅁㅇ              ㅇㅁㅇ                  2019-12-26 14:44:36.0 N
  9     48     1 마이페이지            마이페이지                2019-12-23 16:07:25.0 N
 10     47     1 ㅈㄷㄱㄴ             ㄴㅇㄹ                  2019-12-16 18:04:29.0 N
 11      9     1 품절된 상품 언제 들어오나요? sdfff                2019-12-16 16:25:23.0 N
 12      8     1 품절된 상품 언제 들어오나요? 얼sdf는데               2019-12-06 18:02:43.0 N
 13      7     1 품절된 상품 언제 들어오나요? 얼dfgg하는데             2019-12-06 18:02:42.0 N
 14      6     1 품절된 상품 언제 들어오나요? 얼른asdg데              2019-12-06 18:02:41.0 N
 15      5     1 품절된 상품 언제 들어오나요? 얼hfgh데               2019-12-06 18:02:40.0 N
 16      3     1 품절된 상품 언제 들어오나요? 얼dfsd데               2019-12-06 18:02:38.0 N
 17      2     1 품절               품절                   2019-12-06 17:41:09.0 Y
 18      1     1 환불하고싶어요          환불 어떻게 해요?           2019-12-06 17:41:05.0 Y

SELECT contentsno, memberno, categrpno, title, content, 
           recom, cnt, replycnt, rdate, word, r
FROM (
           SELECT contentsno, memberno, categrpno, title, content, 
                      recom, cnt, replycnt, rdate, word, rownum as r
           FROM (
                     SELECT contentsno, memberno, categrpno, title, content, 
                                recom, cnt, replycnt, rdate, word
                     FROM contents
                     WHERE categrpno=1 AND word LIKE '%스위스%'
                     ORDER BY contentsno DESC
           )          
);
