/* ���̺� ���� */
create table students(
sno char(6) not null primary key, /*�й�*/
sname  varchar(20) not null, /*�̸�*/
dept  varchar(20) not null, /*�а�*/
birthday date, /*�������*/
year int default 1  /*1�г�*/
);
desc students; 
drop table students;

/* ������ �Է� */
insert into students(sno, sname, dept)
values('202301','ȫ�浿','����');
insert into students(sno, sname, dept,birthday)
values('202302','��û��','����','2000-10-04');
insert into students(sno, sname, dept,birthday)
values('202303','�̼���','����','2002-12-10');

/* ������ ��ȸ(����) */
select * from  students; --��� ������ ��ȸ
select * from  students where sno = '202302';
select * from  students where sname like '��%';
select * from  students where sname like '%��%' 
order by sname, birthday asc ; -- ���� 2�� �÷� ����
--  ;�� �־�� �� ������ �����Ƿ� �����ٷ� �Է��Ͽ��� ��

select max(sno)+1 newno from students; -- max �Լ��� ���� ū �� 
--  newno �� ���ο� �÷����� ������ �� ����

/* ������ ���� */
update students set birthday='2002-01-01' where sno='202301';

/* ������ ���� */
delete from students where sno='202301';

commit; --�۾������� ������ ����




