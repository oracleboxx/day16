select * from mem_addr;
delete from mem_addr where column_id =  4;
insert into mem_addr values(10,'홍길동','010-111-222','Test@naver.com','서울시','노원구','공릉동');

update mem_addr
set mem_name ='이순신'
where mem_name ='홍길동';

update mem_addr
set mem_email = 'leeshin@gmail.com'
where mem_email = 'Test@naver.com';

UPDATE mem_addr
SET mem_name = '이순신', mem_email = 'leeshin@gmail.com'
WHERE mem_no = 3;