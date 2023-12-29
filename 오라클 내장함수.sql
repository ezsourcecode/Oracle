-- �Լ�(Function): ����� ���� �Լ��� �����Լ�
--�Լ��� �ݺ������� �����ϴ� ����̳� ��ɾ �ϳ��� �̸����� ��� ����ϵ��� ������� ��ɾ� ����
--SQL �Լ�: �����Լ�, �����Լ�, ��¥�Լ�, ����ȯ�Լ�, NVL etc.

-- 1. DUAL ���̺�: �� ���� ������� �����ϱ� ���� ���̺�, Oracle���� �������� ���� ���̺�
-- 2. �����Լ�: ���� �����͸� ó���ϱ� ���� �Լ�
-- ABS(���ڵ�����): ���밪�� ���ϴ� �Լ�
-- Question 1. -7�� ���밪�� �����Ͻÿ�.
SELECT -7, ABS(-7)
FROM DUAL;
-- AS: ��Ī
SELECT -7 AS "������", ABS(-7) "���밪"
FROM DUAL;

-- FLOOR(���ڵ�����): �Ҽ��� �Ʒ��� ������ �Լ�
-- Question2. 42.19547 �������� �Ҽ��� �Ʒ��� ����� �����Ͻÿ�.
SELECT 42.69547, FLOOR(42.69547)
FROM DUAL;

--ROUND(���ڵ�����, �ڸ���): �Ҽ��� �Ʒ��� ������ �Լ�
SELECT 42.69547, ROUND(42.69547)
FROM DUAL;

--ROUND(���ڵ�����, �ڸ���): �Ҽ��� �Ʒ��� ������ �Լ�
-- �ڸ����� �����ϸ� 0���� �����Ѵ�.
-- �ڸ����� ������ ��� �ϴ��� -> �ʴ��� -> ����� ������ �ݿø��Ѵ�.
-- Question 3. 34.56789 ���ڸ� -1�� �ڸ����� �ݿø��Ͽ� �����Ͻÿ�.
SELECT 34.56789, ROUND(34.56789 ,-1), ROUND(34.56789 ,-2)
FROM DUAL;

-- MOD(���ڵ�����, ������): �������� �����ϴ� ��
SELECT 27, MOD(27, 2), MOD(27, 5), MOD(27, 7)
FROM DUAL;

-- 3. �����Լ�: ���� �����͸� ó���ϴ� �Լ�
-- UPPER(���ڵ�����): �빮�ڷ� ��ȯ�ϴ� �Լ�
SELECT 'Welcome to Oracle' "����������", UPPER('Welcome to Oracle') "UPPER ���� ��"
FROM DUAL;

-- LOWER(���ڵ�����): �ҹ��ڷ� ��ȯ�ϴ� �Լ�
SELECT 'Welcome to Oracle' "����������", LOWER('Welcome to Oracle') "LOWER ���� ��"
FROM DUAL;

-- INITCAP(���ڵ�����): �̴ϼȸ� �빮�ڷ� ��ȯ�ϴ� �Լ�, ù ���ڸ� �빮�ڷ� ��ȯ�ϴ� �Լ�
SELECT 'welcome to oracle', INITCAP('welcome to oracle')
FROM DUAL;

-- LENGTH(���ڵ�����): ���� ���̸� �����ϴ� �Լ�
-- ����: ����, ������, Ư������/�ѱ�, ����
SELECT LENGTH('ORACLE'), LENGTH('����Ŭ')
FROM DUAL;

-- LENGTHB(���ڵ�����): ������ ����Ʈ ���̸� �����ϴ� �Լ�
-- ����: ����, ������, Ư������/�ѱ�, ����
SELECT LENGTHB('ORACLE'), LENGTHB('����Ŭ') //�ѱ��� �����ڵ� ó����(UNICODE - �� ���ڴ� 3BYTE)
FROM DUAL;

--INSTR(���ڵ�����, ����): Ư�� ������ ��ġ�� �����ϴ� �Լ�.
-- 'Welcome to Oracle'���� 'O'�� ����� ��ġ ���� �����ϴ� �������� �ۼ��Ͻÿ�.
SELECT INSTR('Welcome to Oracle', 'O')
FROM DUAL;

