create table dept05(
deptno number(38) primary key 
,dname varchar(100) not null 
);

insert into dept05 values(10,'관리부');
insert into dept05 values(20,'영업부');
insert into dept05 values(30,'연구부');

select * from dept05 order by deptno asc;
create table emp05(
empno int primary key
,ename varchar(20)
,job varchar2(50)
,sal int 
,comm int
,deptno number(38)
);

insert into emp05 values(11,'홍길동','관리사원',1500,0,10);
insert into emp05(empno,ename,job,sal,comm,deptno)  values(12,'이순신','영업사원',1200,120,20);
insert into emp05 values(13,'강감찬','영업사원',1300,130,20);
insert into emp05 values(14,'심시임당','연구원',3000,300,30);

select * from emp05 order by empno asc;

select * from dept05 ,emp05;

/* Equi 조인 검색을 위한 테이블 생성*/
--room테이블 생성
create table room(
roomno number(38) primary key -- 강의실 호수
,roomname varchar2(50) not null -- 강의실 당담 샘
);

insert into room values(404,'홍길동 샘');
insert into room values(405,'이순신 샘');
select * from room order by roomno asc;

create table st03(
stno number(38) primary key
,stname varchar2(20)
,roomno number(38)
);

insert into st03 values(101,'이학생',404);
insert into st03 values(102,'김학생',405);
insert into st03 values(103,'최학생',405);
commit;

select * from st03 order by stno asc;

-- roomno 공통 컬럼을 기준으로 equi 조인 검색
select * from room , st03 where room.roomno = st03.roomno;
-- 신사임당 학생의 equi 조인검색 
select stno,stname,room.roomno,roomname from room,st03 where room.roomno = st03.roomno and stname ='최학생';


select stno,stname,room.roomno,roomname from room,st03 where room.roomno = st03.roomno and stname like '%이%'
;

-- 신으로 시작하는 임의의 모르는 학생 equi 조인검색: 테이블명 별칭을 사용한다.
select stno,stname, r.roomno,roomname 
from room r, st03 s
where r.roomno = s.roomno 
and stname like '최%';

-- non equi 조인 검색을 실습을 위한 급여등급 테이블 salgrade생성
create table salgrade(
grade number(38) primary key
,losal number(38) not null
,hisal number(38) not null
);
insert into  salgrade values(1,700,1200);
insert into  salgrade values(2,1201,1400);
insert into  salgrade values(3,1401,3000);

commit ;

select * from salgrade order by grade asc;

select * from emp05 order by empno asc;


/* where 조건절에서 특정 범위내의 조인 조건으로 검색하는 기법인 non equi 조인문

*/
select ename,sal,grade from emp05,salgrade where sal between losal and hisal;

select e.ename , e.sal , s.grade from emp05 e, salgrade s where e.sal >=s.losal and e.sal <=s.hisal;


/* 사원테이블 emp05와 부서테이블 dept05는 공통 컬럼 기준 deptno에 의한 equi 조인 검색 + 급여등급 테이블 salgrade nonequi조인
 결국 3개 테이블 조인검색 => equi 조인 + non equi 조인 
 
*/
select e.ename ,e.sal ,s.grade ,d.deptno, d.dname from emp05 e, salgrade s , dept05 d where e.deptno = d.deptno 
and e.sal between s.losal and s.hisal;


select distinct* from emp05;
commit;


create table emp4(
empno number(10) primary key
,ename varchar2(50) not null
,sal number(38) not null 
,deptno number(10)  null
);
insert into emp4 values(1,'이길동',200,5);
insert into emp4 values(2,'최길동',300,6);
insert into emp4 values(3,'박길동',400,7);

select * from emp4 order by empno desc;