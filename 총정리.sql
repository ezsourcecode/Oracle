-- 1. ������ Ÿ��: ����Ŭ���� �����ϴ� �ڷ���
-- CHAR(SIZE): SIZE�� ũ��� �������� ���� ������, �Էµ� �ڷ��� ���̿� ������� ������ ���̸�ŭ ���� ������ �����Ѵ�.
-- VARCHAR2(SIZE): �������� ���� ������
-- NUMBER(P, S): ����(P), �Ҽ��� ����(�Ǽ�, S)
-- DATE: ��¥ ������ ������, TIMESTAMP(DATE�� Ȯ��� ����)

-- 2. ����Ŭ �����ͺ��̽��� ����
-- SQL*PLUS�� SQL ��ɾ�(DDL, DML, DCL)
-- ����� ����: ������(SYSTEM, SYS), �Ϲ� ����� ����(SCOTT)
-- ����Ŭ ����: SQLPLUS ����ID / ����PW
-- ���� ���� Ȯ��: SHOW USER
SHOW USER
-- ���� ���: CONNECT(=CONN)
CONN SYSTEM/1234

-- ���̺� ����: DECS ���̺��
DESC EMPLOYEE

-- ���̺� ��ȸ/�˻�: SELECT
-- SELECT [DISTINCT] �÷��� [* = ALL] [AS = ALIAS]
-- FROM ���̺��
-- [WHERE ���ǽ�]
-- [ORDER BY �÷��� [ASC/DESC]]
--- [GROUP BY �÷���]
-- [HAVING �׷� ���ǽ�]

-- ����: �����, �����(��/�Ǵ�), ����
-- �����(+, -, *, /): ���� OR ��¥ �����͸� ��� ����
-- Question 1. �������̺�(EMPLOYEE) �÷��� SALARY�� �޿��� ���Ѵ�. �� ������ ������ ����Ͽ� �����ȣ, �̸�, �޿�, ������ ����ǵ��� �������� ����Ͻÿ�.
SELECT ENO, ENAME, SALARY, SALARY*12  "����"
FROM EMPLOYEE;

-- ������ �޿��� ���ʽ��� �̿��Ͽ� ����� ��
-- NVL(COMMISSION, 0): Ŀ�̼� ���� NULL�� ������ 0���� ġȯ
SELECT ENO, ENAME, SALARY, SALARY*12 + NVL(COMMISSION, 0)  "����" -- ������� NULL�� ������ �ʴ´�.
FROM EMPLOYEE;

-- �񱳿�����(���迬����): =(����), !=, <>, ^=(���� �ʴ�), >, >=, <, <=
-- Q1. �޿��� 1500�̻��� ����� ���� ����
SELECT *
FROM EMPLOYEE
WHERE SALARY >= 1500;
-- Q2. �μ���ȣ�� 10�� ����� ���� ����
SELECT *
FROM EMPLOYEE
WHERE DNO = 10;
-- Q3. SCOTT ����� ���� ����
SELECT *
FROM EMPLOYEE
WHERE ENAME = 'SCOTT';
-- Q4. 1981�� ���� �Ի��� ������ ���� ����
SELECT *
FROM EMPLOYEE
WHERE HIREDATE < '1981-01-01';

-- ��������: �ϳ� �̻��� ������ �����Ͽ� ����� ��
-- AND: ��� ������ �� ���̾�� ���� �ȴ�. ���, ~ �̰�
--OR: ���� �� �ϳ��� ���̸� ����� ���� �ȴ�. �̰ų�, �Ǵ�, ����� �ϳ���
-- NOT: ���׿�����
-- Q1. �μ���ȣ�� 10�̰�, ������ 'MANAGER'�� ����� ���� ����
SELECT *
FROM EMPLOYEE
WHERE DNO = 10 AND JOB = 'MANAGER';
-- Q2. �μ���ȣ�� 10�̰ų� ������ 'MANAGER'�� ����� ���� ����
SELECT *
FROM EMPLOYEE
WHERE DNO = 10 OR JOB = 'MANAGER';
-- Q3. �μ���ȣ�� 10�� �ƴ� ����� ���� ����
SELECT *
FROM EMPLOYEE
WHERE DNO != 10;
-- Q4. �޿��� 1000 ~ 1500 ������ ����� ���� ����
SELECT *
FROM EMPLOYEE
WHERE SALARY BETWEEN 1000 AND 1500;
-- Q5. �޿��� 1000 �̸��̰ų� 1500 �ʰ��� ����� ���� ����
SELECT *
FROM EMPLOYEE
WHERE SALARY NOT BETWEEN 1000 AND 1500;
-- Q6. Ŀ�̼��� 300�̰ų� 500�̰ų� 1400�� ����� ���� ����
SELECT *
FROM EMPLOYEE
WHERE COMMISSION IN(300, 500, 1400);

