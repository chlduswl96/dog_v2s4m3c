select * from mem where memno=74;


DROP table REPOSITORY;
DROP table CATEGROUP;
DROP table PRODUCT;

     /*************/

DROP table notice;
DROP table qna;
DROP table qnaandswer;
DROP table review;

DROP table one_inquiry;
DROP TABLE answer;
DROP TABLE attachfile_inquiry;

DROP table employ;
DROP table mem;
DROP table memgrade;

/**********************************/
/* Table Name: 직원 테이블 */
/**********************************/
-- 직원 테이블
CREATE TABLE EMPLOY(
    name varchar(20) not null, -- 사원 이름
    id varchar(20) not null, -- 사원 아이디
    pw varchar(20) not null, -- 사원 비밀번호
    email varchar(20) not null, -- 사원 이메일
    erank varchar(20) default 'nomal' not null, -- 사원 직급
    rdate date default sysdate not null, -- 사원 등록날짜
    CONSTRAINT ID_PK PRIMARY KEY(ID) 
);


insert into EMPLOY values('철수', 'empl1', '1234', 'test.com', 'nomal', sysdate);


/**********************************/
/* Table Name: 회원 등급 */
/**********************************/
 
CREATE TABLE memgrade(
memgradeno                    NUMBER(10)  NOT NULL  PRIMARY KEY,
seqno                       NUMBER(10)  NOT NULL,
gname                VARCHAR2(20)  NOT NULL
);

COMMENT ON TABLE memgrade is '회원 등급';
COMMENT ON COLUMN memgrade.memgradeno is '등급 번호';
COMMENT ON COLUMN memgrade.seqno is '출력 순서';
COMMENT ON COLUMN memgrade.gname is '등급 이름';

INSERT INTO memgrade(memgradeno, seqno, gname)
VALUES ((SELECT NVL(MAX(memgradeno), 0) + 1 as memgradeno FROM memgrade), 1, 'basic');

INSERT INTO memgrade(memgradeno, seqno, gname)
VALUES ((SELECT NVL(MAX(memgradeno), 0) + 1 as memgradeno FROM memgrade), 2, 'regular');

INSERT INTO memgrade(memgradeno, seqno, gname)
VALUES ((SELECT NVL(MAX(memgradeno), 0) + 1 as memgradeno FROM memgrade), 3, 'star');

INSERT INTO memgrade(memgradeno, seqno, gname)
VALUES ((SELECT NVL(MAX(memgradeno), 0) + 1 as memgradeno FROM memgrade), 4, 'gold');

INSERT INTO memgrade(memgradeno, seqno, gname)
VALUES ((SELECT NVL(MAX(memgradeno), 0) + 1 as memgradeno FROM memgrade), 5, 'legend'); 


/**********************************/
/* Table Name: 회원 */
/**********************************/

CREATE TABLE mem(
    memno                       NUMBER(10)      NOT NULL PRIMARY KEY,
    memgradeno                NUMBER(10)  DEFAULT 1 NOT NULL,
    mname                         VARCHAR(30)    NOT NULL ,
    gender                       CHAR(1)           NOT NULL ,
    tel                             VARCHAR(20)    NOT NULL,
    email                         VARCHAR(200)   NOT NULL,
    zipcode                       VARCHAR(20)    NOT NULL,
    address1                     VARCHAR(150)    NOT NULL,
    address2                     VARCHAR(150)    NOT NULL,
    rdate                          DATE            DEFAULT sysdate  NOT NULL,
    id                               VARCHAR(40)    UNIQUE NOT NULL,
    passwd                        VARCHAR(40)    NOT NULL,
    
    FOREIGN KEY (memgradeno) REFERENCES memgrade(memgradeno)
);

COMMENT ON TABLE mem is '회원';
COMMENT ON COLUMN mem.memno is '회원번호';
COMMENT ON COLUMN mem.memgradeno is '등급';
COMMENT ON COLUMN mem.mname is '이름';
COMMENT ON COLUMN mem.tel is '폰번호';
COMMENT ON COLUMN mem.email is '이메일';
COMMENT ON COLUMN mem.zipcode is '우편번호';
COMMENT ON COLUMN mem.address1 is '주소';
COMMENT ON COLUMN mem.address2 is '상세주소';
COMMENT ON COLUMN mem.rdate is '가입일';
COMMENT ON COLUMN mem.id is '아이디';
COMMENT ON COLUMN mem.passwd is '비번';

INSERT INTO mem(memno, mname, gender, tel, email, zipcode, address1, address2, id, passwd)
VALUES((SELECT NVL(MAX(memno), 0) + 1 as memno FROM mem),
           '왕눈이', 'M', '010-1111-2222', 'abcde123@naver.com','123-1234', '경기도 부천시', '신흥로 11', 'iden', '1');
           
INSERT INTO mem(memno, mname, gender, tel, email, zipcode, address1, address2, id, passwd)
VALUES((SELECT NVL(MAX(memno), 0) + 1 as memno FROM mem),
           '아로미', 'W', '010-2222-1111', 'efg343@naver.com','321-4321', '전라북도 전주시', '전북대', 'id', 'pass');

INSERT INTO mem(memno, mname, gender, tel, email, zipcode, address1, address2, id, passwd)
VALUES((SELECT NVL(MAX(memno), 0) + 1 as memno FROM mem),
           '왕눈이5', 'M', '010-1111-2222', 'higk15@naver.com','123-1234', '경기도 부천시', '신흥로 11', 'id5', '1');
           
