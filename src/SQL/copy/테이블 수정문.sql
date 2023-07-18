/* alter table 테이블명 add(추가할 컬럼명 자료형(크기))

*/
create table emp21(
empno number(38) primary key
,ename varchar2(30)
,sal number(38) 
);

desc  emp21_test;


--emp 21 테이블에 job 컬럼을 추가
alter table emp21 add(job varchar2(50));
alter table emp21 modify(job varchar(30));
alter table emp21 drop column job;

insert into emp21 values (11,'홍길동',2000);
insert into emp21 values (12,'심사임당',3000);
select * from emp21 order by empno desc;


rename emp21 to emp21_test;


truncate table emp21;
drop table emp21_test;



select table_name from user_tables order by table_name asc;


