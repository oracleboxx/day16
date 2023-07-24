create table emp35 as select * from emp27;
select * from emp35;


 UPDATE emp35 SET deptno =  30 WHERE deptno  = 20;
    
update emp35 setdeptno =20 where empno =101;

--
create table dept(
deptno number(38) primary key 
,dname varchar2(50)
,LOC varchar2(100) 
);
insert into dept values(10,'경리부','서울');
insert into dept values(20,'영업부','부산');
insert into dept values(30,'관리부','인천');
insert into dept values(40,'연구부','대전');

select * from dept01 order by deptno asc;

create table dept01 as select * from dept;

update dept01 set (dname,LOC) = (select dname,LOC from dept where deptno = 40)
where deptno =20;
-- dept 테이블의 40번 부서번호의 부서명과 부서지역을 검색해서 
--dept01 테이블의 20번 부서의 부서명과 부서지역을 연구부,대전으로 변경