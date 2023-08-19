
/* ���̺� ���� */
create table tbl_juso(
  no int PRIMARY key ,    -- �ߺ� �ȵ�
  name varchar(20) not null,  -- �ݵ�� �Է�
  juso varchar(500),
  phone varchar(20)
);

/* ���̺� ���� Ȯ��*/
desc tbl_juso;  --���̺� ��ȸ

/* ���̺� ����*/
drop table tbl_juso;  -- ���̺� ����

/* ������ �Է� */
insert into tbl_juso(no,name,juso,phone)
values(10,'ȫ�浿','��õ','010-5678-9999'); -- �Է�(�÷����� ���� ���� ��ġ�ؾ���
insert into tbl_juso(no,name,juso,phone)
/* db �ʵ尡 ������� ������ ���� ���� */
values(11,'ȫ�浿','����','010-4567-8877');
insert into tbl_juso(no,name,juso,phone)
values(12,'��û��','����','010-2345-5555');
insert into tbl_juso(no,name,juso,phone)
values(13,'������','�λ�','010-4444-9999');
insert into tbl_juso(no,name,juso,phone)
values(14,'�̼���','�뱸','010-7777-5624');

/* ������ ���� */
select no,name from tbl_juso where no=12; --��ȣ�� 12���� ������
select * from tbl_juso order by name desc; --�̸��� ������������ ����
select * from tbl_juso where name like 'ȫ%';  --*ȫ���� ����
select * from tbl_juso where name like '%��%'; --*�̰� ������ ������

 
 /* ������ ���� */
update tbl_juso   set name='��浿' where no=10; --10���� �������� �̸� ����
select * from tbl_juso; --������ ���� ����
 
update tbl_juso  
set name='��浿', juso='��⵵'  
where no=10;  -- �����ٷ� ���� �ۼ� ����, ������ ; �Է�

/* ������ ���� */
delete from tbl_juso where no = 10; --��ȣ�� 10���� ������ ����

/* ���� */
commit; -- ���� ���� ����


