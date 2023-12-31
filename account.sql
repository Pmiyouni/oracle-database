-- 계좌테이블 생성
CREATE TABLE ACCOUNT(
 ANO INT NOT NULL PRIMARY KEY,  --계좌번호
 ANAME VARCHAR(20) NOT NULL,  --계좌주명
 BALANCE INT DEFAULT 0   --잔액
);

-- 거래내역테이블 생성
CREATE TABLE DETAIL(
 DNO INT NOT NULL PRIMARY KEY, --거래번호
 ANO INT NOT NULL,  --계좌번호
 AMOUNT INT DEFAULT 0,   --금액
 TYPE CHAR(6) NOT NULL,   --구분
 DDATE DATE DEFAULT SYSDATE,  --거래일
 FOREIGN KEY(ANO) REFERENCES ACCOUNT(ANO)  -- 외래키(계좌번호)
 );
 
 -- 계좌번호 시퀀스 생성
 CREATE SEQUENCE SEQ_ANO START WITH 100 INCREMENT BY 1;
 
 -- 거래번호 시퀀스 생성
 CREATE SEQUENCE SEQ_DNO  START WITH 1 INCREMENT BY 1;
 
 -- 계좌테이블 데이터 입력
 INSERT INTO ACCOUNT(ANO,ANAME,BALANCE)
 VALUES(SEQ_ANO.NEXTVAL,'홍길동',500);
 INSERT INTO ACCOUNT(ANO,ANAME,BALANCE)
 VALUES(SEQ_ANO.NEXTVAL,'심청이',1000);
 INSERT INTO ACCOUNT(ANO,ANAME,BALANCE)
 VALUES(SEQ_ANO.NEXTVAL,'강감찬',1000);

 -- 계좌테이블 조회
 SELECT * FROM ACCOUNT;
 
 
 --거래내역테이블 데이터 입력
 INSERT INTO DETAIL(DNO,ANO,AMOUNT,TYPE,DDATE)
 VALUES(SEQ_DNO.NEXTVAL,100,1000,'입금','2023-07-09');
 INSERT INTO DETAIL(DNO,ANO,AMOUNT,TYPE,DDATE)
 VALUES(SEQ_DNO.NEXTVAL,101,1000,'입금','2023-07-09');
 INSERT INTO DETAIL(DNO,ANO,AMOUNT,TYPE,DDATE)
 VALUES(SEQ_DNO.NEXTVAL,102,1000,'입금','2023-07-10');
 INSERT INTO DETAIL(DNO,ANO,AMOUNT,TYPE,DDATE)
 VALUES(SEQ_DNO.NEXTVAL,100,500,'출금','2023-07-11');
 
 -- 거래내역테이블 조회
 SELECT * FROM DETAIL;
 
 -- 커밋
 COMMIT;
 
 
 select * from account where ano=100;
 
 select * from detail  where ano=100;
 
 --update account set balance=balance+100 where ano=102;
 
 
select seq_ano.currval ano from dual;

select seq_ano.NEXTVAL ano from dual;