-- LIKE ������: ���ϵ�ī�� ����(��ü����, ���ɹ���) _, %
-- Q1. ����� �̸��� 'F'�� �����ϴ� ����� ���� ����
SELECT *
FROM EMPLOYEE
WHERE ENAME LIKE 'F%';

SELECT *
FROM EMPLOYEE
WHERE  SUBSTR(ENAME, 1, 1) = 'F';

SELECT *
FROM EMPLOYEE
WHERE INSTR(ENAME, 'F') = 1 ;
-- Q2. �̸��� 'M'�� ���Ե� ����� ���� ����
SELECT *
FROM EMPLOYEE
WHERE ENAME LIKE'%M%' ;

SELECT *
FROM EMPLOYEE
WHERE INSTR(ENAME, 'M') ! = 0 ; -- ^=, <> ����. ��Ģ���� ���
-- Q3. �̸��� 'N'���� ������ ����� ���� ����
SELECT *
FROM EMPLOYEE
WHERE ENAME LIKE '%N';

SELECT *
FROM EMPLOYEE
WHERE  SUBSTR(ENAME, -1, 1) = 'N';
-- Q4. �̸��� �� ��° ���ڰ� 'A'�� ����� ���� ����
SELECT *
FROM EMPLOYEE
WHERE ENAME LIKE '_A%';

SELECT *
FROM EMPLOYEE
WHERE  SUBSTR(ENAME, 2, 1) = 'A';
-- Q5. �̸��� �� ��° ���ڰ� 'A'�� ����� ���� ����
SELECT *
FROM EMPLOYEE
WHERE ENAME LIKE '__A%';

SELECT *
FROM EMPLOYEE
WHERE  SUBSTR(ENAME, 3, 1) = 'A';
-- Q6. �̸��� 'A'�� �������� �ʴ� ����� ���� ����
SELECT *
FROM EMPLOYEE
WHERE ENAME NOT LIKE '%A%';

-- IS NULL / IS NOT NULL
SELECT ENAME, COMMISSION
FROM EMPLOYEE;
-- ���ʽ��� �޴� ������ ������ ����
SELECT ENAME, COMMISSION
FROM EMPLOYEE
WHERE COMMISSION IS NOT NULL;

--ORDER BY: �־��� �÷��� �������� ��������(ASC)/ ��������(DESC) �����Ͽ� ������ ��
-- Q1. ������ �޿��� �������� �������� �����Ͽ� �����Ͻÿ�.
SELECT *
FROM EMPLOYEE
ORDER BY SALARY ;
-- Q2. ������ �μ���ȣ�� �������� ��������, ���� ������� �޿��� �������� ���������Ͽ� �����Ͽ� �����Ͻÿ�.
SELECT *
FROM EMPLOYEE
ORDER BY DNO, SALARY DESC ;
-- Q3. ���� �ֱٿ� �Ի��� ���������� �����Ͻÿ�.
SELECT *
FROM EMPLOYEE
ORDER BY HIREDATE DESC;

-- ���� �Լ� -����(�ѱ���), ���ڿ�(STRING, �ܾ�) => a(97), A(65)
-- UPPER(���ڵ�����), LOWER(���ڵ�����), INITCAP(���ڵ�����)
-- LENGTH(���ڵ�����), LENGHB(���ڵ�����)
-- CONCAT = ||
-- SUBSTR(���ڵ�����, ������ġ, ���ڼ�), SUBSTRB
-- INSTR(���ڵ�����, ����)
-- LPAD(LEFT FADDING): ���ʿ� ���� ������ ũ�⸸ŭ Ư�� ���ڷ� ä��� �Լ�
-- RPAD(RIGHT PADDING): �����ʿ� ���� ������ ũ�⸸ŭ Ư�� ���ڷ� ä��� �Լ�

SELECT * FROM EMPLOYEE;
SELECT LPAD(SALARY,10, ' ')
FROM EMPLOYEE;

-- TRIM: ������ �����ϴ� �Լ�
-- LTRIM(���ڵ�����): ���� ���� ����
-- RTRIM(���ڵ�����):
SELECT TRIM('   ORACLE') FROM DUAL;