-- SUBSTR/SUBSTRB
-- SUBSTR(���ڵ�����, ������ġ, ���ڼ�): ���ڿ��� ������ġ���� ���ڼ���ŭ �����ϴ� �Լ�
-- �ε��� 4���� �����ؼ� ���� 3���� �����ϴ� �������� �ۼ��Ͻÿ�.
-- ����Ŭ�̳� R���� ���α׷��� �� �ƴ� ���� �ε����� ���۰��� 0�� �ƴ� 1���� �����Ѵ�.
SELECT SUBSTR('Welcome to Oracle', 4, 3)
FROM DUAL;
-- Question 4. ��������� ������ �ִ� ���̺� EMPLOYEE���� ������ �Ի�⵵�� �Ի��� �޸� �����ϴ� �������� �ۼ��Ͻÿ�.
-- �����̸��� �Ի�⵵, �Ի���� �����ϵ��� �����Ͻÿ�. (��: 1980 12)
SELECT ENAME,19 || SUBSTR(HIREDATE, 1, 2) "�⵵", SUBSTR(HIREDATE, 4, 2) "��"
FROM EMPLOYEE;

-- Question 5. �� �ڵ带 Ȱ���Ͽ� 9���� �Ի��� ������ �����ϴ� �������� ����Ͻÿ�.
SELECT ENAME,19 || SUBSTR(HIREDATE, 1, 2) "�⵵", SUBSTR(HIREDATE, 4, 2) "��"
FROM EMPLOYEE
WHERE SUBSTR(HIREDATE, 4, 2) = '09';

-- 4. ��¥�Լ�: DATE���� ����ϴ� �Լ�
-- ��� ������ ��¥ or �Ⱓ�� ��´�. �̶� �Ⱓ�� �ַ� �ϴ����� ���ȴ�.
-- ��¥ + ����, ��¥ - ����, ��¥ - ��¥

--SYSDATE: ���� �ý��ۿ� ��ϵ� ��¥�� ��ȯ�ϴ� �Լ�, �ý����� ���� ��¥�� �����Ѵ�.
SELECT SYSDATE
FROM DUAL;

-- Question 6. SYSDATE�� Ȱ���Ͽ� ����, ����, ���� ��¥�� �����ϴ� �������� �����Ͻÿ�.
SELECT SYSDATE -1 ����, SYSDATE ����, SYSDATE +1 ����
FROM DUAL;

--MONTHS_BETWEEN: �� ��¥ ������ ���� ���� ���ϴ� �Լ�
-- Question 7. �������� �ٹ��������� �����ϴ� �������� ����Ͻÿ�.
SELECT ENAME, SYSDATE, HIREDATE, FLOOR(MONTHS_BETWEEN(SYSDATE, HIREDATE)) �ٹ�������
FROM EMPLOYEE;

-- ADD_MONTHS: Ư�� ���� ���� ���� ��¥�� �����ϴ� �Լ�
-- Question 8. �������� �Ի� 4���� ���� ��¥�� �����Ͻÿ�.
SELECT ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 4)  "�Ի� 4���� ��"
FROM EMPLOYEE;

-- 5. ����ȯ�Լ�(������, ������, ��¥��)
-- Number <=> Character(VARCHAR2, CHAR) / Character <=> Date
-- TO_NUMBER(), TO_CHAR(), TO_DATE()
-- �Ϲ������� ��¥�� ���ڵ����� ���·� ��ȯ�Ͽ� ǥ���ϴ� ��찡 ����.
-- YYYY/YY, MM, MON, DAY

--TO_CHAR(): ��¥ or ���ڸ� ���������� ��ȯ�ϴ� �Լ�
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD')
FROM DUAL;

-- Question 9. �������� �Ի����� �⵵-��-�� ���Ϸ� ����ǵ��� �����Ͻÿ�.
SELECT HIREDATE, TO_CHAR(HIREDATE, 'YYYY-MM-DD DY', 'NLS_DATE_LANGUAGE = AMERICAN')
FROM EMPLOYEE;

