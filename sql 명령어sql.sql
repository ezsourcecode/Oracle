-- ������ ���Ǿ�(DDL, Data Definition Language): �����ͺ��̽��� ������ �����ϰ� �����ϰ� �����ϴ� ��ɾ�
-- 1. CREATE TABLE: ���ο� ���̺��� �����ϴ� ��ɾ�
-- �ڷ���(DATA TYPE): �÷����� �Ӽ�
-- CHAR(SIZE): �������� ���� ������
-- VARCHAR2(SIZE): �������� ���� ������
-- NUMBER: ����, NUMBER(SIZE), NUMBER(SIZE, D) => NUMBER(7, 2)
-- DATE / TIMESTAMP
-- Question 1. ������ ���̺� EMP01�� �����ϰ�, �����ȣ ENO, ����̸� ENAME, ����޿� SAL�� �÷����� ��Ƽ� �����Ͻÿ�.
-- ����� ���� ��Ģ(����): ���̺��, �÷���, ��Ÿ ���α׷� �ȿ��� ����ڰ� ���Ƿ� �����ؼ� ����ϴ� �̸����� �ۼ��ϴ� ��Ģ
-- �ݵ�� ���ڷ� ����, ���ڼ� 1~30����, ������(A~Z, ��ҹ���), ����(0~9), Ư������('_', '$', '#')�� ���� ����. �ߺ��Ұ���, ������ ������� �ʴ´�.
CREATE TABLE EMP01 (ENO NUMBER(4),
                                                ENAME VARCHAR2(20),
                                                SAL NUMBER);
-- ���̺� ���� Ȯ��
DESC EMP01

-- ������ �����ϴ� ���̺��� Ȱ���Ͽ� ���̺��� ����: AS��
CREATE TABLE EMP02 AS SELECT * FROM EMP01; -- EMP01 ���̺��� ������ ������ �״�� �����Ͽ�  ���ο� ���̺��� �����Ѵٴ� �ǹ�
DESC EMP02

CREATE TABLE EMP AS SELECT * FROM EMPLOYEE;

SELECT * FROM EMP01;
SELECT * FROM EMP02;
SELECT * FROM EMP;

-- ������ ������� ���̺��� ������ �̿��Ͽ� ���ο� ���̺� ����
CREATE TABLE EMP03 AS SELECT * FROM EMPLOYEE WHERE 1 = 0;
DESC EMP03;
SELECT * FROM EMP03;

-- Question 2. �μ���ȣ�� 30���� �ش��ϴ� ������� ������ ������ �ִ� ���̺� EMP30�� �����Ͻÿ�.
CREATE TABLE EMP30 AS SELECT * FROM EMPLOYEE WHERE DNO = 30;
SELECT * FROM EMP30;

-- ���� ���ӵ� ������ �����ϴ� ���̺� ��� ����
SELECT * FROM TAB;

-- 2. ALTER TABLE: ���� ���̺��� ������ �����ϴ� ��ɾ�
-- ���̺��� ���� ������ �÷��� �߰�, ����, ������ ����Ѵ�.
-- 1) ALTER TABLE ~ ADD: ���� ���̺� ���ο� �÷��� �߰��ϴ� ��ɾ�
SELECT * FROM EMP01;
DESC EMP01;
ALTER TABLE EMP01 ADD(JOB VARCHAR2(9));

-- 2) ALTER TABLE  ~ MODIFY: ���� ���̺� �÷��� �����ϴ� ��ɾ�
-- �ش� �÷��� �ڷᰡ ���� ���: ������ Ÿ��(O) �÷��� ũ��(O)
-- �ش� �÷��� �ڷᰡ �ִ� ���: ������ Ÿ��(X) �÷��� ũ��(O) ���� �÷��� ũ�⺸�� �ݵ�� �� Ŀ�� �Ѵ�.
ALTER TABLE EMP01 MODIFY(JOB VARCHAR2(30));


-- 3) ALTER TABLE ~ DROP COLUMN: ���̺� �����ϴ� �÷��� �����ϴ� ��ɾ�
ALTER TABLE EMP01 DROP COLUMN JOB;

