/**********************************/
/* Table Name: 직원 */
/**********************************/
DROP TABLE employee;

CREATE TABLE employee(
		adminno                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY
);

COMMENT ON TABLE employee is '직원';
COMMENT ON COLUMN employee.adminno is '직원번호';


/**********************************/
/* Table Name: 공지사항 */
/**********************************/
DROP TABLE notice;

CREATE TABLE notice(
		noticeno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		noticetitle                   		VARCHAR2(100)		 NOT NULL,
		noticecont                    		CLOB		 NOT NULL,
		seqno                         		NUMBER(1)		 NOT NULL,
		visible                       		VARCHAR2(10)		 DEFAULT 'Y'		 NOT NULL,
		rdate                         		DATE		 NOT NULL,
		adminno                       		NUMBER(10)		 NULL 
 
);

/*   FOREIGN KEY (adminno) REFERENCES employee (adminno) */

COMMENT ON TABLE notice is '공지사항';
COMMENT ON COLUMN notice.noticeno is '공지사항번호';
COMMENT ON COLUMN notice.noticetitle is '공지사항제목';
COMMENT ON COLUMN notice.noticecont is '공지사항내용';
COMMENT ON COLUMN notice.seqno is '출력순서';
COMMENT ON COLUMN notice.visible is '출력모드';
COMMENT ON COLUMN notice.rdate is '등록일';
COMMENT ON COLUMN notice.adminno is '직원번호';

--등록

SELECT NVL(MAX(noticeno), 0) + 1 as noticeno FROM notice;


INSERT INTO notice(noticeno, noticetitle, noticecont, seqno, visible, rdate)
VALUES((SELECT NVL(MAX(noticeno), 0) + 1 as noticeno FROM notice),
                '당첨상품 수령방법', '내용~~' ,1 , 'Y', sysdate);
INSERT INTO notice(noticeno, noticetitle, noticecont, seqno, visible, rdate)
VALUES((SELECT NVL(MAX(noticeno), 0) + 1 as noticeno FROM notice),
                ' 현금영수증 신청방법', '내용~~' ,2 , 'Y', sysdate);
 INSERT INTO notice(noticeno, noticetitle, noticecont, seqno, visible, rdate)
VALUES((SELECT NVL(MAX(noticeno), 0) + 1 as noticeno FROM notice),
                ' 교환,반품및 환불안내', '내용~~' ,3 , 'Y', sysdate);
            
-- 목록            
SELECT * FROM notice ORDER BY seqno ASC;

DELETE FROM notice;


/**********************************/
/* Table Name: 공지사항 첨부파일 */
/**********************************/

DROP TABLE attachfile_notice;

CREATE TABLE attachfile_notice(
    attachno                          NUMBER(10)     NOT NULL    PRIMARY KEY,
    fname                             VARCHAR2(100)    NOT NULL,
    fupname                           VARCHAR2(100)    NOT NULL,
    thumb                             VARCHAR2(100)    NULL ,
    fsize                             NUMBER(10)     DEFAULT 0     NOT NULL,
    rdate                             DATE     NOT NULL,
    noticeno                          NUMBER(10)     NULL ,
  FOREIGN KEY (noticeno) REFERENCES notice (noticeno)
);

COMMENT ON TABLE attachfile_notice is '공지사항 첨부파일';
COMMENT ON COLUMN attachfile_notice.attachno is '첨부파일번호';
COMMENT ON COLUMN attachfile_notice.fname is '파일이름';
COMMENT ON COLUMN attachfile_notice.fupname is '업로드된파일이름';
COMMENT ON COLUMN attachfile_notice.thumb is 'thumb파일이름';
COMMENT ON COLUMN attachfile_notice.fsize is '파일사이즈';
COMMENT ON COLUMN attachfile_notice.rdate is '등록일';
COMMENT ON COLUMN attachfile_notice.noticeno is '공지사항번호';

SELECT NVL(MAX(attachno), 0) + 1 as attachno FROM attachfile_notice

--등록
INSERT INTO attachfile_notice(attachno, noticeno, fname, fupname, thumb, fsize, rdate)
VALUES((SELECT NVL(MAX(attachno), 0) + 1 as attachno FROM attachfile_notice),
               1, 'samyang.jpg', 'samyang_1.jpg', 'samyang_t.jpg', 1000, sysdate);
