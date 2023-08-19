--ķ�������̺� ����
CREATE TABLE CAMP(
  CNO CHAR(3) PRIMARY KEY NOT NULL, --ķ���� ��ȣ
  CNAME VARCHAR(100) NOT NULL, -- ķ�����
  JUSO VARCHAR(500), --�ּ�
  TEL VARCHAR(20)  --��ȭ
);

INSERT INTO CAMP(CNO, CNAME, JUSO, TEL)
VALUES('100', '���丮ķ����', '������', '010-1010-1010');
INSERT INTO CAMP(CNO, CNAME, JUSO, TEL)
VALUES('101', '�ֹ�ķ����', '��⵵', '010-1010-2020');
INSERT INTO CAMP(CNO, CNAME, JUSO, TEL)
VALUES('102', '�ϴ�ķ����', '��õ', '010-1010-3030');
SELECT * FROM CAMP;

--�ü��� ���̺� ����
CREATE TABLE FACIL(
  FNO INT PRIMARY KEY NOT NULL, --�ü��� ��ȣ
  FNAME VARCHAR(100) NOT NULL --�ü�����
);
INSERT INTO FACIL VALUES(0,'����');
INSERT INTO FACIL VALUES(1,'����');
INSERT INTO FACIL VALUES(2,'��������');
INSERT INTO FACIL VALUES(3,'ȭ���');
INSERT INTO FACIL VALUES(4,'������');
SELECT * FROM FACIL;

--Ÿ�� ���̺� ����
CREATE TABLE TYPE(
  TNO INT PRIMARY KEY NOT NULL, -- Ÿ�� ��ȣ
  TNAME VARCHAR(100) NOT NULL --Ÿ�Ը�
);
INSERT INTO TYPE VALUES(0, 'ī���');
INSERT INTO TYPE VALUES(1, '�۷���');
INSERT INTO TYPE VALUES(2, '����ķ��');
INSERT INTO TYPE VALUES(3, '���');
SELECT * FROM TYPE;

--ķ���庰 �ü��� ���̺� ����
CREATE TABLE CAMP_FACIL( 
  CNO CHAR(3) NOT NULL,   --ķ���� ��ȣ
  FNO INT NOT NULL,   --�ü��� ��ȣ
  PRIMARY KEY(CNO, FNO),  -- �Ѵ� �����̸Ӹ� Ű ����
  FOREIGN KEY(CNO) REFERENCES CAMP(CNO), --�ܷ�Ű�� ķ�������̺��� ķ�����ȣ ����
  FOREIGN KEY(FNO) REFERENCES FACIL(FNO)--�ܷ�Ű�� �ü������̺��� �ü�����ȣ ����
);  
  
--ķ���庰 Ÿ�� ���̺� ����
CREATE TABLE CAMP_TYPE(
  CNO CHAR(3) NOT NULL, --ķ���� ��ȣ
  TNO INT NOT NULL,  --Ÿ�Թ�ȣ
  PRIMARY KEY(CNO, TNO), -- �Ѵ� �����̸Ӹ� Ű ����
  FOREIGN KEY(CNO) REFERENCES CAMP(CNO), --�ܷ�Ű�� ķ�������̺��� ķ�����ȣ ����
  FOREIGN KEY(TNO) REFERENCES TYPE(TNO)  --�ܷ�Ű�� Ÿ�����̺��� Ÿ�Թ�ȣ ����
);  

--ķ���庰 �ü��� ���̺� ������ �Է�
--100�� ķ���忡 �ü��� 0,1,2
INSERT INTO CAMP_FACIL(CNO, FNO) VALUES('100',0);
INSERT INTO CAMP_FACIL(CNO, FNO) VALUES('100',1);
INSERT INTO CAMP_FACIL(CNO, FNO) VALUES('100',2);
--101�� ķ���忡 �ü��� 0,1
INSERT INTO CAMP_FACIL(CNO, FNO) VALUES('101',0);
INSERT INTO CAMP_FACIL(CNO, FNO) VALUES('101',1);
--102�� ķ���忡 �ü��� 0,3
INSERT INTO CAMP_FACIL(CNO, FNO) VALUES('102',0);
INSERT INTO CAMP_FACIL(CNO, FNO) VALUES('102',3);
SELECT * FROM CAMP_FACIL;

--ķ���庰 Ÿ�� ������ �Է�
--100�� ķ���忡 1,2
INSERT INTO CAMP_TYPE(CNO, TNO) VALUES('100',1);
INSERT INTO CAMP_TYPE(CNO, TNO) VALUES('100',2);
--101�� �ü��� 1
INSERT INTO CAMP_TYPE(CNO, TNO) VALUES('101',1);
--102�� �ü��� 2
INSERT INTO CAMP_TYPE(CNO, TNO) VALUES('102',2);
SELECT * FROM CAMP_TYPE;



--ķ���庰 �ü�����ȣ, �ü����̸�
SELECT C.*, F.FNAME --�ü��� �̸��� ������
FROM CAMP_FACIL C, FACIL F
WHERE C.FNO=F.FNO; --�ü��� ��ȣ�� ����

SELECT C.*, F.FNAME
FROM CAMP_FACIL C, FACIL F
WHERE C.FNO=F.FNO AND CNO='100';


--ķ���庰 ������ȣ, �����̸�
SELECT C.*, T.TNAME  --Ÿ�Ը� ������
FROM CAMP_TYPE C, TYPE T
WHERE C.TNO=T.TNO; --Ÿ���� ����

-- �����(ķ���庰 �ü�����ȣ, �ü����̸�)
CREATE VIEW VIEW_FACIL AS
SELECT C.*, F.FNAME
FROM CAMP_FACIL C, FACIL F --ķ���庰 �ü���, �ü������̺� ����
WHERE C.FNO=F.FNO; --�ü��� ��ȣ�� ����

CREATE VIEW VIEW_TYPE AS
SELECT C.*, T.TNAME
FROM CAMP_TYPE C, TYPE T --ķ���庰 Ÿ��, Ÿ�����̺� ����
WHERE C.TNO=T.TNO; --Ÿ�Թ�ȣ�� ����

SELECT * FROM VIEW_TYPE;
COMMIT;

