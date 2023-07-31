create sequence dept_deptno_seq
 start with 1 
increment by 1
nocache ;

select sequence_name, increment_by from user_sequences;

select dept_deptno_seq.nextval as "시퀸스 번호 값 확인" from dual;

/*게시판번호, 자료실 번호, 공지사항 번호에 해당하는 컬럼에 적용한다. 이컬럼에는 중복번호가 없고 null 이 없는 primary key로
  설정된 컬럼이고 동시에 정수 숫자형으로 선언된 컬럼 레코드값 번호 저장용도로 사용된다

*/

-- 시퀸스 삭제 문법  drop sequence 시퀸스 명

create sequence dept_test1
start with 10
increment by 10
maxvalue 30; 

select sequence_name , max_value ,increment_by from user_sequences;
select dept_text.nextval as "번호값01" from dual; 
select dept_text1.nextval as "번호값01 " from dual;
drop sequence dept_del_seq;

alter  sequence dept_test1
maxvalue 1000;

 
 create table HakTable(
 age number(38) 
 ,
name varchar2(50) ,
 address varchar2(50),
	 tel varchar2(50),
	 gender varchar2(50),
 job  varchar2(50)
 );

create sequence Hak_seq
start with 1
increment by 1
nocache;

 SELECT Hak_seq.NEXTVAL FROM DUAL; 
 
 