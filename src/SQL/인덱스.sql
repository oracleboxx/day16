/*오라클에서 인덱스를 사용하는 목적 : 빠른 검색을 위해서이다
테이블 생성시 기본키 또는 유일키 제약조근을 설정하면 오라클에서 해당 커럼에 기본으로 인덱스를 생성해준다.
*/

create table emp201(
empno number(38) primary key
,sname varchar2(100)
,sal number(38)
);
insert into emp201  values(11,'홍길동',100);
insert into emp201  values(12,'이순신',200);
insert into emp201  values(13,'강감찬',300);

select * from emp201;


create table emp202
as select * from emp201;

select table_name, index_name,column_name from user_ind_columns
where table_name in('EMP201','EMP202');

/* INDEX_NAME 컬럼에는 인덱스명이 저장되어 있고 ,emp201 원본 테이블의 기본키로 설정된 empno 컬럼에만 오라클에서 제공한
기본 인덱스가 설정되어 있다. 결국 복제본 테이블에는 원본의 인덱스까지는 복제되지 않는다는 것을 알 수 있다


*/
insert into emp202
select * from emp202;

create index idx_emp202_ename
on emp202(sname);

--emp202 테이블에 생성된 idx_emp202_empno 인덱스를 삭제
drop index idx_emp202_ename;
commit