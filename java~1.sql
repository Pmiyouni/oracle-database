
/* 테이블 생성 */
create table tbl_juso(
  no int PRIMARY key ,    -- 중복 안됨
  name varchar(20) not null,  -- 반드시 입력
  juso varchar(500),
  phone varchar(20)
);

/* 테이블 구조 확인*/
desc tbl_juso;  --테이블 조회

/* 테이블 삭제*/
drop table tbl_juso;  -- 테이블 삭제

/* 데이터 입력 */
insert into tbl_juso(no,name,juso,phone)
values(10,'홍길동','인천','010-5678-9999'); -- 입력(컬럼수와 값의 개수 일치해야함
insert into tbl_juso(no,name,juso,phone)
/* db 필드가 순서대로 있으면 생략 가능 */
values(11,'홍길동','강릉','010-4567-8877');
insert into tbl_juso(no,name,juso,phone)
values(12,'심청이','서울','010-2345-5555');
insert into tbl_juso(no,name,juso,phone)
values(13,'강감찬','부산','010-4444-9999');
insert into tbl_juso(no,name,juso,phone)
values(14,'이순신','대구','010-7777-5624');

/* 데이터 추출 */
select no,name from tbl_juso where no=12; --번호가 12번인 데이터
select * from tbl_juso order by name desc; --이름을 오름차순으로 정렬
select * from tbl_juso where name like '홍%';  --*홍으로 시작
select * from tbl_juso where name like '%이%'; --*이가 포함한 데이터

 
 /* 데이터 수정 */
update tbl_juso   set name='김길동' where no=10; --10번인 데이터의 이름 수정
select * from tbl_juso; --데이터 전부 추출
 
update tbl_juso  
set name='김길동', juso='경기도'  
where no=10;  -- 여러줄로 문장 작성 가능, 끝에는 ; 입력

/* 데이터 삭제 */
delete from tbl_juso where no = 10; --번호가 10번인 데이터 삭제

/* 적용 */
commit; -- 변경 내용 저장


