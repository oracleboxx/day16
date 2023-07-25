
select * from emp81_copy;

create table dept81_copy as select * from dept81;

create table emp81_copy(
empno number(38) primary key,
ename varchar2(100),
job varchar2(100),
sal int,
comm int,
deptno int
);
insert into emp81_copy values(201,'홍길동','관리부',100,10,101);
insert into emp81_copy values(202,'이순신','개발사원',200,20,102);

select * from emp81_copy order by empno asc;
select * from emp_view30;
create table emp_view30
as select empno,ename ,deptno from emp81_copy where deptno= 101;
drop table emp_view30;

select view_name,text from user_views;

-- 뷰를 통해서 실제 테이블에 레코드를 저장
insert into emp_view30 values (203,'강감찬',102);
select * from emp81_copy;
/* 가상테이블 뷰를 사용하는 목적)
    1.복잡한 쿼리문을 단순화 할 수 있다.
    2.실제 테이블을 뷰를 통해서 숨길 수 있다. 즉 보안면에서 유리하다.

*/
--기본키가 있는 

create table dept86(
deptno number(38) constraint dept86_deptno_pk primary key
,dname varchar2(200) constraint dept86_dname_nn not null
,LOC varchar2(50) 
);
insert into dept86 values(10,'영업부','서울');
insert into dept86 values(20,'관리부','부산');

select * from dept86 order by deptno;

create table emp86(
empno number(38) constraint emp86_empno_pk primary key
,ename varchar2(100) constraint emp86_name_nn not null
,sal number(38) 
,job varchar2(100)
,comm number(38)
,deptno number(38) constraint emp86_deptno_fk references dept86(deptno)
);
select* from emp86;

insert into emp86 values(101,'이순신',3000,'영업사원',300,10);
insert into emp86 values(102,'강감찬',6000,'영업과장',600,10);
insert into emp86 values(103,'홍길동',5000,'인사과장',0,20);


-- deptno 공통컬럼과 부서번호가 10인 경우 equi조인검색
select empno,ename,job,sal,comm,d.deptno,dname from dept86 d ,emp86 e 
where d.deptno= e.deptno and e.deptno =10 order by empno asc;

--복잡한 조인 쿼리문을 가상테이블 뷰를 통해서 단순화
create view join_view as
select empno,ename,job,sal,comm,d.deptno,dname from dept86 d ,emp86 e 
where d.deptno= e.deptno and e.deptno =10 order by empno asc;
-- 뷰를 통해서 조인검색해서 실제 조인문을 단순화 시킴
select * from join_view;

-- 삭제할 del_view 가상테이블 뷰 생성
create view del_view
as select empno,ename from emp86;
select view_name from user_views;
drop view del_view; 


--or replace 옵션 실습을 위한 뷰 생성
create view re_view 
as select empno,ename from emp86;


select * from re_view;

--re_biew 뷰에    or replace 사용해서 수정가능하다
create or replace view re_view
as select empno,ename,sal from emp86;

--force옵션을 사용해서 기존테이블 없어도 view 생성한다

create or replace force view for_view
as select empno,ename from abc;


--생성된 뷰이름 확인
select  view_name from user_views;

--with check option 실습
create or replace view view_check
as select empno,ename ,deptno from emp86 where deptno =20 with check option;

select * from view_check;

update view_check
set deptno =10 
where empno= 103;

-- 20번 부서번호는 뷰 생성시 with check option을 사용해서 뷰를 통한 20번 부서번호 수정못한다

--with read only 옵션을 사용한 뷰 생성
create or replace view only_view
as select empno,ename,sal,comm,deptno
from emp86 where deptno =20 with read only;


select * from only_view;

update only_view
set comm=500 
where empno =103; -- only view 는 단지 읽기만 가능한 뷰이기 떄문에 보너스 컬럼 자료 수정못함


-- rowNum 컬럼 실습을 위한 테이블 생성
create table emp92(
empno number(38) primary key
,ename varchar2(100)
,sal int);

insert into emp92 values(1,'홍길동',1000);
insert into emp92 values(2,'강감찬',2000);
insert into emp92 values(3,'이순신',3000);

select rowNum , empno,ename,sal from emp92 order by empno asc;

select rowNum , empno,ename,sal from emp92 order by empno desc;

-- 저장 공간이 필요없는 가상테이블 뷰를 사용해서 rowNum컬럼 순번을 변경

create or replace view row_view 
as select empno,ename,sal from emp92 order by empno desc;

create or replace view 
select rowNum ename from row_view;

delete from emp92 where empno =2;
drop table emp92;