-- SELECT Ȯ����: �׷��Լ�(GROUP BY)�� �׷캰 ����(HAVING)
-- �׷��Լ�: �ϳ� �̻��� ���� �׷����� ��� ������ �����ϰ�, �ϳ��� ����� �����ϴ� �Լ�
-- ������ �Լ�: �ϳ��� ����� �����ϴ� �Լ�
-- ������ �Լ�: ���� ���� ����� �����ϴ� �Լ�, ������ �Լ��� ����Ͽ� ó���Ѵ�.

-- SUM(�÷���): �ش� �÷��� ���鿡 ������ �����ϴ� �Լ�
-- Question 10. �������� �޿��� ������ �����ϵ�, õ ���� ���ϸ� �ݿø��Ͽ� �����ϵ��� �����Ͻÿ�.
SELECT ENAME, SALARY, ROUND(SALARY, -3)
FROM EMPLOYEE;

SELECT SUM(SALARY)
FROM EMPLOYEE;

-- Question 11. �������� COMMISSION ������ �����ϵ��� �����Ͻÿ�.
SELECT SUM(COMMISSION)
FROM EMPLOYEE;

--AVG(�÷���): �ش� �÷��� ������ ����� �����ϴ� �Լ�
-- Question 12. ���� �޿��� �� ����� �����Ͻÿ�.
SELECT ROUND(AVG(SALARY), 2)
FROM EMPLOYEE;

-- MAX /MIN(�÷���)
-- Question 13. �������� �޿� �� ���� ���� �޿��� ���� ���� �޿��� �����ϵ��� �����Ͻÿ�.
SELECT MAX(SALARY), MIN(SALARY)
FROM EMPLOYEE;

-- Question 14. ���� ���� �޿��� �޴� ������ �����ϵ��� �����Ͻÿ�.
SELECT ENAME, SALARY
FROM EMPLOYEE
WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEE);

--COUNT(�÷���): �ش� �÷��� ������ ��ȯ�ϴ� �Լ�, NULL���� ������� �ʴ´�.
-- Question 15. ������ ���� �����Ͻÿ�.
SELECT COUNT(*)
FROM EMPLOYEE;

SELECT COUNT(COMMISSION)
FROM EMPLOYEE;

-- Question 16. ������(JOB)�� ������ �����Ͻÿ�.
SELECT COUNT(DISTINCT JOB)
FROM EMPLOYEE;

-- Question 17. �μ��� ������ �����Ͻÿ�.
SELECT COUNT(DISTINCT DNO)
FROM EMPLOYEE;

-- GROUP BY��: Ư�� �÷��� �������� �׷�ȭ�Ͽ� ����� �����Ѵ�.
-- �׷��Լ��� �Բ� ����Ѵ�.
-- Question 18. �μ��� ������ �޿��� ������ �����Ͻÿ�.
SELECT DNO, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DNO;

-- Question 19. ���޺� �޿��� ���հ� ����� �����ϵ�, �ش� ���޵� ǥ���Ͻÿ�.
SELECT JOB, SUM(SALARY), ROUND(AVG(SALARY), 1)
FROM EMPLOYEE
GROUP BY JOB;

-- Question 20. �� �μ��� �ο����� ���ʽ��� �޴� ������ ���� �����Ͻÿ�.
SELECT DNO, COUNT(DNO), COUNT(COMMISSION)
FROM EMPLOYEE
GROUP BY DNO;

SELECT * FROM DEPARTMENT;

-- HAVING��: GROUP BY�� ���� ������ ����� ������ ���� �� ����Ѵ�.
--Question 21. �μ���ȣ�� 30���� �ش��ϴ� �������� ���޺� �޿��� ���� �����Ͻÿ�.
SELECT JOB, SUM(SALARY)
FROM EMPLOYEE
WHERE DNO = 30
GROUP BY JOB;

-- Question 22. �μ��� ��� �޿��� 2000 �̻��� �μ��� ��ȣ�� ��� �޿��� �����Ͻÿ�.
SELECT DNO, ROUND( AVG(SALARY), 1)
FROM EMPLOYEE
GROUP BY DNO
HAVING AVG(SALARY) >= 2000;

