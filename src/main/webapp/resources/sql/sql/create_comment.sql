boardid를 fk로 만들기 위해 board 테이블 수정 필요
유저의 id는 그냥 id로 fk 가져오자


create table comment(
	boardid number not null,
	id number(20) not null,
	commentDate varchar(50),
	commentText varchar(100),
	commentHit number,
	primary key(boardid),
	primary key(id) 
	
);