-- �׷��Լ�: �ϳ� �̻��� ���� ��� ������ �����ϴ� �Լ�, �ϳ��� ����� �����Ѵ�.
-- SUM(�÷���): �ش� �÷� ������ ������ ���ϴ� �Լ�
-- AVG(�÷���): 
-- MAX(�÷���)/MIN(�÷���)
-- COUNT(�÷���): �ش� �÷��� NULL ���� �ƴ� ���� ���� ��ȯ, COUNT(*): �ش� ���̺��� ���ڵ� ���� ��ȯ
SELECT COUNT(*)
FROM EMPLOYEE;
SELECT COUNT(COMMISSION)
FROM EMPLOYEE;

-- GROUP BY�� : Ư�� �÷��� �������� �׷�ȭ�ϴ� ��

-- ������̺��� �����޿��� ������ �����Ͻÿ�.
SELECT SUM(SALARY)
FROM EMPLOYEE;

-- �μ��� �޿��� ������ �����ϵ�, �μ���ȣ�� �޿��� ������ ǥ�õǵ��� �Ͻÿ�.
SELECT DNO, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DNO;

-- �ҼӺμ��� ��� �޿��� �����Ͻÿ�.
SELECT DNO, ROUND(AVG(SALARY), 2)
FROM EMPLOYEE
GROUP BY DNO;

-- �μ��� ��� ���� Ŀ�̼��� �޴� ����� ���� ����ǵ��� �������� �ۼ��Ͻÿ�.
-- �μ���ȣ/ �μ��� ��� �� /Ŀ�̼� �޴� ��
SELECT DNO, COUNT(*), COUNT(COMMISSION)
FROM EMPLOYEE
GROUP BY DNO;

-- ����(JOB)�� ������ ������ �����Ͻÿ�.
SELECT JOB, COUNT(JOB)
FROM EMPLOYEE
GROUP BY JOB;

SELECT COUNT(DISTINCT JOB) FROM EMPLOYEE;
SELECT DISTINCT JOB FROM EMPLOYEE;

-- HAVING��: GROUP BY���� ���� ������ ������� ������� ���ϴ� ���ǿ� �����ϴ� �ڷḸ ������ ��
-- Q1. �μ��� ��� �޿��� 2000�̻��� �μ��� ��ȣ�� �μ��� ��� �޿��� �����Ͻÿ�.
SELECT  DNO, ROUND(AVG(SALARY), 2)
FROM EMPLOYEE
GROUP BY DNO
HAVING AVG(SALARY) >= 2000;

SELECT  E.DNO, DNAME, ROUND(AVG(SALARY), 2)
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DNO = D.DNO
GROUP BY E.DNO, DNAME
HAVING AVG(SALARY) >= 2000;


-- Q2. �μ��� �ִ�޿��� �ּұ޿��� �����ϵ�, �ִ�޿��� 2900�̻��� �μ��� �����Ͻÿ�.
SELECT DNO, MAX(SALARY), MIN(SALARY)
FROM EMPLOYEE
GROUP BY DNO
HAVING MAX(SALARY) >= 2900;

-- ���߱׷� - �Ұ�
SELECT DNO, JOB, COUNT(*), SUM(SALARY)
FROM EMPLOYEE
GROUP BY DNO, JOB
ORDER BY DNO, JOB;

-- ����(JOIN): ���� ���̺��� �����Ͽ� ����ڰ� ���ϴ� ������ �����ϵ��� �����ִ� ���
-- ī��þ� ��, EQUI(�����), NON-EQUI(������), SEL, OUTER
-- �ǹ������� ��������(EQUI JOIN - LEFT INNER JOIN, RIGHT INNER JOIN)�� �ܺ�����(OUTER JOIN)
-- INNER JOIN: ���� ����, Ư�� �÷��� �������� ��Ȯ�ϰ� ��ġ�ϴ� ��鸸 �����ϴ� JOIN(������)

-- �������� = EQUI JOIN
SELECT *
FROM EMPLOYEE E INNER JOIN DEPARTMENT D
ON E.DNO = D.DNO;

-- �ܺ����� = OUTER JOIN, ��ġ���� �ʴ� ���� ����
-- LEFT OUTER JOIN
-- LEFT OUTER JOIN-(LEFT ONLY)
-- RIGHT OUTER JOIN
-- RIGHT OUTER JOIN-(RIGHT ONLY)

