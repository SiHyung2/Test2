drop table community;
create table community ( 
    id varchar2(20) not null,
    password varchar2(20) not null,
    name varchar2(20) not null,
    gender varchar2(10),
    birth  varchar2(20),
    mail  varchar2(40),
    phone varchar2(30),
    address varchar2(90),
    regist_day varchar2(50),    
    primary key(id) 
) ;

select * from community;

