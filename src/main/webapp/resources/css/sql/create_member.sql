drop table member;
create table member ( 
    id varchar2(20) not null,
    password varchar2(20) not null,
    name varchar2(20) not null,
    birth  varchar2(20),
    email  varchar2(40),
    phone varchar2(30),
    regist_day varchar2(50),    
    primary key(id) 
) ;

select * from member;

