/**********************************/
/* Table Name: 첨부파일 */
/**********************************/
DROP TABLE attachfile_inquiry;
CREATE TABLE attachfile_inquiry(
    attachfileno                  NUMBER(10)     NOT NULL    PRIMARY KEY,
    iqynum                       NUMBER(10)     NOT NULL ,
    fname                        VARCHAR2(100) NOT NULL,
    fupname                     VARCHAR2(100)     NOT NULL,
    thumb                        VARCHAR2(100)    NULL ,
    fsize                           NUMBER(10)     DEFAULT 0     NOT NULL,
    fdate                          DATE     NOT NULL,
  FOREIGN KEY (iqynum) REFERENCES one_inquiry (iqynum)
);

COMMENT ON TABLE attachfile_inquiry is '첨부파일';
COMMENT ON COLUMN attachfile_inquiry.attachfileno is '첨부파일번호';
COMMENT ON COLUMN attachfile_inquiry.iqynum is '문의번호';
COMMENT ON COLUMN attachfile_inquiry.fname is '원본 파일명';
COMMENT ON COLUMN attachfile_inquiry.fupname is '업로드 파일명';
COMMENT ON COLUMN attachfile_inquiry.thumb is 'Thumb 파일';
COMMENT ON COLUMN attachfile_inquiry.fsize is '파일 사이즈';
COMMENT ON COLUMN attachfile_inquiry.fdate is '등록일';

-- 1) 등록
SELECT NVL(MAX(attachfileno), 0) + 1 as attachfileno FROM attachfile_inquiry;

 ATTACHFILENO
 ------------
            1

SELECT contentsno, memberno, categrpno, title
FROM contents
ORDER BY contentsno ASC;
          
INSERT INTO attachfile_inquiry(attachfileno, iqynum, fname, fupname, thumb, fsize, fdate)
VALUES((SELECT NVL(MAX(attachfileno), 0) + 1 as attachfileno FROM attachfile_inquiry),
             1, 'samyang.jpg', 'samyang_1.jpg', 'samyang_t.jpg', 1000, sysdate);
       
             
-- 2) 목록( contentsno 기준 내림 차순, attachfileno 기준 오르차순)
SELECT attachfileno, iqynum, fname, fupname, thumb, fsize, fdate
FROM attachfile_inquiry
ORDER BY iqynum DESC,  attachfileno ASC;

 ATTACHFILENO CONTENTSNO FNAME        FUPNAME        THUMB          FSIZE RDATE
 ------------ ---------- ------------ -------------- -------------- ----- ---------------------
            1          1 samyang.jpg  samyang_1.jpg  samyang_t.jpg   1000 2019-12-04 14:50:51.0
            2          1 samyang2.jpg samyang2_1.jpg samyang2_t.jpg  2000 2019-12-04 14:50:52.0
            3          1 samyang3.jpg samyang3_1.jpg samyang3_t.jpg  3000 2019-12-04 14:50:53.0

-- 3) 글별 파일 목록(contentsno 기준 내림 차순, attachfileno 기준 오르차순)
SELECT attachfileno, iqynum, fname, fupname, thumb, fsize, rdate
FROM attachfile_inquiry
WHERE iqynum = 1
ORDER BY fname ASC;

 ATTACHFILENO CONTENTSNO FNAME        FUPNAME      THUMB          FSIZE  RDATE
 ------------ ---------- ------------ ------------ -------------- ------ ---------------------
            1          1 car1.jpg     car1_0.jpg   car1_0_t.jpg    12099 2019-12-04 15:01:20.0
            2          1 car2.jpg     car2_0.jpg   car2_0_t.jpg    10553 2019-12-04 15:01:20.0
            3          1 car3.jpg     car3.jpg     car3_t.jpg       9208 2019-12-04 15:01:20.0
            4          1 car4.jpg     car4.jpg     car4_t.jpg      11819 2019-12-04 15:01:20.0
            5          1 car5.jpg     car5.jpg     car5_t.jpg       9976 2019-12-04 15:01:20.0
            9          1 moon.zip     moon.zip     NULL           292777 2019-12-05 10:14:12.0
            6          1 spring18.jpg spring18.jpg spring18_t.jpg 444455 2019-12-05 09:55:07.0
            7          1 spring19.jpg spring19.jpg spring19_t.jpg 126983 2019-12-05 09:55:07.0
            8          1 spring20.jpg spring20.jpg spring20_t.jpg 345322 2019-12-05 09:55:07.0

-- 4) 하나의 파일 삭제
DELETE FROM attachfile
WHERE attachfileno = 1;


-- 5) FK contentsno 부모 테이블별 레코드 갯수 산출
SELECT attachfileno, contentsno, fname, fupname, thumb, fsize, rdate
FROM attachfile
WHERE contentsno=1;

ATTACHFILENO CONTENTSNO FNAME        FUPNAME      THUMB          FSIZE  RDATE
 ------------ ---------- ------------ ------------ -------------- ------ ---------------------
            1          1 car3.jpg     car3.jpg     car3_t.jpg       9208 2019-12-04 15:01:20.0
            2          1 car4.jpg     car4.jpg     car4_t.jpg      11819 2019-12-04 15:01:20.0
            3          1 car5.jpg     car5.jpg     car5_t.jpg       9976 2019-12-04 15:01:20.0

SELECT COUNT(*) as cnt
FROM attachfile
WHERE contentsno=1;

 CNT
 ---
   3             
             
-- 6) FK 부모 테이블별 레코드 삭제
DELETE FROM attachfile
WHERE contentsno=1;

(3 rows affected)