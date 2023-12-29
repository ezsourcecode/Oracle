-- ���̺� ��� Ȯ��
select * from tab;
select * from product;

-- �������� ���� ���̺� ����
drop table product;

-- �������� �ִ� ���̺� ����
drop table product cascade constraints;

-- ���̺� ����
create table product(
    product_id number primary key, -- ��ǰ��ȣ ���� �⺻ Ű
    product_name varchar2(50), -- ��ǰ��
    price number default 0, -- ��ǰ���� ���� �⺻ �� 0
    description clob, --��ǰ ����
    picture_url varchar2(500) -- ��ǰ���� url
);

-- ���ڵ� ����
insert into product values(1, '����', 1500, '���ִ� ����', 'lemon.jpg');
insert into product values(2, '������', 1500, '���ִ� ������', 'orange.jpg');
insert into product values(3, 'Ű��', 1500, '���ִ� Ű��', 'kiwi.jpg');
insert into product values(4, '����', 1500, '���ִ� ����', 'grape.jpg');
insert into product values(5, '����', 1500, '���ִ� ����', 'strawberry.jpg');

-- db �ݿ�
commit;

select * from product;

-- product ���̺��� ���ڵ� �� Ȯ��
select count(*) from product;