-- 3. DROP TABLE: ���� ���̺��� �����ϴ� ��ɾ�. �� �� �����ϸ� ���� �� �츲.
SELECT * FROM TAB;
DROP TABLE EMP01;
DESC EMP01

-- 4. RENAME: ���� ���̺� �̸��� �����ϴ� ��ɾ�
RENAME EMP TO TEST;
SELECT * FROM EMP;
SELECT * FROM TEST;

-- ������ ���۾�(DML): ���̺��� ������ �߰�, ����, ����, �����ϴ� ��ɾ�
-- 1. SELECT ~ FROM: ����, �˻�
-- �μ������� �����ϴ� ���̺� DEPARTMENT ���̺��� ��� ������ �����Ͻÿ�.
SELECT * 
FROM DEPARTMENT;
-- �μ����̺��� ������ �̿��Ͽ� DEPT01�̶�� ���̺��� �����Ͻÿ�.
CREATE TABLE DEPT01 AS SELECT * FROM DEPARTMENT WHERE 0 = 1;
DESC DEPT01
SELECT * FROM DEPT01;

-- 2. INSERT INTO ~ VALUES: �߰�
INSERT INTO DEPT01 (DNO, DNAME, LOC) VALUES(11, '�ѹ���', '��õ��');
INSERT INTO DEPT01 VALUES(22,'�����', '����');
INSERT INTO DEPT01 (DNO, DNAME)VALUES(33, 'ȫ����');
INSERT INTO DEPT01 (DNO, LOC) VALUES(444, '�����');

-- 3. UPDATE ~ SET: ����
-- ���̺� ����� ���ڵ带 �����ϱ� ���� ����ϴ� ��ɾ�
-- ����! WHERE���� ������� ���� ��� ��� ���ڵ��� ���� �����ȴ�.
SELECT * FROM TEST;
-- ��� ����� �μ���ȣ�� 30���� �����Ͻÿ�.
UPDATE TEST SET DNO = 30;

-- ������ �޿��� 10% �λ��ϴ� �������� ����Ͻÿ�.
UPDATE TEST SET SALARY = SALARY * 1.1;

-- ��� ������ �Ի����� ���� ��¥�� �����Ͻÿ�.
UPDATE TEST SET HIREDATE = SYSDATE;

-- ������ SALESMAN�� ������ �μ���ȣ�� 40���� �����Ͻÿ�.
UPDATE TEST SET DNO = 40 WHERE JOB = 'SALESMAN';

-- ������ MANAGER�� ������ �޿��� 10% �λ��ϴ� �������� �����Ͻÿ�.
UPDATE TEST SET SALARY = SALARY *1.1 WHERE JOB = 'MANAGER';

-- SCOTT ����� �μ���ȣ�� 20����, ������ MANAGER��, �޿��� 50, Ŀ�̼��� 4000���� �����ϴ� �������� �����Ͻÿ�.
UPDATE TEST SET DNO = 20, JOB = 'MANAGER', SALARY = 50, COMMISSION = 4000 WHERE ENAME = 'SCOTT';
SELECT * FROM TEST WHERE ENAME = 'SCOTT';

-- Question 3. �μ���ȣ�� 20���� �μ��� �������� 40���� �������� �����ϴ� ������ �ۼ��ϵ� ���������� �̿��Ͻÿ�.
-- ��, DEPARTMENT ���̺��� ������ ������ �̿��Ͽ� DEPT02 ���̺��� �����Ͽ� �۾��� ��
CREATE TABLE DEPT02 AS SELECT * FROM DEPARTMENT; 
SELECT * FROM DEPT02;
UPDATE DEPT02 SET LOC = (SELECT LOC FROM DEPT02 WHERE DNO = 40 ) WHERE DNO = 20;

-- 4. DELETE ~FROM: ����
-- ���̺� ����� ���ڵ带 �����ϴ� ��ɾ�
-- WHERE �������� ������ ��� ���ڵ尡 �����ȴ�.
DELETE FROM DEPT02;

