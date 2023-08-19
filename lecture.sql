--학생테이블
create table students(
 scode char(6) not null primary key,--학번
 sname varchar(20) not null, --학생명
 dept varchar(20) not null --학과
);
desc students;

-- 과목테이블
create table courses(
ccode char(3) not null primary key, --과목코드
cname varchar(100) not null --과목명
);

desc courses;

-- 수강신청 테이블
create table enrols(
 scode char(6) not null, --학번
 ccode char(3) not null, --과목코드
 grade int default 0, --점수
 edate date default sysdate, --신청일
 primary key(scode,ccode), -- 학번,과목코드를 설정
  FOREIGN KEY(scode) REFERENCES students(scode), --외래키(학번)
  FOREIGN KEY(ccode) REFERENCES courses(ccode) --외래키(과목코드)
);

-- 학생테이블 데이터 입력
INSERT INTO studentS(scode,sname,dept)
 VALUES('202301','홍길동','컴정');
 INSERT INTO studentS(scode,sname,dept)
 VALUES('202302','심청이','컴정');
INSERT INTO studentS(scode,sname,dept)
 VALUES('202303','이순신','컴정');

select * from students;

--과목테이블 데이터 입력
INSERT INTO courses(ccode,cname)
 VALUES('100','자바');
 INSERT INTO courses(ccode,cname)
 VALUES('101','데이터베이스');
 INSERT INTO courses(ccode,cname)
 VALUES('102','html');
 
 select * from courses;

-- 수강신청테이블 데이터 입력 
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
 
 
 
 -- 테이블 조인
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