INSERT INTO attachfile_notice(attachno, noticeno, fname, fupname, thumb, fsize, rdate)
VALUES((SELECT NVL(MAX(attachno), 0) + 1 as attachno FROM attachfile_notice),
               1, 'samyang2.jpg', 'samyang2_1.jpg', 'samyang2_t.jpg', 2000, sysdate);
 INSERT INTO attachfile_notice(attachno, noticeno, fname, fupname, thumb, fsize, rdate)
VALUES((SELECT NVL(MAX(attachno), 0) + 1 as attachno FROM attachfile_notice),
                1, 'samyang3.jpg', 'samyang3_1.jpg', 'samyang3_t.jpg', 3000, sysdate);        
             
-- 목록            
SELECT attachno, noticeno, fname, fupname, thumb, fsize, rdate
FROM attachfile_notice 
ORDER BY attachno ASC;

 ATTACHNO NOTICENO FNAME       FUPNAME       THUMB           FSIZE  RDATE
 -------- -------- ----------- ------------- --------------- ------ ---------------------
        1        1 puppy06.jpg puppy06_0.jpg puppy06_0_t.jpg  54931 2019-12-16 16:29:27.0
        2        1 puppy13.jpg puppy13.jpg   puppy13_t.jpg   152171 2019-12-16 17:09:35.0
        3        4 puppy07.jpg puppy07.jpg   puppy07_t.jpg   253349 2019-12-16 17:28:45.0



DELETE FROM attachfile_notice;
        
        
        
SELECT attachno, noticeno, fname, fupname, thumb, fsize, rdate
FROM attachfile_notice 
ORDER BY attachno ASC;




DELETE FROM notice;





/**********************************/
/* Table Name: 강아지 상품 카테고리 */
/**********************************/
CREATE TABLE categroup(

);

COMMENT ON TABLE categroup is '강아지 상품 카테고리';


/**********************************/
/* Table Name: 강아지 상품 재고 */
/**********************************/
CREATE TABLE repository(
		adminno                       		NUMBER(10)		 NULL ,
  FOREIGN KEY (adminno) REFERENCES employee (adminno)
);

COMMENT ON TABLE repository is '강아지 상품 재고';
COMMENT ON COLUMN repository.adminno is '직원번호';


/**********************************/
/* Table Name: 강아지 상품 판매글 */
/**********************************/
CREATE TABLE product(
		cateno                        		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		productno                     		NUMBER(10)		 NOT NULL,
		adminno                       		NUMBER(10)		 NULL ,
  FOREIGN KEY (adminno) REFERENCES employee (adminno),
  FOREIGN KEY () REFERENCES categroup (),
  FOREIGN KEY () REFERENCES repository ()
);

COMMENT ON TABLE product is '강아지 상품 판매글';
COMMENT ON COLUMN product.cateno is '게시판번호';
COMMENT ON COLUMN product.productno is '상품코드';
COMMENT ON COLUMN product.adminno is '직원번호';


/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE mem(
		memno                         		NUMBER(10)		 NOT NULL		 PRIMARY KEY
);

COMMENT ON TABLE mem is '회원';
COMMENT ON COLUMN mem.memno is '회원번호';


/**********************************/
/* Table Name: qna질문 */
/**********************************/
CREATE TABLE qna(
		qnano                         		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		qnatitle                      		VARCHAR2(100)		 NOT NULL,
		qnacont                       		VARCHAR2(300)		 NOT NULL,
		qnadate                       		DATE		 NOT NULL,
		qnastate                      		VARCHAR2(10)		 DEFAULT 'N'		 NOT NULL,
		cateno                        		NUMBER(10)		 NULL ,
		memno                         		NUMBER(10)		 NULL ,
  FOREIGN KEY (cateno) REFERENCES product (cateno),
  FOREIGN KEY (memno) REFERENCES mem (memno)
);