CREATE TABLE FOOD_A(
                                                  ID NUMBER(1) PRIMARY KEY,
                                                  FNAME VARCHAR2(20) NOT NULL
);

CREATE TABLE FOOD_B(
                                                  ID NUMBER(1) PRIMARY KEY,
                                                  FNAME VARCHAR(20) NOT NULL
);

INSERT INTO FOOD_A VALUES(1, '���');
INSERT INTO FOOD_A VALUES(2, '����');
INSERT INTO FOOD_A VALUES(3, '�ʹ�');
INSERT INTO FOOD_A VALUES(4, '��â����');

INSERT INTO FOOD_B VALUES(1, '�ʹ�');
INSERT INTO FOOD_B VALUES(2, '���');
INSERT INTO FOOD_B VALUES(3, 'Į����');
INSERT INTO FOOD_B VALUES(4, '�ܹ���');

SELECT * FROM FOOD_A;
SELECT * FROM FOOD_B;

-- INNER JOIN: JOIN�ϴ� �� ���̺� ��Ȯ�ϰ� ��ġ�ϴ� ���� ����
SELECT *
FROM FOOD_A, FOOD_B
WHERE FOOD_A.FNAME  = FOOD_B.FNAME;

SELECT *
FROM FOOD_A A INNER JOIN  FOOD_B B
ON A.FNAME = B.FNAME;

-- OUTER JOIN: LEFT OUTER JOIN, A LEFT OUTER JOIN B, A�� ��� ����ǰ�, B�� A�� �����ϴ�(���εǴ�) �� ����
SELECT *
FROM FOOD_A A LEFT OUTER JOIN  FOOD_B B
ON A.FNAME = B.FNAME;

-- LEFT OUTER JOIN -: LEFT ONLY, A LEFT OUTER JOIN B ~ WHERE B.ID IS NULL
-- A ��ü�� �����ϵ�, B�� ��ġ�ϴ� ���� �ִٸ� �װ��� �����ϰ� ����
SELECT *
FROM FOOD_A A LEFT OUTER JOIN  FOOD_B B 
ON A.FNAME = B.FNAME
WHERE B.ID IS NULL;

-- RIGHT OUTER JOIN - : RIGHT ONLY
SELECT * 
FROM FOOD_A A RIGHT OUTER JOIN FOOD_B B
ON A.FNAME = B.FNAME
WHERE A.ID IS NULL;

-- Q1. EQUI JOIN�� �̿��Ͽ� SCOTT ����� �μ���ȣ�� �μ����� �����Ͻÿ�.
SELECT ENAME, E.DNO, DNAME
FROM EMPLOYEE E , DEPARTMENT D
WHERE E.DNO = D.DNO AND ENAME = 'SCOTT';

SELECT E.DNO, DAME
FROM EMPLOYEE E INNER JOIN DEPARTMENT D
ON E.DNO = D.DNO;
-- Q2. INNER JOIN�� ON �����ڸ� ����Ͽ� ����̸��� �ش� ����� �Ҽӵ� �μ��� �׸��� �μ��� �������� �����Ͻÿ�.
SELECT ENAME, DNAME, LOC
FROM EMPLOYEE E INNER JOIN DEPARTMENT D
ON E.DNO = D.DNO;

SELECT ENAME, DNAME, LOC
FROM EMPLOYEE E INNER JOIN DEPARTMENT D
USING(DNO);
-- Q3. INNER JOIN�� USING �����ڸ� ����Ͽ� �μ���ȣ�� 10���� �ش��ϴ� ����� �������� �μ��� �������� �����Ͻÿ�.
SELECT DNO, JOB, LOC
FROM EMPLOYEE INNER JOIN DEPARTMENT
USING(DNO)
WHERE DNO = 10;

SELECT E.DNO, JOB, LOC
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DNO = D.DNO AND E.DNO = 10;

-- Q4. NATURAL JOIN�� ����Ͽ� COMMISION�� �޴� ����̸�, �μ���, �������� �����Ͻÿ�.
/* NATURAL JOIN�� �⺻���� ���� �÷����� �˾Ƽ� EQUI�� ���ν�Ŵ. �׷��� ������ �÷��� �������� ������*/
SELECT ENAME, DNAME, LOC
FROM EMPLOYEE E, DEPARTMENT D��
WHERE E.DNO  = D.DNO AND COMMISSION > 0;

SELECT ENAME, DNAME, LOC
FROM EMPLOYEE NATURAL JOIN DEPARTMENT
WHERE COMMISSION > 0;