-- Question 23. �μ��� �ִ�޿��� �ּұ޿��� �����ϵ� �ִ�޿��� 2900�̻��� �μ��� �����Ͻÿ�
SELECT DNO, MAX(SALARY), MIN(SALARY)
FROM EMPLOYEE
GROUP BY DNO
HAVING MAX(SALARY) >= 2900;

-- ����(JOIN): �ϳ� �̻��� ���̺��� ���� ��ġ �ϳ��� ���̺��� ��ó�� ����ϴ� ���
-- �����ͺ��̽��� �ϳ��� ���̺� ��� �����͸� ���� �ʰ� ���� ���̺�� ������ �л�ó���Ѵ�. �̋� �� ���̺��� Ư�� ��Ģ�̳� ���谡 �ֵ��� ����ȴ�.
-- ���� ���̺� ����� �ִ� �����͸� ����ڰ� ���ϴ� �����͸� ��� ã�� �����ϱ� ���� ���� ���̺��� ��ȸ�ؾ� �Ѵ�. �׷��� ������ ����� JOIN�̴�.

-- Question 24. SCOTT�� �μ����� �����Ͻÿ�.
-- STEP 1. 
SELECT DNO
FROM EMPLOYEE
WHERE ENAME = 'SCOTT';
-- STEP 2. 20���� �ش��ϴ� �μ����� ����
SELECT DNAME
FROM DEPARTMENT
WHERE DNO = 20;

-- ������ ����: CARTESIAN PRODUCT(ī��þ� ��), EQUI JOIN, NON-EQUI JOIN, SELF JOIN, OUTER JOIN
-- CARTESIAN PRODUCT(ī��þ� ��): ���� �ٸ� �� ���� ���̺��� ������ �� Ư�� �÷��� ���� ���ε��� �ʰ� ��� �����͸� ����� ��Ÿ���� ���
-- ���: �÷� ���� ��������, ���� ���� ������ ����� ����Ѵ�.
SELECT *
FROM EMPLOYEE; // ��������(���� �� 14, �÷� �� 8)
SELECT *
FROM DEPARTMENT; // �μ�����(���� �� 4 �÷� �� 3)

SELECT *
FROM EMPLOYEE, DEPARTMENT; -- JOIN  �Ű�ü ���� ������ �׳� �� �������� ī��þ� ���� ����.(���� �� 56 �÷� �� 11)

-- EQUI-JOIN:  ������ �� �����Ϳ� ���������� �����ϴ� �÷��� ���� ��ġ�ϴ� �ุ �����Ͽ� ����� �����ϴ� ����. INNER JOIN
-- �񱳿�����: =, <>, !=, ^=, >, >=, <, <=
-- Question 25. ���������� �����ϵ� �� ����� �ҼӺμ��� ���� ������ �Բ� ����ǵ��� �����Ͻÿ�.
SELECT *
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DNO = D.DNO;

-- Question 26. SCOTT�� �μ����� �����Ͻÿ�.
SELECT E.DNO, ENAME, DNAME
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DNO = D.DNO AND ENAME = 'SCOTT';

-- NON-EQUI JOIN: ������ �÷��� ���� �ٸ� ������ ����Ͽ� ������ �� ���δ�.
SELECT * 
FROM TAB;
SELECT *
FROM SALGRADE;

-- Question 27. �� ������ �޿��� �� ��޿� �ش��ϴ����� �����Ͻÿ�. ��, �����̸�, �޿�, ����� ǥ�õǵ��� ������ ��.
SELECT ENAME, SALARY, GRADE
FROM EMPLOYEE, SALGRADE
WHERE SALARY BETWEEN LOSAL AND HISAL;

-- Question 28. ������ �̸�, �ҼӺμ���, �޿� ����� �����Ͻÿ�.
SELECT E.ENAME, D.DNAME, S.GRADE
FROM EMPLOYEE E, DEPARTMENT D, SALGRADE S
WHERE E.DNO = D.DNO AND E.SALARY BETWEEN S.LOSAL AND S.HISAL;

-- SELF-JOIN: �ڱ� �ڽŰ��� ������ �����ϴ� ���
SELECT *
FROM EMPLOYEE;