COMMENT ON TABLE qna is 'qna질문';
COMMENT ON COLUMN qna.qnano is '질문번호';
COMMENT ON COLUMN qna.qnatitle is '질문제목';
COMMENT ON COLUMN qna.qnacont is '질문내용';
COMMENT ON COLUMN qna.qnadate is '작성일';
COMMENT ON COLUMN qna.qnastate is '답변상태';
COMMENT ON COLUMN qna.cateno is '게시판번호';
COMMENT ON COLUMN qna.memno is '회원번호';


/**********************************/
/* Table Name: qna답변 */
/**********************************/
CREATE TABLE qnaandswer(
		answerno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		answertitle                   		VARCHAR2(100)		 NOT NULL,
		answercont                    		VARCHAR2(300)		 NOT NULL,
		answerdate                    		DATE		 NOT NULL,
		adminno                       		NUMBER(10)		 NULL ,
		qnano                         		NUMBER(10)		 NULL ,
  FOREIGN KEY (qnano) REFERENCES qna (qnano),
  FOREIGN KEY (adminno) REFERENCES employee (adminno)
);

COMMENT ON TABLE qnaandswer is 'qna답변';
COMMENT ON COLUMN qnaandswer.answerno is '답변번호';
COMMENT ON COLUMN qnaandswer.answertitle is '답변제목';
COMMENT ON COLUMN qnaandswer.answercont is '답변내용';
COMMENT ON COLUMN qnaandswer.answerdate is '답변날짜';
COMMENT ON COLUMN qnaandswer.adminno is '직원번호';
COMMENT ON COLUMN qnaandswer.qnano is '질문번호';


/**********************************/
/* Table Name: 구매후기 */
/**********************************/

DROP TABLE review
CREATE TABLE review(
		reviewno                      		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		reviewtitle                   		VARCHAR2(100)		 NOT NULL,
		reviewcont                    		CLOB		 NOT NULL,
		reviewscore                     NUMBER(10) NOT NULL,
		reviewdate                    		DATE		 NOT NULL
);

/*
 * memno                            NUMBER(10)     NULL ,
    cateno                            NUMBER(10)     NULL ,
    productno                         NUMBER(10)     NOT NULL,
 * */

COMMENT ON TABLE review is '구매후기';
COMMENT ON COLUMN review.reviewno is '구매후기번호';
COMMENT ON COLUMN review.reviewtitle is '후기제목';
COMMENT ON COLUMN review.reviewcont is '후기내용';
COMMENT ON COLUMN review.reviewdate is '후기등록일';
COMMENT ON COLUMN review.reviewscore is '후기점수';

/*
 * COMMENT ON COLUMN review.memno is '회원번호';
COMMENT ON COLUMN review.cateno is '게시판번호';
COMMENT ON COLUMN review.productno is '상품코드';*/


SELECT NVL(MAX(reviewno), 0) + 1 as reviewno FROM review

--등록
INSERT INTO review(reviewno, reviewtitle, reviewcont, reviewscore, reviewdate)
VALUES((SELECT NVL(MAX(reviewno), 0) + 1 as reviewno FROM review),
                '매번 구매하던것....^^', '너무 좋네요......^^', 5, sysdate);
INSERT INTO review(reviewno, reviewtitle, reviewcont, reviewscore, reviewdate)
VALUES((SELECT NVL(MAX(reviewno), 0) + 1 as reviewno FROM review),
               '잘받았습니다', '굿',4, sysdate);
 INSERT INTO review(reviewno, reviewtitle, reviewcont, reviewscore, reviewdate)
VALUES((SELECT NVL(MAX(reviewno), 0) + 1 as reviewno FROM review),
                '저희 멍멍이가 좋아해요', '>-<',5, sysdate);        
             
-- 목록            
SELECT reviewno, reviewtitle, reviewcont,reviewscore, reviewdate
FROM review 
ORDER BY reviewno ASC;

 REVIEWNO REVIEWTITLE    REVIEWCONT     REVIEWSCORE    REVIEWDATE
 -------- --------------              --------------         -----------  ---------------------
        1 매번 구매하던것....^^    너무 좋네요......^^           5             2019-12-19 10:57:44.0
        2 잘받았습니다                          굿                       4             2019-12-19 10:57:45.0
        3 저희 멍멍이가 좋아해요            >-<                    5              2019-12-19 10:57:46.0











