-- �������̺� ����
CREATE TABLE ACCOUNT(
 ANO INT NOT NULL PRIMARY KEY,  --���¹�ȣ
 ANAME VARCHAR(20) NOT NULL,  --�����ָ�
 BALANCE INT DEFAULT 0   --�ܾ�
);

-- �ŷ��������̺� ����
CREATE TABLE DETAIL(
 DNO INT NOT NULL PRIMARY KEY, --�ŷ���ȣ
 ANO INT NOT NULL,  --���¹�ȣ
 AMOUNT INT DEFAULT 0,   --�ݾ�
 TYPE CHAR(6) NOT NULL,   --����
 DDATE DATE DEFAULT SYSDATE,  --�ŷ���
 FOREIGN KEY(ANO) REFERENCES ACCOUNT(ANO)  -- �ܷ�Ű(���¹�ȣ)
 );
 
 -- ���¹�ȣ ������ ����
 CREATE SEQUENCE SEQ_ANO START WITH 100 INCREMENT BY 1;
 
 -- �ŷ���ȣ ������ ����
 CREATE SEQUENCE SEQ_DNO  START WITH 1 INCREMENT BY 1;
 
 -- �������̺� ������ �Է�
 INSERT INTO ACCOUNT(ANO,ANAME,BALANCE)
 VALUES(SEQ_ANO.NEXTVAL,'ȫ�浿',500);
 INSERT INTO ACCOUNT(ANO,ANAME,BALANCE)
 VALUES(SEQ_ANO.NEXTVAL,'��û��',1000);
 INSERT INTO ACCOUNT(ANO,ANAME,BALANCE)
 VALUES(SEQ_ANO.NEXTVAL,'������',1000);

 -- �������̺� ��ȸ
 SELECT * FROM ACCOUNT;
 
 
 --�ŷ��������̺� ������ �Է�
 INSERT INTO DETAIL(DNO,ANO,AMOUNT,TYPE,DDATE)
 VALUES(SEQ_DNO.NEXTVAL,100,1000,'�Ա�','2023-07-09');
 INSERT INTO DETAIL(DNO,ANO,AMOUNT,TYPE,DDATE)
 VALUES(SEQ_DNO.NEXTVAL,101,1000,'�Ա�','2023-07-09');
 INSERT INTO DETAIL(DNO,ANO,AMOUNT,TYPE,DDATE)
 VALUES(SEQ_DNO.NEXTVAL,102,1000,'�Ա�','2023-07-10');
 INSERT INTO DETAIL(DNO,ANO,AMOUNT,TYPE,DDATE)
 VALUES(SEQ_DNO.NEXTVAL,100,500,'���','2023-07-11');
 
 -- �ŷ��������̺� ��ȸ
 SELECT * FROM DETAIL;
 
 -- Ŀ��
 COMMIT;
 
 
 select * from account where ano=100;
 
 select * from detail  where ano=100;
 
 --update account set balance=balance+100 where ano=102;
 
 
select seq_ano.currval ano from dual;

select seq_ano.NEXTVAL ano from dual;