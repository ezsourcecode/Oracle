-- �ּ�(comment): ���α׷� ����� ������� �ڵ��� ������ ��� ���� ����ϴ� ����(��ȣ --, #, /*~*/, //)
-- sql query: DB ǥ���� ��ɾ�, ���� �ٿ� ��ɾ �Է��� �� �ֱ� ������ ��ɾ� ����(������) �����ݷ�(;)�� ���δ�.
-- sql * plus ��ɾ�: oracle������ ��� ������ ��ɾ�, �� �� ���

-- ���� ������ ����� ������ Ȯ���ϴ� ��ɾ�
SHOW USER

-- SCOTT������ ���� �ִ� ���̺��� ���(TAB: TABLE)�� �����ϴ� ���
SELECT * FROM TAB;

-- CRUD ��ɾ�: DML ���� ��ɾ ���Ѵ�.
-- DDL: ���Ǿ�(CREATE ����, ALTER ����, DROP ����)
-- DML: ���۾�(SELECT ����/�˻�, INSERT �߰�, UPDATE ����, DELETE ����)
-- DCL: �����( COMMIT ��������/�ݿ�, ROLLBACK ����, GRANT ���Ѻο�, REVOKE ��������)
--Ʈ������(TRANSACTION): �����ͺ��̽��� ���� ����Ǵ� ��ɾ��� �������, �ϳ��� ����� ����Ǵ� ����

-- SELECT ��ɾ�: ���̺� ����� ���ڵ� ������ �۾��� �����ϴ� ��ɾ�, ����(�˻�)
-- 1. �⺻��: SELECT �ʵ�� FROM ���̺��
-- Question 1. ���������� ��� �ִ� employee ���̺� ��ε� ��� ����� ������ �����Ͻÿ�. (* = all)
-- ���̺��� ������ Ȯ���ϴ� ����
DESC EMPLOYEE

SELECT * 
FROM EMPLOYEE;

-- Question 2. ��������(employee) ���̺��� ������ ��ȣ, �̸�, ������ �����Ͻÿ�.
SELECT ENO, ENAME, JOB 
FROM EMPLOYEE;

-- Question 3. ����(job)�� ���(clerk)�� �ش��ϴ� ����� ������ �����Ͻÿ�.
SELECT * 
FROM EMPLOYEE
WHERE JOB = 'CLERK'; // �ǵ��� ���ڵ�� ���� ��ҹ��� ������� ����

-- 2. Ȯ����: WHERE�� - �־��� ������ ���� �͸� ������ �� ����ϴ� ��
-- ���ǽ�(OR ������ OR ��/�Ǵܹ�): �ݵ�� �� ����� �� OR �������� ������ �Ǵ� ����
-- ������(OPERATION): �� ������ ���̿� ������ �����ϱ� ���� ����ϴ� ��ȣ��
-- ��� ������: ��Ģ������ �����ϴ� �����ȣ(+, -, *, /)
-- Question 4. ������ ������ ��� �ִ� ���̺� employee�� �̿��Ͽ� ���� ������ �̸��� �޿��� 10�� �λ�� �޿��� �����Ͻÿ�.
SELECT ENAME, SALARY, SALARY + 10
FROM EMPLOYEE;

-- ��Ī(NICKNAME): AS��
SELECT ENAME, SALARY, SALARY + 10 AS "�λ�� �޿�" --���ڿ� ���� ��� AS �� �ᵵ �ǳ� ��
FROM EMPLOYEE;

-- Question 5. ���� ������ ��� �ִ� ���̺� ������ "ANALYST"�� �ش��ϴ� ������ �޿��� 500�� �λ��Ͽ� �����Ͻÿ�.
SELECT ENAME, JOB, SALARY, SALARY + 500 AS "�λ�� �޿�"
FROM EMPLOYEE
WHERE JOB = 'ANALYST';

-- Question 6. �������̺��� ������ ���ʽ��� ��ģ �ݾ��� �����ϵ�, �ش� Į������ �ѱ޿��� ǥ���Ͻÿ�.
SELECT ENAME, SALARY, COMMISSION, SALARY + COMMISSION "�ѱ޿�"
FROM EMPLOYEE;
-- NULL: ����ִٴ� �ǹ̷� 0�� �ƴϴ�.
-- NULL�� �ٸ� ������ ��ȭ�ϴ� �Լ�: NVL�Լ�, NVL(������, ��ü ��)
SELECT ENAME, SALARY, COMMISSION, SALARY +NVL(COMMISSION, 0) "�ѱ޿�"
FROM EMPLOYEE;

-- ���� ������ OR �� ������
-- �� ���� ��Ұ��踦 ���ϴ� ������: =(����), !=, <>, ^=(���� �ʴ�), >, >=, <, <=
-- �־��� ���ǿ� ���� �͸� �����϶�� �ǹ̸� ������.
-- Question 7. �μ���ȣ(DNO)�� 20�� ����� ������ �����Ͻÿ�.
SELECT *
FROM EMPLOYEE
WHERE DNO = 20;

-- Question 8. �μ���ȣ�� 20�� �ƴ� ������ ������ �����Ͻÿ�.
SELECT *
FROM EMPLOYEE
WHERE DNO <> 20;

-- Question 9. ����� �̸��� FORD�� ����� ���, �̸�, �޿��� �����Ͻÿ�.
SELECT ENO, ENAME, SALARY
FROM EMPLOYEE
WHERE ENAME = 'FORD';

-- Question 10. �Ի����� 1982�� 1�� 1�� ���Ŀ� �ش��ϴ� ����� ������ �����Ͻÿ�.
-- ����, ��¥�� �ݵ�� Ȧ����ǥ �ȿ� ǥ���ؾ� �Ѵ�.
SELECT *
FROM EMPLOYEE
WHERE HIREDATE >= '1982-01-01';

-- �� ������: ����(��, ����)�� �̿��Ͽ� ������ �����ϴ� ������
-- ���� ���� �� �����ڸ� �����Ͽ� ����� �� �� ����ϴ� ������
-- AND: ���, ��� ���ǿ� �����ϴ� �͸� ����
-- Question 11. �μ���ȣ�� 10�̰�, ������ MANGER�� �ش��ϴ� ������ ������ �����Ͻÿ�.
SELECT *
FROM EMPLOYEE
WHERE DNO = 10 AND JOB = 'MANAGER';

-- OR  : �Ǵ�, Ȥ��, ��� �� �ϳ���, ���� ���� ���� �� �ϳ��� ���̾ ����
-- Question 12. �μ���ȣ�� 10�̰ų� ������ MANGER�� �ش��ϴ� ������ ������ �����Ͻÿ�.
SELECT *
FROM EMPLOYEE
WHERE DNO = 10 OR JOB = 'MANAGER';

-- NOT: ������ ����, ���׿���
-- Question 13 �μ���ȣ�� 10�� �ƴ� ����� ������ �����Ͻÿ�. (3���� ����)
SELECT *
FROM EMPLOYEE
WHERE DNO != 10;

SELECT *
FROM EMPLOYEE
WHERE DNO <> 10;

SELECT *
FROM EMPLOYEE
WHERE DNO ^= 10;

-- �������� ǥ������ �̿��� �� ������
-- BETWEEN ~ AND: �ϳ��� �÷��� �������� ������ �ο��� �� ����ϴ� ������, ����, ����, ��¥���� ��밡���ϴ�.
-- Question 14. �޿��� 2000�̻� 3000���Ͽ� �ش��ϴ� ����� ������ �����Ͻÿ�.
SELECT *
FROM EMPLOYEE
WHERE SALARY BETWEEN 2000 AND 3000;

-- IN: ���Կ��θ� �Ǵ��ϴ� ������ ǥ��
-- Question 15. �޿��� 2000 �̸��̰ų� 3000 �ʰ��� �ش��ϴ� ����� ������ �����Ͻÿ�.
SELECT *
FROM EMPLOYEE
WHERE SALARY NOT BETWEEN 2000 AND 3000;

-- Question 16. 1987�⿡ �Ի��� ����� ������ �����Ͻÿ�.
-- ����, ��¥�� �ݵ�� Ȧ����ǥ �ȿ� ǥ���ؾ� �Ѵ�.
SELECT *
FROM EMPLOYEE
WHERE HIREDATE BETWEEN '1987-01-01' AND '1987-12-31';

-- Question 17. �μ���ȣ�� 10�̰ų� 30, 40�� �ش��ϴ� ����� ������ �����Ͻÿ�.
SELECT *
FROM EMPLOYEE
WHERE DNO ^=20; // �� ���

SELECT *
FROM EMPLOYEE
WHERE DNO=10 OR DNO=30; // ������ ���1

SELECT *
FROM EMPLOYEE
WHERE DNO IN(10, 30, 40); // ������ ���2

-- !�� �ǹ̴� NOT�� ���Ѵ�.
SELECT *
FROM EMPLOYEE
WHERE DNO NOT  IN(10, 30, 40); // 20�� ��µ�

-- ���ɹ���, ���ϵ�ī�� ����(WILD CHARACTER): %, _ => ���α׷��� ������ *��?�� ����Ѵ�.
-- ��ü����
-- '='�� ���ϴ� ��ȣ ��� �ݵ�� LIKE�� ����Ѵ�.
-- %: ���� ���� ������� ��� ���ڸ� ����ϴ� ��ȣ
-- Question 18. ����� �̸��� ù ���ڰ� 'M'�� �����ϴ� ���� ������ �����Ͻÿ�.
SELECT *
FROM EMPLOYEE
WHERE ENAME LIKE 'M%';

-- Question 19. ������ �̸��� ������ ���ڰ� 'N'�� �ش��ϴ� ������ ������ �����Ͻÿ�.
SELECT *
FROM EMPLOYEE
WHERE ENAME LIKE '%N';

-- Question 20. ������ �̸��� 'R'�� ���Ե� ������ ������ �����Ͻÿ�.
SELECT *
FROM EMPLOYEE
WHERE ENAME LIKE '%R%';

-- '_'�� ���� �� ���ڸ� ��ü�ϴ� ���ɹ���
-- Question 21. ���� �̸��� �� ��° ���ڰ� 'A'�� ������ ������ �����Ͻÿ�.
SELECT *
FROM EMPLOYEE
WHERE ENAME LIKE '_A%';

-- Question 22. ������ ù ���ڰ� 'M'�� �ƴ� ������ ������ �����Ͻÿ�.
SELECT *
FROM EMPLOYEE
WHERE ENAME NOT LIKE 'M%';

-- IS NULL / IS NOT NULL 
SELECT COMMISSION FROM EMPLOYEE;
SELECT COMMISSION FROM EMPLOYEE WHERE COMMISSION IS NULL;

SELECT * FROM EMPLOYEE WHERE COMMISSION IS NULL;
SELECT * FROM EMPLOYEE WHERE COMMISSION IS NOT  NULL;

-- 3. Ȯ����: ������ ���� ORDER BY��
-- ����(SORT): �־��� Ű ���� ���� ������� �����ϴ� ��
-- ���� ���: ��������(ASC, ASCENDING ��������)�� ��������(DESC, DESCENDING)
-- ����: 1,2,3,4
-- ����: A,B,C,D ����������(��������) �ݴ�� ��������
-- Question 23. ����� �޿��� �������� �������� �����Ͽ� �����Ͻÿ�..
SELECT * 
FROM EMPLOYEE
ORDER BY SALARY;

SELECT * 
FROM EMPLOYEE
ORDER BY SALARY DESC; //��������

-- Question 24. �μ���ȣ�� �������� �������� �����Ͽ� �����Ͻÿ�. �̋�, ������ �μ���ȣ�� ������ �ִ� ������ �޿��� �������� �������� �����Ͻÿ�.
SELECT * 
FROM EMPLOYEE
ORDER BY DNO, SALARY DESC;

-- Question 25. ���� �ֱٿ� �Ի��� ���������� �����Ͻÿ�.
SELECT * 
FROM EMPLOYEE
ORDER BY HIREDATE DESC;

-- DISTINCT: ������ ������ �ߺ��Ǿ� ������� �ʵ��� �ϴ� �ɼ�
SELECT DISTINCT DNO FROM EMPLOYEE;

-- ���� ������: SELECT�� ���ο� ���ڸ� ������ �� ����ϴ� ������, ||
SELECT ENAME ||  '�� ������ ' || JOB ||  '�Դϴ�.'
FROM EMPLOYEE;

-- �Լ�(FUNCTION): �ݺ������� �����ϴ� ����̳� ����� �ϳ��� ������� ��� �����ϴ� ��ɾ�
-- SQL ������ �Լ�: �Լ��� ����� �ϳ��� ������ ����ȴ�.
-- ����: ���� �Լ�, ���� �Լ�, ��¥ �Լ�, ������, �Ϲ� �Լ�
-- SQL ������ �Լ� = �׷��Լ�

-- DUAL ���̺�: �ӽ� ���̺�, ������ �Լ��� ����� �����ϱ� ���� ���Ǵ� ������ ���̺� �̸�
-- 10 * 5
SELECT 10 * 5
FROM DUAL;

DESC DUAL;

SELECT * FROM DUAL;

-- ���� �ý����� ��¥�� �����ϴ� �Լ�
SELECT SYSDATE
FROM DUAL;

-- ���� �Լ�: ���� �����͸� ó���ϴ� �Լ�
-- ABS(): ���밪�� �����ϴ� �Լ�
SELECT -10, ABS(-10)
FROM DUAL;

-- ROUND(����, �ڸ���): Ư�� �ڸ������� �ݿø��ϴ� �Լ�
--FLOOR(����): �Ҽ��� �Ʒ��� ������ �Լ�
SELECT 34.5432, ROUND(34.5432, 0), FLOOR(34.5432)
FROM DUAL;

SELECT 34.5678, ROUND(34.5678, 2), ROUND(34.5678, -1)
FROM DUAL;

-- MOD(����, ������): ���ڸ� �ش� ���� ���� ������ ����� �������� �����ϴ� �Լ�
SELECT MOD(27, 5), MOD(27, 7), MOD(27, 2)
FROM DUAL;

-- �ڿ��� ó��, NLP
-- UPPER, LOWER, LENGTH, LENGTHB(���� ����Ʈ ���̷� �˷���), INSTR, SUBSTR(�߰��� �ִ� ���� Ȯ��) etc

