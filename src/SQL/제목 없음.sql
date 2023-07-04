create table guest2(
    gno number(38) primary key  
    ,gname varchar2(20) not null 
    ,gtitle number(38) not null 
    ,gcont number(38) not null 
    ,gdate number(38  
);
insert into guest2 values(25,'이길동','방명록제목02','방명록내용02',sysdate);

select * from emp where deptno=10 and ename = '홍길동';

select * from emp where ename = '나길동' or deptno=10;
select * from emp where not deptno =10 ;
select * from emp where not ename ='나길동' or deptno =10 ;
select * from emp where sal >=1500   and sal <= 3000;  
select * from emp where sal <1500 or  sal <= 3000;
select * from emp where comm =100 or comm = 200 or comm is null ; -- null인 경우는 is not로 판단한다.

/* 컬럼명 between A and B 연산 특징)
    특정 범위의 값을 조회하기 위해서 between and 연산자를 사용한다. 
    A에는 범위의 최소값을 B에는 범위내의 최대값을 기술한다
*/
-- 급여가 1000에서 2000사이의 사원을 검색
select ename,sal from emp where sal between 1000 and 2000;

 -- 급여가 1500에서 2000사이가 아닌 사원을 검색
select ename,sal from emp where sal not between 1500 and 2000;
insert into emp values(14,'박길동',3000,300,30);

/* in 연산의 특징)
    예를 들면 보너스가 300혹은 500혹은 1000인 사원을 물어 볼때는 특정 컬럼의 값이 여라 개의 값
    중에서 하나 인지를 물어보아야 하는데 이 때 사용하는 연산자가 in연산자이다.
   
    사용형식 in (a,b,c)
    특정 컬럼의 값이 a,b,c중에 어느 하나만 만족하더라도 출력되도록 하는 표현을 할 때 사용되는 연산자가
    in이다. in연산자는 or 연산자로 대체가 가능하다.
    
*/ 
select * from emp;
-- 급여가 1000이거나 1500 이거나 2000인 경우 in연산자를 사용해서 사원을 검색
select * from emp where sal in(1000,1500,2000);
-- 위의 in 연산자를 or 연산자로 변경
select * from emp where sal = 1000 or  sal=1500 or sal= 2000;
-- 문제) 보너스가 100, 200,null이 아닌 사원을
select * from emp  where  comm != 100 or comm !=150 or comm is not null;
select * from emp where sal not in(1000,2000,3000);
select * from emp where not(sal =1000 or sal =1500  or sal =2000);
/* like 검색 연산자 특징
    1.검색하려는 값을 정확히 모를 경우에 와일드 카드 문자인 %,_와 함께 사용한다.
    2.와일드 카드 문자 종류
     %: 하나 이상의 임의의 모르는 문자와 매핑 대응
      _: 임의의 모르는 한문자와 매핑 대응

*/
select * from emp;
--f로 시작하는 사원명 검색
select empno, ename from emp where ename like 'f%';
select empno,ename,sal from emp where ename like'%이%'; -- 가장많이 사용한다

-- _와일드 카드 문자와 like 검색 키워드를 사용하여 순신으로 끝나는 사원인 이순신을 검색
select * from emp where ename not like '%나%';
select * from emp where comm is  not null; -- 보너스가 null 아닌 것을 검색한다.
/*order by 기준 컬럼asc/desc 정렬문 특징)
    1asc문은 오름차순 정렬이다. 생략 가능하다.
    2.오른 차순 정렬 규칙
        가. 한글은 가나다 순으로 정렬
        나. 숫자는 작은 숫자부터 정렬
        다. 영어는 알파벳 순으로 정렬 
        
    3.desc는 내림차순 정렬이다. 생략 불간으하다.
    4. 내림차순 정렬 규칙
     가. 한글은 가나다 역순으로 정렬된다.
     나.영어는 알바벳 역순으로 정렬된다.
     다. 숫자는 큰 숫자부터 정렬된다.
*/
-- 사원번호를 기준으로 내림차순 정렬

select * from emp order by deptno desc;

-- 급여를 기준으로 오름차순 정렬
select * from emp order by sal asc;

-- 사원명을 기준으로 오름차순 정렬
select * from emp order by ename;
select 1000*1000 as "곱셈연산" from dual;
select abs(-100) as "-100의 양의 절대값" from dual; 
-- -abs()함수는 절대치를 구한다.

select floor(34.5678) as "소수점 이하를 버리는 floor()함수" from dual; 
-- floor()함수를 사용해서 소수점 이하를 버린다 물론 반올림 안한다

