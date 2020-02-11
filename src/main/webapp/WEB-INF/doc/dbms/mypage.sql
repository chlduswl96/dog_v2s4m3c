DROP TABLE mem_grade;
DROP TABLE power;
DROP TABLE mem;
DROP table dilivery;

/**********************************/
/* Table Name: 회원 등급 */
/**********************************/
CREATE TABLE mem_grade(
		gradeno                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		gradename                     		VARCHAR2(10)		 NOT NULL
);

COMMENT ON TABLE mem_grade is '회원 등급';
COMMENT ON COLUMN mem_grade.gradeno is '등급 번호';
COMMENT ON COLUMN mem_grade.gradename is '등급 이름';

select * from mem_grade;

INSERT INTO mem_grade(gradeno, gradename)
VALUES ((SELECT NVL(MAX(gradeno), 0) + 1 as gradeno FROM mem_grade), 'basic');

INSERT INTO mem_grade(gradeno, gradename)
VALUES ((SELECT NVL(MAX(gradeno), 0) + 1 as gradeno FROM mem_grade), 'regular');

INSERT INTO mem_grade(gradeno, gradename)
VALUES ((SELECT NVL(MAX(gradeno), 0) + 1 as gradeno FROM mem_grade), 'star');

INSERT INTO mem_grade(gradeno, gradename)
VALUES ((SELECT NVL(MAX(gradeno), 0) + 1 as gradeno FROM mem_grade), 'gold');

INSERT INTO mem_grade(gradeno, gradename)
VALUES ((SELECT NVL(MAX(gradeno), 0) + 1 as gradeno FROM mem_grade), 'legend'); 

delete from mem_grade where gradeno = 6;

/**********************************/
/* Table Name: 권한 */
/**********************************/
CREATE TABLE power(
		powerno                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY
);

COMMENT ON TABLE power is '권한';
COMMENT ON COLUMN power.powerno is '권한 번호';

INSERT INTO power(powerno)
VALUES (00);

INSERT INTO power(powerno)
VALUES (11);

/**********************************/
/* Table Name: 회원 */
/**********************************/
CREATE TABLE mem(
		memno                         		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		gradeno                       		NUMBER(10)		 NOT NULL,
		powerno                       		NUMBER(10)		 NOT NULL,
		name                          		VARCHAR2(10)		 NOT NULL,
		gender                        		CHAR(1)		 NOT NULL,
		phonenum                      		VARCHAR2(20)		 NOT NULL,
		zipcode                       		VARCHAR2(20)		 NOT NULL,
		address                       		VARCHAR2(100)		 NOT NULL,
		address_d                     		VARCHAR2(100)		 NOT NULL,
		id                            		VARCHAR2(30)		 NOT NULL,
		passwd                        		VARCHAR2(30)		 NOT NULL,
  FOREIGN KEY (powerno) REFERENCES power (powerno),
  FOREIGN KEY (gradeno) REFERENCES mem_grade (gradeno)
);

COMMENT ON TABLE mem is '회원';
COMMENT ON COLUMN mem.memno is '회원번호';
COMMENT ON COLUMN mem.gradeno is '등급';
COMMENT ON COLUMN mem.powerno is '권한 번호';
COMMENT ON COLUMN mem.name is '이름';
COMMENT ON COLUMN mem.gender is '성별';
COMMENT ON COLUMN mem.phonenum is '폰번호';
COMMENT ON COLUMN mem.zipcode is '우편번호';
COMMENT ON COLUMN mem.address is '주소';
COMMENT ON COLUMN mem.address_d is '상세주소';
COMMENT ON COLUMN mem.id is '아이디';
COMMENT ON COLUMN mem.passwd is '비번';

INSERT INTO mem(memno, gradeno, powerno, name, gender, phonenum, zipcode, address, address_d, id, passwd)
VALUES ((SELECT NVL(MAX(memno), 0) + 1 as memno FROM mem), 1, 11, 'no1', 'm', '010-1234-5678', '12345', '서울시 종로구', '로 24번길 4-1', 'abcd1234', '1111');

INSERT INTO mem(memno, gradeno, powerno, name, gender, phonenum, zipcode, address, address_d, id, passwd)
VALUES ((SELECT NVL(MAX(memno), 0) + 1 as memno FROM mem), 1, 11, '이한', 'm', '010-1234-5678', '12345', '서울시 종로구', '로 24번길 4-1', 'abcde', '1234');

