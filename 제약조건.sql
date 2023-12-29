-- ������ ���Ἲ ��������: ��ȿ�� �˻�
-- ���̺� �������� �������� �Է��� �����ϱ� ���� ���̺��� ������ �� ����ϴ� ���� ��Ģ��
-- 1. NOT NULL: �����Ұ��� ,NULL - ��������(�⺻��)
-- 2. UNIQUE: �ߺ��Ұ���, ���ϼ�, �ߺ����� ������� �ʴ´�.
-- 3. PRIMARY KEY: �⺻Ű(NOT NULL + UNIQUE)
-- 4. FOREIGN KEY: �ܷ�Ű(�ٸ� ���̺��� �����ҋ�)
-- 5. CHECK: ��ȿ���˻��Ģ, �Է°��� ������ �ο��ϴ� ��

DROP TABLE DEPT;
CREATE TABLE DEPT (DNO NUMBER(2), DNAME VARCHAR2(14), LOC VARCHAR2(13));

SELECT *FROM DEPT;

INSERT INTO DEPT VALUES(11, 'AAA', '�����');
INSERT INTO DEPT(DNAME, LOC) VALUES('BBB', '������');
INSERT INTO DEPT(DNO, LOC) VALUES(33, '�λ��');

-- NOT NULL �����Ģ
DROP TABLE DEPT;
CREATE TABLE DEPT (DNO NUMBER(2) NOT NULL,  
                                             DNAME VARCHAR2(14), LOC VARCHAR2(13));

SELECT *FROM DEPT;

INSERT INTO DEPT VALUES(11, 'AAA', '�����');
INSERT INTO DEPT(DNAME, LOC) VALUES('BBB', '������'); --ERROR, DNO�� �����Ǿ������Ƿ�
INSERT INTO DEPT(DNO, LOC) VALUES(11, '�λ��'); -- ������ DNO ����

-- UNIQUE:  ���ϼ��� �����Ǿ�� �Ѵ�. �ߺ����� ������� �ʴ´�.
DROP TABLE DEPT;
CREATE TABLE DEPT (DNO NUMBER(2) UNIQUE, 
                                             DNAME VARCHAR2(14), LOC VARCHAR2(13));

SELECT *FROM DEPT;

INSERT INTO DEPT VALUES(11, 'AAA', '�����');
INSERT INTO DEPT(DNAME, LOC) VALUES('BBB', '������');
INSERT INTO DEPT(DNO, LOC) VALUES(11, '�λ��'); -- ERROR, DNO�� ���ϼ��� �����߱� ����

-- NOT NULL�� UNIQUE ���������� ���ÿ� ��´ٸ� => �⺻Ű(PRIMARY KEY)
-- �⺻Ű�� ���ڵ带 �ĺ��� �뵵�� ����ϴ� Ű�� �ߺ��� ������� �ʰ�, ������ �Ұ����ϴ�.
DROP TABLE DEPT;
CREATE TABLE DEPT (DNO NUMBER(2) PRIMARY KEY, 
                                             DNAME VARCHAR2(14), LOC VARCHAR2(13));

SELECT *FROM DEPT;

INSERT INTO DEPT VALUES(11, 'AAA', '�����');
INSERT INTO DEPT(DNAME, LOC) VALUES('BBB', '������');
INSERT INTO DEPT(DNO, LOC) VALUES(11, '�λ��'); -- ERROR, DNO�� ���ϼ��� �����߱� ����

-- FOREIGN KEY: �ܷ�Ű, �������Ἲ
-- ���̺� ������ ���踦 �߻���Ű�� ���� ����
-- �θ����̺�(DEPT)�� �����Ͽ� �ڽ����̺�(EMP)�� �����Ѵ�.
-- STEP 1. �������̺��� �θ����̺��� DEPT�� ���̺� �⺻Ű ����(DNO)
-- STEP 2. �θ����̺� ���ڵ带 �����Ѵ�.
-- SETP 3. �ڳ����̺�(EMP)�� �ش� �÷��� �ܷ�Ű ����, �̶� ������ �̸��� �����ϸ� ������ �߻��Ѵ�.
-- STEP 4. �ڳ����̺� ���ο� ���ڵ带 ������ ��, �θ����̺��� �����ϴ� �÷��� ���� ���� �����ϸ� ���Ἲ �����Ģ�� ��߳���.
DROP TABLE EMP;
DESC EMPLOYEE

CREATE TABLE EMP(
                                          ENO NUMBER(4) PRIMARY KEY,
                                          ENAME VARCHAR(20) NOT NULL,
                                          DNO NUMBER(2)  CONSTRAINT DNO_FK REFERENCES DEPT(DNO) -- �ܷ�Ű ����
);

INSERT INTO EMP VALUES(1111, 'AAA', 10);
INSERT INTO EMP VALUES(2222, 'BBB', 20);
INSERT INTO EMP VALUES(3333, 'CCC', 10);
INSERT INTO EMP VALUES(4444, 'DDD', 30);
INSERT INTO EMP VALUES(5555, 'EEE', 40); -- ������ �߻��Ѵ�.(�θ����̺� �μ���ȣ�� 40�� �������� �ʱ� �����̴�.)
 
SELECT * FROM EMP;

DROP TABLE DEPT;
-- �θ����̺�
CREATE TABLE DEPT(
                                             DNO NUMBER(2) PRIMARY KEY,
                                             DNAME VARCHAR2(20),
                                             LOC VARCHAR2(20)
);

INSERT INTO DEPT VALUES(10, 'ȫ����', '�����');
INSERT INTO DEPT VALUES(20, '������', '�λ��');
INSERT INTO DEPT VALUES(30, '���ߺ�', '������');

SELECT * FROM DEPT;

INSERT INTO EMP VALUES(6666, 'KKK', 40);

-- �μ���ȣ�� 40���� �������� ����
DELETE FROM EMP WHERE DNO = 40;

-- ���̺��� ������ �� �ܷ�Ű �����ϱ�
-- ALTER TABLE EMP
--- ADD CONSTRAINT FK_DNO REFERENCES DEPT(DNO);

-- �ܷ�Ű ��ȸ: USER_CONSTRAINTS, USER_CONS_COLUMNS ��ųʸ��� �̿��ؼ� �ܷ�Ű ��ȸ
SELECT A.CONSTRANIT_NAME, A.TABLE_NAME, B.COLUMN_NAME, A.CONSTRAINT_TYPE, A.R_CONSTRAINT_NAME 
FROM USER_CONSTRAINTS A, USER_CONS_COLUMNS B
WHERE A.CONSTRAINT_NAME = B.CONSTRAINT_NAME;

SELECT uc.constraint_name, uc.table_name, ucc.column_name, uc.constraint_type, uc.r_constraint_name
FROM user_constraints uc, user_cons_columns ucc
WHERE uc.constraint_name = ucc.constraint_name;

-- �ܷ�Ű ����
ALTER TABLE EMPLOYEE DROP CONSTRAINT FK_DNO;

-- CHECK: ��ȿ�� �˻� ��Ģ, Ư�� �÷��� �ԷµǴ� ���� ������ �����ϴ� ���
DROP TABLE EMP01;
CREATE TABLE EMP01(
                                               ENO NUMBER(4) PRIMARY KEY,
                                               ENAME VARCHAR2(20),
                                               SALARY NUMBER(7, 2) CONSTRAINT SAL_C CHECK(SALARY > 1000)
);

INSERT INTO EMP01 VALUES(1111, 'AAA', 890);