-- Question 29. ALLEN�� ���ӻ���� �̸��� �����Ͻÿ�.
-- STEP 1. ALLEN�� MANAGER ���� ���´�.
SELECT MANAGER
FROM EMPLOYEE
WHERE ENAME = 'ALLEN';
-- STEP 2. MANAGER�� ���� ��ġ�ϴ� ENO�� ������ �ִ� ����� �̸��� �����Ѵ�.
SELECT ENAME
FROM EMPLOYEE
WHERE ENO =7698 ;

SELECT MAG.ENAME
FROM EMPLOYEE EMP, EMPLOYEE MAG 
WHERE EMP.ENAME = 'ALLEN' AND MAG.ENO = EMP.MANAGER;

-- Question 30. ������ �̸��� ���ӻ���� �̸��� �����ϴ� ���α׷��� �����Ͻÿ�.
SELECT EMP.ENAME ������, MAG.ENAME ���ӻ����
FROM EMPLOYEE EMP, EMPLOYEE MAG
WHERE EMP.MANAGER = MAG.ENO; // KING�� �Ŵ����� ���� �� ������ �������� ���� ����� �� ��.

-- OUTER JOIN: ���� ���ǿ� �������� �ʴ� ���� �����ϴ� ���

SELECT EMP.ENAME ������, MAG.ENAME ���ӻ����
FROM EMPLOYEE EMP, EMPLOYEE MAG
WHERE EMP.MANAGER = MAG.ENO(+);

-- ��������(SUB QUERY): ���� �ȿ� �� �ٸ� ������ ��Ƽ� ǥ���ϴ� �⤿��
-- �ϳ��� SELECT �������� ���Ե� �� �ٸ� SELECT ������ ���Ѵ�.
-- �񱳿������� �����ʿ� ����ؾ� �ϰ�, �ݵ�� ��ȣ�� ������� �Ѵ�.
-- ���������� ����Ǳ� ���� ���� �� ���� ����ȴ�.
-- ����: ������ ���������� ������ ��������

-- ������ ���� ����: ���������� �������� ���� �ϳ��� �ุ ��ȯ�ȴ�.
-- �񱳿�����: =, <>, !=, ^=, >, >=, <, <=

-- Question 31. SCOTT�� �μ����� �����Ͻÿ�.
-- EQUI JOIN ���࿹��
SELECT DNAME
FROM EMPLOYEE EMP, DEPARTMENT DEPT
WHERE EMP.ENAME = 'SCOTT' AND EMP.DNO = DEPT.DNO;

--��������
SELECT DNAME
FROM DEPARTMENT
WHERE DNO = (SELECT DNO
                                FROM EMPLOYEE
                                WHERE ENAME = 'SCOTT');

-- Question 32. �������� ��� �޿����� �� ���� �޿��� �޴� ����� �̸��� �޿��� �����Ͻÿ�.
SELECT ENAME, SALARY
FROM EMPLOYEE
WHERE SALARY < (SELECT ROUND(AVG(SALARY), 1)
                                        FROM EMPLOYEE);

-- Question 33. SCOTT�� �޿��� �����ϰų� �� ���� �޴� ����� �̸��� �޿��� �����Ͻÿ�.
SELECT ENAME, SALARY
FROM EMPLOYEE
WHERE SALARY >= (SELECT SALARY
                                        FROM EMPLOYEE
                                        WHERE ENAME = 'SCOTT');
                                        
-- Question 34. �μ���ȣ�� 20���� �ش��ϴ� ��� �߿� ��ü ��� �޿��� ��պ��� ���� �޿��� �޴� ����� �̸�, �޿�, �μ����� �����Ͻÿ�.
SELECT ENAME, SALARY, DNAME
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DNO = D. DNO AND  E.DNO = 20 AND SALARY > (SELECT AVG(SALARY)
                                                                                                                 FROM EMPLOYEE);
-- WHERE�� E.DNO = D. DNO �� ���� ������ ��Ʈ���� ī��þ� ���� ����

