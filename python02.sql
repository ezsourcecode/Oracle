-- ���� ��� ���̺� ����
drop table member;
drop table member cascade constraints;

-- ȸ�������� ������ ���̺� ����
create table member(
    userid varchar2(10) primary key,
    userpass varchar2(20) not null,
    username varchar2(20) not null
);

-- DDL�� �ڵ� commit�� ��

-- ���ڵ� ����
insert into member values('admin', 'admin', '������');
insert into member values('aaa', '1234', 'ȫ�浿');

commit;

select * from member;

update member set userpass = '1234' where userid = 'admin';

commit;

delete from member where userid = 'aaa';