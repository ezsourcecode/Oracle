-- ������ ���Ἲ ���� ����
-- 1. NOT NULL: NULL�� ������� �ʴ� ���� ����, �����Ұ�, �ʼ��Է�
-- Question 1. DEPARTEMENT���̺��� ������ ������ �����Ͽ� DEPT���̺��� �����Ͻÿ�.
DROP TABLE DEPT CASCADE CONSTRAINTS;
CREATE TABLE DEPT AS SELECT * FROM DEPARTMENT; --������ ������ ��� WHERE ���ǽĿ� �׻� ������ �Ǵ� ������ ����Ѵ�. 1=0 OR 0=1
SELECT * FROM DEPT;
DESC DEPT

INSERT INTO DEPT(DNO, DNAME, LOC) VALUES(50, '���ߺ�', '�����');
INSERT INTO DEPT(DNO, DNAME, LOC) VALUES(50, '������', '������');
INSERT INTO DEPT(DNO, DNAME) VALUES(50, 'DB');

DROP TABLE DEPT;
CREATE TABLE DEPT(
                                             DNO NUMBER(2) NOT NULL,
                                             DNAME VARCHAR2(14) NOT NULL,
                                             LOC VARCHAR2(13) NOT NULL
);

INSERT INTO DEPT(DNO, DNAME, LOC) VALUES(10, '���ߺ�', '����');
INSERT INTO DEPT VALUES(20, 'ȫ����', '����');
INSERT INTO DEPT(DNO, DNAME) VALUES(30, '������');
INSERT INTO DEPT(DNO, DNAME, LOC) VALUES(20, '������', '�λ�');

-- 2. UNIQUE: �ߺ����� ������� �ʴ� ���� ����, ���ϼ�
DROP TABLE EMP;
CREATE TABLE EMP(
                                          ENO NUMBER(4) UNIQUE,
                                          ENAME VARCHAR2(14) NOT NULL,
                                          JOB VARCHAR2(14),
                                          SALARY NUMBER(7)
);
DESC EMP
SELECT * FROM EMP;

INSERT INTO EMP VALUES(1111, '�庸��', '����', 1000);
INSERT INTO EMP(ENAME, JOB, SALARY) VALUES('�̼���', '����', 800);
INSERT INTO EMP(ENAME, JOB, SALARY) VALUES('�̼���', '����', 800);

-- 3. PRIMARY KEY: NULL�� ������� �ʰ�, �ߺ����� ������� �ʴ� ���� ����, NOT NULL + UNIQUE, �⺻Ű
DROP TABLE EMP;
CREATE TABLE EMP(
                                          ENO NUMBER(4) PRIMARY KEY,
                                          ENAME VARCHAR2(14) NOT NULL,
                                          JOB VARCHAR2(14),
                                          SALARY NUMBER(7)
);

CREATE TABLE EMP(
                                          ENO NUMBER(4),
                                          ENAME VARCHAR2(14) NOT NULL,
                                          JOB VARCHAR2(14),
                                          SALARY NUMBER(7),
                                          CONSTRAINT ENO_PK PRIMARY KEY(ENO) -- �ܷ�Ű�� �̷��� �����.
);

DESC EMP
SELECT * FROM EMP;

INSERT INTO EMP VALUES(1111, '�庸��', '����', 1000);
INSERT INTO EMP VALUES(2222, '�̼���', '����', 800);
INSERT INTO EMP(ENAME, JOB, SALARY) VALUES('�̼���', '����', 800);
INSERT INTO EMP(ENO, ENAME) VALUES(3333, 'ȫ�浿');

-- 4. FOREIGN KEY: �����Ǵ� ���̺��� �÷��� �����ϴ� ���� �Է��� ���ǵ��� �ϴ� ���� ����, ���� ���Ἲ, �ܷ�Ű
--���� ���Ἲ: ���̺� ������ ���迡�� �߻��ϴ� �������� �� ���̺��� �θ����̺�(��ü�� �Ǵ� ���̺�)�� �ڳ����̺�(������ �Ǵ� ���̺�)�� ���� ����
-- �μ����̺�(DEPARTMENT): DNO(�⺻Ű) => �θ����̺�, �θ�
-- ������̺�(EMPLOYEE): ENO(�⺻Ű), DNO(�ܷ�Ű) => �ڽ����̺�
DROP TABLE DEPT;
DROP TABLE EMP;
CREATE TABLE DEPT(
                                             DNO NUMBER(2) PRIMARY KEY,
                                             DNAME VARCHAR2(14),
                                             LOC VARCHAR2(13)
);

INSERT INTO DEPT VALUES(10, '���ߺ�', '����');
INSERT INTO DEPT VALUES(20, 'ȫ����', '����');
INSERT INTO DEPT VALUES(30, '�����', '�뱸');
INSERT INTO DEPT VALUES(40, 'ȸ���', '�λ�');

SELECT * FROM DEPT;

CREATE TABLE EMP(
                                           ENO NUMBER(4) PRIMARY KEY,
                                           ENAME VARCHAR2(14) NOT NULL,
                                           JOB VARCHAR2(20),
                                           SALARY NUMBER,
                                           DNO NUMBER(2) CONSTRAINT EMP_DNO_FK REFERENCES DEPT(DNO)
);

INSERT INTO EMP VALUES(1111, '�庸��', '����', 1000, 10);
INSERT INTO EMP VALUES(2222, '�庸��', '����', 800, 30);
INSERT INTO EMP VALUES(3333, '�̼���', '�븮', 600, 50);

-- 5. CHECK: ��ȿ�� �˻� ��Ģ, �Է°��� ������ ������ �ο��ϴ� ���� ����
DROP TABLE SAMPLE;
CREATE TABLE SAMPLE(
                                                  NAME VARCHAR2(20),
                                                  AGE NUMBER CONSTRAINT CHECK_AGE CHECK(AGE > 0 AND AGE < 150),
                                                  GENDER CHAR(1) CONSTRAINT CHECK_GENDER CHECK(GENDER IN('M' ,'W')), -- �������ǿ� OR ����.
                                                  ID NUMBER PRIMARY KEY
);

INSERT INTO SAMPLE VALUES('ȫ�浿', 30, 'M', 1);
INSERT INTO SAMPLE VALUES('�庸��', 25, 'M', 2);
INSERT INTO SAMPLE VALUES('������', -100, 'W', 3);
INSERT INTO SAMPLE VALUES('������', 20, 'F', 3);
