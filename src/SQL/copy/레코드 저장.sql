create table emp26(
empno number(38) primary key
,ename varchar(30) 
,LOC varchar2(50)
);

select * from emp26 order by ename asc;

insert into emp26_copy1(LOC,ename,empno) values('서울','홍길동',11);
insert into emp26_copy1 values(12,'세종대왕','경복궁');

create table emp26_copy1 as select * from emp26 where 1=2;

select * from emp26_copy1 ;

create table emp26_copy1 as select * from emp26 where 7=0;

select * from emp26_cop1;

create table emp27(
empno number(38) primary key
,ename varchar(30) 
,sal number(38) 
,LOC varchar2(50)
,deptno number(38)
);
insert into emp27 values(101,'홍길동',1000,'서울시 동대문구',10);
insert into emp28 values(102,'이길동',1500,'서울시 강남구',20);
insert into emp2 values(103,'최길동',2000,'서울시 동작구',30);

select * from emp27;
create table emp28 as select ename,sal,deptno from emp27 where 1=2

insert All into emp28 values(empno,ename,sal)
     into emp29 values(empno,ename,LOC)
select empno,ename,sal,LOC from emp27 where deptno =20;


select * from emp28 order by empno;

/* insert all when 조건식 then 문 특징
    복수개의 테이블에 다중행 레코드 저장할 때 when 조건식에 맞는 자료만 저장시킨다.
*/
--empno,ename,deptno 컬럼만 복제한 emp30테이블 생성
create table emp30 as select empno,ename,deptno from emp27 where 10=0;
select * from emp30;

--where 조건식을 거짓으로 해서 emp27 원본 테이블의 empno,ename,sal 컬럼 구조만 복제한 emp31테이블을 생성
create table emp31 as select empno,ename,sal from emp27 where 10=0;
select * from emp31;


select empno,ename,sal,deptno from emp27;

insert all
when sal >= 1000 then -- 급여가 1000 이상인 경우 다중행 레코드 저장
into emp31 values(empno,ename,sal)
when deptno =20 then  -- 부서번호가 20인 경우 다중행 레코드 저장
into emp30 values(empno,ename,deptno)
select empno,ename,sal,deptno from emp27;

select * from emp30 order by empno asc;

