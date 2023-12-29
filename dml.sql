-- ������ ���Ǿ�: DDL
-- ������ ���̽��� ������ �����ϴ� ��ɾ� CREATE
-- ������ ���̽��� ������ �����ϴ� ��ɾ� ALTER
-- ������ ���̽��� ������ �����ϴ� ��ɾ� DROP / CASCADE - ��������(����)
-- ������ ���̽��� ������ �̸��� �����ϴ� RENAME

-- ������ ���̽� ����: ���̺�(�⺻), ��, �ε���, ������, �ý��� īŻ�α� ��
-- ���̺��� ������ �� CREATE TAB ~
-- Question 1. ��ǰ(PRODUCT) ���̺��� �����Ͻÿ�.
CREATE TABLE PRODUCT(
                                NUM NUMBER(2), 
                                NAME VARCHAR2(5), 
                                PRICE NUMBER, 
                                QTY NUMBER
);
-- ���̺� ���� Ȯ��
DESC PRODUCT;

-- Question 2. �μ�(DEPT) ���̺��� �����Ͻÿ�. ������ ���̺� �μ���ȣ(DNO), �μ���(DNAME), �μ���ġ(LOC)�� ������ �ڷ����� ����Ͽ� �����Ͻÿ�.
CREATE TABLE DEPT(
                                DNO NUMBER(2), 
                                DNAME VARCHAR2(15), 
                                LOC VARCHAR2(20)
 );
 
 DESC DEPT
 
 -- Question 3. ������ �����ϴ� ���̺��� �̿��Ͽ� ���ο� ���̺� ����: AS��
 -- ������ �����ϴ� ���̺��� ������ ���� �Ǵ� ������ �����Ͽ� ���ο� ���̺��� ������ �� �ִ�.
SELECT  * FROM DEPT;

CREATE TABLE DEPT_SECOND 
AS /*AS ��������*/
SELECT * FROM DEPARTMENT;

DESC DEPT_SECOND

SELECT * FROM DEPT_SECOND;

-- Question 4. ������̺� ������ SALESMAN�� �ش��ϴ� ����� ������ ���ο� ���̺� SALES�� ������ ������ �����ϴ� ������ ����Ͻÿ�.
CREATE TABLE SALES
AS
SELECT * FROM EMPLOYEE
WHERE JOB = 'SALESMAN';
SELECT * FROM SALES;

-- Question 5. ������̺� �����ȣ, �����, �Ի�����, �޿� �÷��� �̿��Ͽ� EMP_SECOND��� ���̺��� �����Ͻÿ�.
CREATE TABLE EMP_SECOND
AS
SELECT ENO, ENAME, HIREDATE, SALARY
FROM EMPLOYEE;
SELECT * FROM EMP_SECOND;

-- Question 6. �μ����̺��� ������ �����Ͽ� DEPT_THIRD��� �̸��� ���̺��� �����Ͻÿ�.
CREATE TABLE DEPT_THIRD
AS
SELECT *
FROM DEPARTMENT
WHERE 1=0;
SELECT * FROM DEPT_THIRD;

-- ALTER ~: ������ ���̽��� ������ �����ϴ� ��ɾ�
-- ALTER TABLE ~ ADD()
--- Question 7. ����������̺� ��¥������ �����͸� ��� BIRTH��� �̸��� �÷��� �߰��Ͻÿ�.
ALTER TABLE EMPLOYEE ADD(BIRTH DATE);

-- ALTER TABLE ~ MODIFY
--- �����Ϸ��� �÷��� ���� �ִ� ��� => ũ��� ���� �ڷ������� Ŀ�� ���� ����.
-- �����Ϸ��� �÷��� ���� ���� ��� => ũ��� �ڷ����� ������ �� �ִ�.
-- Question 8. ������̺��� ��� �̸��� �����Ͻÿ�.
CREATE TABLE EMP
AS
SELECT *
FROM EMPLOYEE;

ALTER TABLE EMP MODIFY ENAME VARCHAR2(10);
DESC EMP

-- ALTER TABLE ~ DROP COLUMN �÷���: Ư�� �÷��� �����ϴ� ��ɾ�
ALTER TABLE EMPLOYEE DROP COLUMN BIRTH;

-- TEST�� SAMPLE�� �����Ͻÿ�.
RENAME TEST TO SAMPLE;
SELECT * FROM TAB;

-- DROP TABLE ���̺��;
DROP TABLE DEPT01;

-- DML: ������ ���۾�
-- ���� ������ ���̽��� ���̺��� �̿��Ͽ� ���ڵ� ������ �۾��� �����ϴ� ��ɾ�
-- CRUD: SELECT, INSERT, UPDATE, DELETE
-- SELECT ~ FROM, INSERT INTO ~ VALUES, UPDATE ~ SET, DELETE ~ FROM
-- 1. SELECT: �˻�, ����
-- �⺻��: SELECT �÷��� FROM ���̺��
-- Ȯ����: WHERE���ǽ�, ORDER BY(ASC, DESC), GROUP BY, HAVING

