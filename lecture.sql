--�л����̺�
create table students(
 scode char(6) not null primary key,--�й�
 sname varchar(20) not null, --�л���
 dept varchar(20) not null --�а�
);
desc students;

-- �������̺�
create table courses(
ccode char(3) not null primary key, --�����ڵ�
cname varchar(100) not null --�����
);

desc courses;

-- ������û ���̺�
create table enrols(
 scode char(6) not null, --�й�
 ccode char(3) not null, --�����ڵ�
 grade int default 0, --����
 edate date default sysdate, --��û��
 primary key(scode,ccode), -- �й�,�����ڵ带 ����
  FOREIGN KEY(scode) REFERENCES students(scode), --�ܷ�Ű(�й�)
  FOREIGN KEY(ccode) REFERENCES courses(ccode) --�ܷ�Ű(�����ڵ�)
);

-- �л����̺� ������ �Է�
INSERT INTO studentS(scode,sname,dept)
 VALUES('202301','ȫ�浿','����');
 INSERT INTO studentS(scode,sname,dept)
 VALUES('202302','��û��','����');
INSERT INTO studentS(scode,sname,dept)
 VALUES('202303','�̼���','����');

select * from students;

--�������̺� ������ �Է�
INSERT INTO courses(ccode,cname)
 VALUES('100','�ڹ�');
 INSERT INTO courses(ccode,cname)
 VALUES('101','�����ͺ��̽�');
 INSERT INTO courses(ccode,cname)
 VALUES('102','html');
 
 select * from courses;

-- ������û���̺� ������ �Է� 
 INSERT INTO enrols(scode,ccode)
 VALUES('202301','100');
 INSERT INTO enrols(scode,ccode)
 VALUES('202302','101');
 INSERT INTO enrols(scode,ccode)
 VALUES('202303','102');
 INSERT INTO enrols(scode,ccode)
 VALUES('202301','102');
  INSERT INTO enrols(scode,ccode)
 VALUES('202302','102');
 
 select * from enrols;
 
 
 
 -- ���̺� ����
 create view view_enrols as
 select e.*,s.sname,c.cname 
 from enrols e, students s, courses c
 where s.scode=e.scode and c.ccode=e.ccode; 
 
 select * from view_enrols order by scode;
 
 update view_enrols set grade=grade+10  
 where scode='202301' and ccode='100';
 
 
 
 select * from view_enrols where scode ='202301';
 
 commit;
 
 
select max(scode)+1 ncode from students;

select * from  view_enrols where ccode ='102';
select * from  view_enrols where scode =' 202301' and ccode ='102';


