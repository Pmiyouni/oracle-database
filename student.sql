/* 테이블 생성 */
create table students(
sno char(6) not null primary key, /*학번*/
sname  varchar(20) not null, /*이름*/
dept  varchar(20) not null, /*학과*/
birthday date, /*생년월일*/
year int default 1  /*1학년*/
);
desc students; 
drop table students;

/* 데이터 입력 */
insert into students(sno, sname, dept)
values('202301','홍길동','컴정');
insert into students(sno, sname, dept,birthday)
values('202302','심청이','컴정','2000-10-04');
insert into students(sno, sname, dept,birthday)
values('202303','이순신','컴정','2002-12-10');

/* 데이터 조회(추출) */
select * from  students; --모든 데이터 조회
select * from  students where sno = '202302';
select * from  students where sname like '이%';
select * from  students where sname like '%이%' 
order by sname, birthday asc ; -- 정렬 2개 컬럼 기준
--  ;가 있어야 한 문장이 끝나므로 여러줄로 입력하여도 됨

select max(sno)+1 newno from students; -- max 함수는 가장 큰 값 
--  newno 는 새로운 컬럼명을 지정할 수 있음

/* 데이터 수정 */
update students set birthday='2002-01-01' where sno='202301';

/* 데이터 삭제 */
delete from students where sno='202301';

commit; --작업내용의 서버에 적용




