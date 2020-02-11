/**********************************/
/* Table Name: 답변 */
/**********************************/
DROP TABLE answer;

CREATE TABLE answer(
    awno                    NUMBER(10)     NOT NULL  PRIMARY KEY,
    iqynum                  NUMBER(10)    NOT NULL,
    memno                  NUMBER(10)   NOT NULL,
    awcontent               CLOB             NOT NULL,
    awdate                   DATE             NOT NULL,
  FOREIGN KEY (iqynum) REFERENCES one_inquiry (iqynum),
  FOREIGN KEY (memno) REFERENCES mem (memno)
);

COMMENT ON TABLE answer is '답변';
COMMENT ON COLUMN answer.awno is '답변번호';
COMMENT ON COLUMN answer.iqynum is '문의번호';
COMMENT ON COLUMN answer.memno is '회원번호';
COMMENT ON COLUMN answer.content is '내용';
COMMENT ON COLUMN answer.awdate is '등록일';

-- 등록
INSERT INTO answer(awno, iqynum, memno, awcontent, awdate)
VALUES((SELECT NVL(MAX(awno), 0) + 1 as awno FROM answer), 1, 1, '환불 절차는 공지사항에 게시되어 있습니다.', sysdate);

INSERT INTO answer(awno, iqynum, memno, awcontent, awdate)
VALUES((SELECT NVL(MAX(awno), 0) + 1 as awno FROM answer), 2, 1, '해당 상품은 일주일 후 입고됩니다.', sysdate);

-- 조회
SELECT *
FROM answer
WHERE memno = 1;

-- 수정

UPDATE answer
SET awcontent = '상품 교환하고 싶어요'
WHERE awno=1;

-- 삭제 
DELETE FROM answer
WHERE awno=1;