INSERT INTO mem(memno, mname, gender, tel, email, zipcode, address1, address2, id, passwd)
VALUES((SELECT NVL(MAX(memno), 0) + 1 as memno FROM mem),
           'user1', 'M', '010-1111-2222', 'abc123@naver.com','123-1234', '경기도 부천시', '신흥로 11', 'user1', '1234');
           
INSERT INTO mem(memno, mname, gender, tel, email, zipcode, address1, address2, id, passwd)
VALUES(0, 'admin1', 'M', '010-1111-2322', 'abc1234@naver.com','123-1274', '경기도 부천시', '신흥로 11', 'admin1', '1234');

commit
select * from mem

/**********************************/
/* Table Name: 강아지 상품 재고 */
/**********************************/

CREATE TABLE REPOSITORY(
    repositoryno number(10) not null, -- 재고 고유번호
    cnt number(10) not null, -- 재고 수량
    name varchar(50) not null, -- 재고 이름
    categrpno number(10) not null, -- 카테고리 번호
    manager varchar(20) not null, -- 재고 등록한 직원
    rdate date default sysdate not null, -- 재고 등록날짜
    price number(10) not null, -- 재고 가격
    primary key(repositoryno),
    foreign key (categrpno) references CATEGROUP(categrpno)
);

/**********************************/
/* Table Name: 강아지 상품 카테고리 */
/**********************************/
CREATE TABLE CATEGROUP(
    categrpno number(10) not null, -- 강아지 상품 카테고리 번호
    name varchar(50) not null, -- 카테고리 이름
    seqno number(7) default 0 not null , -- 카테고리 출력순서
    visible char(1) default 'Y' not null, -- 카테고리 출력 유무
    rdate date default sysdate not null,  -- 카테고리 생성 날짜
    cnt number(7) not null, -- 카테고리 하위 테이블 갯수
    constraint categrpno_pk primary key(categrpno)
);

insert into CATEGROUP(categrpno, name, seqno, visible, rdate, cnt) values(1, '사료', 1, 'Y', sysdate, 0);

/**********************************/
/* Table Name: 강아지 판매글 */
/**********************************/
CREATE TABLE PRODUCT(
    categrpno number(10) not null, --카테고리 고유 번호 FK
    productno number(10) not null, -- 판매글 고유 번호 PK
    repositoryno number(10) not null, -- 재고 고유 번호 FK
    title varchar(100) not null, -- 제목
    keyword varchar(30) null, -- 제품 검색어
    likey number(10) default 0, -- 제품에 좋아요
    deliveryCharge number(10) not null, -- 제품 배송비 
    cnt number(10) default 0, -- 제품을 눌러본 조회수
    rdate date not null, -- 제품 등록날짜
    manager varchar(20) not null, -- 상품 내용을 등록한 직원
    contents varchar(1024) not null, -- 제품 상세 소개
    primary key(productno),
    FOREIGN key(categrpNo) REFERENCES CATEGROUP(categrpno),
    FOREIGN key(repositoryno) REFERENCES REPOSITORY(repositoryno)
);


/**********************************/
/* Table Name: 상품 이미지 테이블*/
/**********************************/
drop table productfile;

CREATE TABLE productfile(
        productfileno                  NUMBER(10)         NOT NULL         PRIMARY KEY, -- 파일 번호
        productno                   NUMBER(10)         NULL , -- 상품 번호
        fname                             VARCHAR2(100)         NOT NULL, -- 파일 이름
        fupname                      VARCHAR2(100)          NULL, -- 파일 원본 이름 
        thumb                         VARCHAR2(100)         NULL , -- 썸네일 이름
        fsize                                 NUMBER(10)         DEFAULT 0         NOT NULL, -- 파일 사이즈
    rdate                           DATE     NOT NULL, -- 등록일
  FOREIGN KEY (productno) REFERENCES product (productno) on delete CASCADE
);

SELECT * FROM all_tables WHERE table_name = 'mem'

/**********************************/
/* Table Name: 장바구니 테이블*/
/**********************************/
drop table showppingbasket;

CREATE TABLE showppingbasket(
    showppingno number(10) not null, --장바구니 번호
    productno number(10) not null, -- 상품번호
    title varchar(100) not null, -- 상품 제목
    cnt number(10) not null, -- 상품 갯수
    memberid varchar(100) not null, -- 상품 구매자 아이디
    uri varchar(100) not null,
    rdate date DEFAULT sysdate  not null, -- 장바구니 등록일자
    primary key(showppingno), -- 기본키
    FOREIGN key(memberid) references mem(id) -- 외래키
);

/**********************************/
/* Table Name: 주문 테이블*/
/**********************************/
drop table orderr;

create table orderr(
    orderno number(20) not null primary key, -- 주문 번호
    ordername varchar(100) not null, -- 주문자 이름
    orderaddress1 varchar(100) not null, -- 주문자 주소1
    orderaddress2 varchar(100) not null, -- 주문자 주소2
    orderzipcode varchar(100) not null, -- 주문자 우편주소
    ordernumber VARCHAR(100) not null, -- 주문자 번호
    productname varchar(100) not null, -- 제품 이름
    productprice varchar(100) not null, -- 제품 가격
    productcnt varchar(100) not null, -- 제품 갯수
    paymentstatus varchar(100) not null, -- 결제 상태
    paymentmemberid varchar(100) not null, -- 결제 아이디
    paymentkind varchar(100) not null, -- 결제종류
    paymentprice varchar(100) not null, -- 결제 가격
    deliverystatus varchar(100) not null, -- 배송상태
    rdate date DEFAULT sysdate not null, -- 주문시간
    foreign key(paymentmemberid) REFERENCES mem(id)
);