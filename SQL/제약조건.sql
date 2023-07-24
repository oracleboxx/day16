create table depart71(
deptcode varchar2(10) constraint depart71_deptcode_pk primary key -- 학과코드
,deptname varchar2(50) constraint depart71_deptname_nn not null -- 학과코드
);
insert into depart71 values('a001','영어교육학과');
insert into depart71 values('a002','컴퓨터공학과');

select * from depart71 order by deptcode asc;

drop table student;
-- 외래키가 있는 학생테이블 student71을 생성
create table student71(
sno number(38) constraint student71_sno_pk primary key
,sname varchar2(50) constraint student71_sname_nn not null
,gender varchar2(10) constraint student71_gender_nn not null
,addr varchar2(300)
,deptcode varchar2(10) constraint student_deptcode_fk references depart71(deptcode) -- 외래키 설정
);
insert into student71 values(101,'홍길동','남','서울시','a001');
insert into student71 values(102,'이순신','남','서울시','a002');
select * from student71 order by sno asc;

select table_name, constraint_type,constraint_name, r_constraint_name from user_constraints
where table_name in('DEPART71','STUDENT71');


CREATE table emp73(
empno number(38) constraint emp73_empno_pk primary key
,ename varchar2(50) constraint emp73_ename_nn not null 
,sal number(38) constraint emp73_sal_ck check(sal between 500 and 5000) -- 급여 check 제약조건을 주면서 급여가 500부터 5000 사이만 저장
,gender varchar2(10) constraint emp73_gender_ck check(gender in('M',F'')) -- 성별, gender 컬럼에는 체크제약 조건을 주면서 M,F 둘중 하나만 저장
);

insert into emp73 values(1002,'홍길동',4000,'M(남성)');

ALTER TABLE emp73
ADD CONSTRAINT emp73_gender_ck CHECK (gender IN ('M(남성)', 'F(여성)'));

create table dept73(
deptno number(38) primary key
,dname varchar2(50)
,LOC varchar2(50) default '서울'
);
insert into dept73 (deptno,dname) values(10,'개발부');
select * from dept73 order by deptno asc;

create table dept71(
deptno number(38) constraint dept71_deptno_pk primary key
,dname varchar2(100) constraint dept71_dname_nn not null
,LOC varchar2(50)
);

create table emp75(
empno number(38) primary key
,ename varchar2(50) not null
,job varchar2(30) unique
,deptno number(38) references dept71(deptno)
);

create table emp76(
empno number(38)
,ename varchar(50) not null
,job varchar2(50)
,deptno number(38)
,primary key(empno)
,unique(job)
,foreign key(deptno) references dept71(deptno)
);

create table emp77(
empno number(38) 
,ename varchar2(50) constraint emp77_ename_nn not null
,job varchar2(50) 
,deptno number(38)
,constraint emp77_empno_pk primary key(empno)
,constraint emp77_job_uk unique(job)
,constraint emp77_deptno_fk
foreign key(deptno) references dept71(deptno) 

);

-- 하나의 테이블에 2개의 기본키 인 복합키를 지정하는 테이블 생성
create table member01(
id varchar2(20)
,name varchar2(50)
,addr varchar2(200)
,phone varchar2(30)
,constraint member01_idphone_pk primary key(id,phone) -- id,phone 2개 컬럼을 기본키로 지정

);
CREATE TABLE member01 (
    id VARCHAR2(20),
    name VARCHAR2(50),
    addr VARCHAR2(200),
    phone VARCHAR2(30),
    CONSTRAINT member01_idphone_pk PRIMARY KEY (id, phone)
);
select owner, constraint_name,table_name,column_name from user_columns
where table_name ='MEMBER01';


SELECT owner, table_name, column_name
FROM user_tab_columns
WHERE table_name = 'MEMBER01';


create table emp78(
empno number(38)
,ename varchar2(50)
,job varchar2(50)
,deptno number(38)
);
alter table emp78
add constraint emp78_empno_pk primary key(empno);

select constraint_name, constraint_type, table_name, r_constraint_name 
from user_constraints where table_name = 'EMP78';

alter table emp78
add constraint emp78_deptno_fk 
foreign key(deptno) references dept71(deptno);

-- emp78 테이블의 ename 컬럼에emp78_ename_nn 사용자정의 제약조건명을 지정하면서 not null 제약조건 추가
alter table emp78
modify ename constraint emp78_ename_nn not null ;

alter table emp78
drop 

insert into emp78 values(11,'이순신','관리사원',10);
insert into emp78 values(12,'홍길동','영업사원',20);
insert into emp78 values(11,'이길동','영업사원',30);
alter table emp78 drop constraint emp78_ename_fk; 
select * from emp78;

select constraint_name from user_constraints where table_name ='EMP78';

insert into emp78 values(13,null,'영업사원',20);

alter table emp78 drop constraint emp78_empno_pk;


create table dept91(
deptno number(38) constraint dept81_deptno_pk primary key
,dname varchar2(50)
,LOC varchar2(50)
);

insert into dept91 values(10,'영업부','서울');
insert into dept91 values(20,'관리부','부산');

select * from dept91 order by deptno asc;

create table emp91(
empno number(38) constraint emp91_empno_pk primary key
,ename varchar2(50) constraint emp91_ename_nn not null
,job varchar2(20)
,deptno number(38) constraint emp91_deptno_fk
references dept91(deptno)
);

insert into emp91 values(11,'홍길동','경리부',10);
insert into emp91 values(12,'이길동','영업부',20);

select * from emp91;
select * from dept91;

-- 외래키로 설정된 컬럼에 레코드가 있는 상태에서 주인키 부서번호 10번 삭제시도
delete from dept91 where deptno =10;

-- emp91 테이블 외래키 삭제하지 않고 잠시 비활성화
alter table emp91 enable constraint emp91_deptno_fk;


select constraint_name ,status from user_constraints where table_name ='EMP91';
-- status 컬럼값에서 disable는 제약조건 비활성화 enabled는 제약조건 활성화

insert into dept91 values(10,'경리부','서울');

-- cascade 옵션을 사용하기 위한 주종관계 부모와 자손테이블 생성

-- 기본키가 있는 부서 테이블 생성)
create table dept81(
deptno number(38) constraint dept81_deptno_pk2 primary key
,dname varchar2(30) not null
,LOC varchar2(50) not null
);
select * from dept81;

insert into dept81 values(101,'관리부','서울');
insert into dept81 values(102,'개발부','여수');

create table emp81(
empno number(38) constraint emp81_empno_pk primary key
,ename varchar2(50) constraint emp81_ename_nn not null
,job varchar2(50)
,deptno number(38) constraint emp81_deptno_fk references dept81(deptno)
);

insert into emp81 values(7001,'이순신','관리사원',101);
insert into emp81 values(7002,'강감찬','java개발자',102); -- 
select constraint_name, status, constraint_type,table_name from user_constraints where table_name in('EMP81','DEPT81');


alter table dept81 disable primary key cascade;

alter table dept81 drop primary key cascade; -- 이옵션으로 기본키를 삭제하면 외래키까지 한꺼번에 삭제
