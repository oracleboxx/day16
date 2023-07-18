/* 단일행 서브쿼리문이란 서브 쿼리문 실행 결과 레코드 행 값이 한행으로 검색되는 경우를 말한다.
   단일행 서브쿼리문 비교연산자 종류)
    = ,>,>=,<,<=,   <>같지않다
*/ 
--단일행 서브쿼리문 실습을 위한 테이블 생성
create table dept15 (
deptno number(38) primary key --부서번호
,dname varchar2(50) 
);
insert into dept15 values(10,'관리부');
insert into dept15 values(20,'영업부');
insert into dept15 values(30,'개발부');
 
 select * from dept15 order by deptno asc;
commit

create table emp15 (
empno number(38) primary key
,ename varchar2(50)
,job varchar2(50)
,sal number(38) 
,comm int 
,deptno number(38) 
);
insert into emp15 values (21,'최길동','관리사업',2000,0,10);
insert into emp15 values (22,'이길동','자바개발자',3000,300,20);
insert into emp15 values (23,'김길동','c언어개발자',2800,200,20);
insert into emp15 values (24,'박길동','기획사원',2000,200,30);
insert into emp15 values (25,'홍길동','기획팀장',4000,400,30);

commit

select * from emp15 order by deptno asc;

select dname as "부서명" from dept15 
where deptno = (select deptno from emp15 where ename = '홍길동');

select avg(sal) as " 급여평균" from emp15;

select ename, sal from  emp15 where sal >(select avg(sal) from emp15);


/* 다중행 서브쿼리는 서브쿼리문의 실행 결과 레코드행이 하나 이상인 경우를 말한다. 다중행 서브쿼리문 연산자로 단일행 서브쿼리문
연산자를 사용할 수 없다.
    
 2.다중행 서브쿼리문 연산자 종류
 가. in연산자 : 서브쿼리문의 실행 결과 레코드 값중에서 하나라도 일치하면 메인 쿼리의 where 조건절이 참이되는 연산자를 말한다.
 
*/
select distinct deptno from emp15 where sal>= 1200;  
select ename,sal,deptno from emp15 where deptno =(select distinct deptno from emp15 where sal>= 1200);
-- 다중행 서브 쿼리문에서는 단일행 서브쿼리문 연산자 = 는 사용할 수 없다.
select ename,sal,deptno from emp15 where deptno in(select distinct deptno from emp15 where sal> = 1200);
-- in 다중행 서브쿼리문 연산자

select max(sal) from emp15 group by deptno
having deptno=20;



select ename,sal,deptno from emp15 where sal > (select max(sal) from emp15 group by deptno having deptno=20);
-- 20번 부서번호의 최대급여 보다 큰 사원명 , 급여 ,부서번호를 검색하는 단일행 서브쿼리문이다.
select sal from emp15 where deptno =20;

select ename,sal,deptno from emp15 where sal > all (select sal from emp15 where deptno =20);

select ename,sal,deptno from emp15 where sal > (select min(sal) from emp15 group by deptno having deptno=20);


create table emp16 as select * from emp15; -- emp15의 원본 테이블의 테이블구조와 레코드까지 모두 복제한 emp16테이블 생성
select * from emp19

create table emp17 as select empno,ename,sal,deptno from emp15;


create table emp18 as select empno,ename,sal,deptno from emp16;
create table emp18 as select * from emp15 where deptno =30;

CREATE TABLE emp19  AS SELECT * FROM emp15 WHERE 1=2