select * from mem;

/**********************************/
/* Table Name: 포인트 */
/**********************************/
drop table point;

CREATE TABLE point(
		pnum                          		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		memno                         	NUMBER(10)		 NULL ,
		division                          VARCHAR2(20)      NOT NULL,
		history                        		VARCHAR2(100)		 NOT NULL,
		pdate                         		DATE		 NOT NULL,
		dvcomplete                    	VARCHAR2(10)		 DEFAULT 'N'		NULL,
		usep                              NUMBER(10)    DEFAULT 0    NULL,
		ampoint                       		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		total                              NUMBER(10)   DEFAULT 0 NULL,
  FOREIGN KEY (memno) REFERENCES mem (memno)
);

COMMENT ON TABLE point is '포인트';
COMMENT ON COLUMN point.pnum is '포인트번호';
COMMENT ON COLUMN point.memno is '회원번호';
COMMENT ON COLUMN point.division is '구분';
COMMENT ON COLUMN point.history is '내역';
COMMENT ON COLUMN point.pdate is '적립일';
COMMENT ON COLUMN point.dvcomplete is '배송완료유무';
COMMENT ON COLUMN point.usep is '사용 포인트';
COMMENT ON COLUMN point.ampoint is '적립 포인트';
COMMENT ON COLUMN point.total is '총합 포인트';

-- 등록

INSERT INTO point(pnum, memno, division, history, pdate, dvcomplete, usep, ampoint, total)
VALUES((SELECT NVL(MAX(pnum), 0) + 1 as pnum FROM point), 1, '적립', '상품 구매', sysdate, 'y', 0, 150);

INSERT INTO point(pnum, memno, division, history, pdate, dvcomplete, usep, ampoint, total)
VALUES((SELECT NVL(MAX(pnum), 0) + 1 as pnum FROM point), 1, '적립', '상품 구매', sysdate, 'y', 0, 250);

INSERT INTO point(pnum, memno, division, history, pdate, dvcomplete, usep, ampoint, total)
VALUES((SELECT NVL(MAX(pnum), 0) + 1 as pnum FROM point), 1, '적립', '상품 구매', sysdate, 'y', 0, 500);

-- 목록

SELECT pnum, memno, division, history, pdate, dvcomplete, usep, ampoint
FROM point
WHERE memno = 1;

 PNUM MEMNO DIVISION HISTORY PDATE                 DVCOMPLETE USEP AMPOINT
 ---- ----- -------- ------- --------------------- ---------- ---- -------
    1     1 적립       상품 구매   2019-12-05 14:55:32.0 y             0     150
    2     1 적립       상품 구매   2019-12-05 17:17:56.0 y             0     250
    3     1 적립       상품 구매   2019-12-05 17:18:00.0 y             0     500

-- 수정

UPDATE point
SET history='출석'
WHERE memno=1 AND pnum=2;

-- 삭제

DELETE point
WHERE pnum = 3;

/**********************************/
/* Table Name: 배송 */
/**********************************/
CREATE TABLE dilivery(
		odcode                        		NUMBER(10)		       NOT NULL		 PRIMARY KEY,
		memno                         	NUMBER(10)		       NOT NULL ,
		dvaddress                     		VARCHAR2(200)		 NOT NULL,
		zipcode                       		NUMBER(10)		       NOT NULL,
		product                       		VARCHAR2(100)		 NOT NULL,
		pdcnt                             NUMBER(10)         NOT NULL,
		dvstatus                    	   VARCHAR2(100)		 DEFAULT 'preparing'	 NOT NULL,
  FOREIGN KEY (memno) REFERENCES mem (memno),
);

COMMENT ON TABLE dilivery is '배송';
COMMENT ON COLUMN dilivery.odcode is '주문코드';
COMMENT ON COLUMN dilivery.memno is '회원번호';
COMMENT ON COLUMN dilivery.dvaddress is '배송지';
COMMENT ON COLUMN dilivery.zipcode is '우편번호';
COMMENT ON COLUMN dilivery.product is '상품 코드';
COMMENT ON COLUMN dilivery.pdcnt is '상품 개수';
COMMENT ON COLUMN dilivery.dvstatus is '배송현황';

SELECT * FROM dilivery;


