DROP USER c##community CASCADE; 

CREATE USER c##community IDENTIFIED BY c##community1234 
DEFAULT TABLESPACE users TEMPORARY TABLESPACE temp PROFILE DEFAULT;
alter user c##community default tablespace users quota unlimited on users;

GRANT CONNECT, RESOURCE TO c##community;

ALTER USER c##community ACCOUNT UNLOCK;