-- 2. INSERT: �߰�
-- �⺻��: INSERT INTO ���̺��(�÷���) VALUES(��);
-- Question 9. ������ �μ����̺��� �����͸� �����ϰ� ������ �����ؼ� DEPT_COPY ���̺��� �����Ͻÿ�.
CREATE TABLE DEPT_COPY
AS
SELECT *
FROM DEPARTMENT
WHERE 1 = 0;

DESC DEPT_COPY
SELECT * FROM DEPT_COPY;

-- ���ڵ� �����ϴ� ��� 1
INSERT INTO DEPT_COPY(DNO, DNAME, LOC) VALUES(11 ,'���ߺ�' , '�����');

-- ���ڵ� �����ϴ� ��� 2: �ش� ���̺� �����ϴ� ��� �÷��� ���� �߰��� ��� �÷����� ���������ϴ�.
INSERT INTO DEPT_COPY VALUES(22, 'ȫ����', '�λ��');

-- ���ڵ� �����ϴ� ��� 3:  Ư�� �÷����� ���� �߰��ϴ� ���
INSERT INTO DEPT_COPY(DNO, LOC) VALUES(33, '������');

-- ���ڵ� �����ϴ� ��� 4:  VALUES ��ſ� ���� ������ ����Ͽ� �ٸ� ���̺� �ִ� ���ڵ带 ������ �� �ִ�.
-- DEPT_COPY ���̺� ����
DROP TABLE DEPT_COPY;
SELECT * FROM TAB;
-- DEPARTMENT ���̺��� ������ �̿��Ͽ� DEPT_COPY ���̺� ����
CREATE TABLE DEPT_COPY
AS
SELECT *
FROM DEPARTMENT
WHERE 1 = 0;

INSERT INTO DEPT_COPY
SELECT *
FROM DEPARTMENT; -- �÷���� �÷� ���� ��ġ�ؾ� �Ѵ�.

-- ���̺��� �÷� ������ ������ �� ����ϴ� ��ɾ�: UPDATE
-- UPDATE ����� WHERE�������� �����Ǹ� ��� ���ڵ� ���� ����ȴ�.
-- Question 10. DEPT_COPY ���̺��� �μ����� ��� HR�� �����Ͻÿ�.
UPDATE DEPT_COPY SET DNAME = 'HR';

-- ���������� �̿��Ͽ� �ٸ� ���̺� ����� �����ͷ� �ش� �÷��� ���� ������ �� �ִ�.
-- Question 11. �μ����̺��� ��� �μ��� �������� �μ���ȣ�� 20���� �ش��ϴ� �μ��� �������� �����Ͻÿ�.
UPDATE DEPT_COPY SET LOC = (SELECT LOC FROM DEPT_COPY WHERE DNO = 20);

-- DEPT_COPY ���̺��� �μ����� 'AAA'�� �����ϰ� �μ���ȣ�� 33���� �����Ͻÿ�.
UPDATE DEPT_COPY SET DNAME = 'AAA', DNO = 33;

-- DELETE ~ FROM: ���̺� ���ڵ带 �����ϴ� ��ɾ�'
DELETE FROM DEPT_COPY;

-- DEPARTMENT ���̺��� ���ڵ带 DEPT_COPY ���̺� �߰��Ͻÿ�.
INSERT INTO DEPT_COPY SELECT * FROM DEPARTMENT;

DELETE FROM DEPT_COPY WHERE DNAME = 'SALES';

-- ���������� �̿��Ͽ� ���ڵ� �����ϱ�
-- ����������̺��� ������ ������ �����Ͽ� EMP��� �̸��� ���̺��� �����Ѵ�.
DROP TABLE EMP;
CREATE TABLE EMP AS SELECT * FROM EMPLOYEE;

-- Question 12.�μ����� SALES�� �ش��ϴ� ����� ������ EMP���̺��� �����ϴ� �۾��� �����Ͻÿ�.
-- STEP 1. �μ������� ������ �ִ� ���̺��� SALES��� �μ��� �ش��ϴ� �μ���ȣ�� �����Ѵ�.
SELECT DNO FROM DEPARTMENT WHERE DNAME = 'SALES';
-- STEP 2. ������ ã�� �μ���ȣ�� 30���� �ش��ϴ� ����� ������ �����ϴ� �۾��� �����Ѵ�.
DELETE FROM EMP WHERE DNO = 30;

DELETE FROM EMP WHERE DNO = (SELECT DNO FROM DEPARTMENT WHERE DNAME = 'SALES');

