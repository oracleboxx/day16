/* Ansi cross join , inner join 실습을 위한 테이블 생성
    depart11 테이블 생성

*/
create table depart11(
dept_code varchar2(20) primary key 
,dept_name varchar2(50) not null
);
insert into depart11 values('401','홍길동 샘');
insert into depart11 values('402','이순신 샘');

select * from depart11 order by dept_code asc;

--student11 학생 테이블 생성
create table student11(
st_no number(38) primary key
,st_name varchar2(30) not null
,st_gender varchar2(10)
,dept_code number(20)
);
insert into studen11 values(11,'신사임당','여','401');
insert into studen11 values(12,'홍길순','여','402');
insert into studen11 values(13,'강감찬','남','402');


select * from student11 order by st_no asc;
select * from student11,depart11 ;

select st_no,st_name,st_gender,dept_code,dept_name from student11 inner join depart11 using(dept_code);

select st_no,st_name,st_gender,dept_code,dept_name from depart11 natural join student11;

create table dept21(
deptno number(38) primary key
,dname varchar2(50) -- 부서명
);
insert into dept21 values(10,'accounting');
insert into dept21 values(20,'research');

select * from dept21 order by deptno asc;

create table dept22(
deptno number(38) primary key
,dname varchar(50)
);
insert into dept22 values(10,'accounting');
insert into dept22 values(30,'sales');
select * from dept22 order by deptno asc;


select * from dept21 right outer join dept22 on dept21.deptno = dept22.deptno;
// -- left 왼쪽 테이블 기준으로 비교 right 오른쪽 테이블 기준으로 비교
-- 해당 자료가 없을 경우 출려되지 않는 문제점을 해결하기 위해서 나온 조인기법이다.
-- 공통 컬럼이 있다면 on조건절 대신 using 절문을 사용할 수 있다. 이런 경우
-- 테이블명.컬럼명 형태가 아닌 컬럼명만 명시한다. 즉 테이블명이나 테이블명 별칭은 올 수가 없다
select * from dept21 right outer join dept22 using(deptno);

select * from dept21 full outer join dept22 using(deptno);
