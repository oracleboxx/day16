create table guest2(
    gno number(38) primary key  
    ,gname varchar2(20) not null 
    ,gtitle varchar2(200) not null 
    ,gcont varchar2(4000) not null 
    ,gdate date  
);
insert into guest2 values(25,'이길동','방명록제목02','방명록내용02',sysdate);

  