-- ������ ��������: ���������� ������� �ϳ� �̻� �ش��ϴ� ����
-- �ݵ�� ������ �����ڿ� �Բ� ����ؾ� �Ѵ�.
-- IN: ���� ������ �� ������ ���� ������ ��� �߿��� ��� �� �ϳ��� ��ġ�ϸ� ���� �Ǵ� ������
-- Question 35. �޿��� 3000 �̻��� ������ ������ �μ����� �ٹ��ϴ� �������  �̸�, �޿�, �μ���ȣ�� �����Ͻÿ�.
-- STEP 1. �޿��� 3000 �̻��� ������ �μ���ȣ�� �����Ѵ�.
SELECT DNO
FROM EMPLOYEE
WHERE SALARY >= 3000);
-- STEP 2. �μ���ȣ�� 10�̰ų� 20���� �ش��ϴ� ���� �� �޿��� 3000 �̻��� ������ ������ �����Ѵ�.
SELECT ENAME, SALARY, DNO
FROM EMPLOYEE
WHERE DNO = 10 OR DNO = 20;
-- �μ���ȣ�� 10�̰ų� 20���� �ش��ϴ� ����� ������ �����Ͻÿ�.
SELECT *
FROM EMPLOYEE
WHERE DNO IN(10, 20);

SELECT ENAME, SALARY, DNO
FROM EMPLOYEE
WHERE DNO IN  (SELECT DNO
                                     FROM EMPLOYEE
                                     WHERE SALARY >= 3000);

-- ANY, SOME: ���� ������ �� ������ ���� ������ �˻� ����� �ϳ� �̻��� ��ġ�ϸ� ���� �Ǵ� ������
-- < ANY: ã���� ���� ���ؼ� �ϳ��� ũ�� ���� �Ǵ� ������, �ּҰ��� ��ȯ�ϴ� �Ͱ� ���� �ǹ�
-- >ANY: ã���� ���� ���ؼ� �ϳ��� ������ ���� �Ǵ� ������, �ִ밪�� ��ȭ�ϴ� �Ͱ� ���� �ǹ�
-- Question 36. �μ���ȣ�� 30���� ��� �� �޿��� ���� ���� ������� ���� �޿��� �޴� ����� �̸��� �޿��� �����Ͻÿ�.
-- STEP 1. �μ���ȣ�� 30���� �ش��ϴ� ��� ����
SELECT ENAME, SALARY
FROM EMPLOYEE
WHERE DNO = 30;
-- STEP 2. �޿��� 950���� ���� ����� �̸��� �޿� ����
SELECT ENAME, SALARY
FROM EMPLOYEE
WHERE SALARY >  950;

-- 950���� ū ���� �� ����
SELECT ENAME, SALARY
FROM EMPLOYEE
WHERE SALARY >  ANY(SELECT SALARY
                                               FROM EMPLOYEE
                                               WHERE DNO = 30);
--�μ���ȣ 30���� ���� ����麸�� �޿��� ������ ��µǶ�
SELECT ENAME, SALARY
FROM EMPLOYEE
WHERE SALARY <  ANY(SELECT SALARY
                                               FROM EMPLOYEE
                                               WHERE DNO = 30);

-- Question 37. �μ���ȣ�� 30���� ����� �߿� �޿��� ���� ���� �޴� ������� �� ���� �޿��� �޴� ����� �̸��� �޿��� �����Ͻÿ�.
-- STEP 1. �μ���ȣ�� 30���� �ش��ϴ� ��� ����
SELECT ENAME, SALARY
FROM EMPLOYEE
WHERE DNO = 30;
-- STEP 2. �޿��� 2850���� ���� ����� �̸��� �޿� ����
SELECT ENAME, SALARY
FROM EMPLOYEE
WHERE SALARY >  2850;
-- ������
SELECT ENAME, SALARY
FROM EMPLOYEE
WHERE SALARY > ALL(SELECT SALARY
                                               FROM EMPLOYEE
                                               WHERE DNO = 30);
-- ������
SELECT ENAME, SALARY
FROM EMPLOYEE
WHERE SALARY > (SELECT MAX(SALARY)
                                               FROM EMPLOYEE
                                               WHERE DNO = 30);