select round(34.5678,2) as "round()함수" from dual;
-- 특정 자리에서 반올림 하는 round()함수
-- round(34.5678,2)에서 두번째 인자값이 2이면 소수점 이하 3번째 자리에서 반올림하여 소수점 이하 두번째 자리까지 표시한다.

select trunc(34.5678,2) as "trunc()함수" from dual;
--trunc(34.5678,2)에서 2번째 인자값이 2이면 소수점 이하 3번쨰 자리에서 버림

select mod(26,3) as "26을 3으로 나눈 나머지 값" from dual; 
--나머지를 구하는 mod()함수 

select upper('oracle') as "영문대문자로 변경하는 upper()함수 "
, lower('ORCLE') as "영문 소문자로 변경하는 lower()함수" from dual;

--왼쪽 공백을 제거하는 LTrim()함수 , 오른쪽 공백을 제거하는 Rtrim()함수, 양쪽 공백을 제거하는 trim()함수
SELECT LTRIM('   oracle') AS "Ltrim()함수로 왼쪽 공백제거",
       RTRIM('oracle   ') AS "Rtrim()함수로 오른쪽 공백제거",
       TRIM('  oracle  ') AS "trim()함수로 양쪽 공백제거"
FROM dual;

MAX_IDENTIFIER_LENGTH

select sysdate-1 as "오늘 날짜와 시간", sysdate+1 as "오늘 날짜와 시간" from dual; 

select  from dual;
/*형변환 함수 종류)
 to_char() : 날자형 또는 숫자형을 
 to_date() : 문자형을 날짜형으로 변환
 to_number(): 문자형을 숫자형으로 변환

*/
select sysdate , to_char(sysdate,'yyyy-mm-dd') as "년월일 표시" from dual;
/* NVL() 함수 특징)
   comm 컬럼 보너스 레코드가 null이면 재대로 된 연봉 계산을 못한다. 그러므로 null을 NVL()함수에 의해서 0으로 변환한 다음 연봉을 
   계산하면 재대로 된 연봉을 계산가능하다.
   

*/
select ename,sal,comm from emp order by ename;
select ename,comm,sal*12+comm as  "연봉" from emp;
select ename,sal,comm ,sal*12+nvl(comm,0) as "연봉 " from emp;

--decode함수 실습을 위한 emp01 테이블 생성
CREATE TABLE emp01 (
  deptno NUMBER(38) PRIMARY KEY,
  ename VARCHAR2(20)
);


insert into emp01 values(10,'miller');
insert into emp01 values(20,'smith');
insert into emp01 values(20,'jones');
insert into emp01 values(30,'allen');
insert into emp01 values(40,'sson');
-- 기존 테이블과 레코드를 유지한채 deptno 부서번호 컬럼의 제약조건 기본키를 제거해서 중복 부서번호가 저정되게 만들어보자
--테이블 수정문
ALTER TABLE emp01 DROP PRIMARY KEY;

select ename,deptno , decode(deptno, 10,'개발부',20,'기회부',30,'디자인') as "부서명" from emp01;

--case 함수 실습 
select ename , deptno , case when 
deptno = 10 then '디자인부서' when
deptno = 20 then '개발부'  when
deptno = 30 then '경리부' when
deptno = 40 then '가게부' end 
as 부서명 from emp01;
/* 그룹 함수 종류)
SUM( ), AVG( ), COUNT( ), 합계 평균 총레코드 개수
MAX( ), MIN( ), STDDEV( ), 최대값 최소값 표준편차
VARIANCE( ) 분산

*/
--그룹함수 실습을 위한 테이블 생성
create table emp02(
deptno number(38) 
,ename varchar2(20)
,sal number(38) 
,comm int 
,job varchar2(50)
);
insert into emp02 values(10,'scott',1000,100,'영업사원');
insert into emp02 values(10,'hak',1500,150,'영업사원');
insert into emp02(deptno,ename,sal,job) values(20,'tend',2000,'관리자');
insert into emp02(deptno,ename,sal,job) values(20,'chol',2500,'관리자');

select * from emp02 order by sal asc;
select * from emp02 order by sal desc;

select  sum(sal) as "연봉 총합" from emp02 ;
select sum(comm) as "보너스 총합" from emp02;

select max(sal) as "급여최대값" , min(sal) as "급여최소값" from emp02;

select avg(sal) as "급여 평균" from emp02;
--보너스를 수령하는 사원수와 총 사원수를 구해보자.
SELECT COUNT(comm) as "보너스를 받은 사원 수" from emp02;
SELECT COUNT(*) as "총 사원수 " from emp02;
