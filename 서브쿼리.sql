-- ��������(SUB QUERY): JOIN�� Ȯ���� ����
-- SELECT�� �ȿ� �� �ٸ� SELECT���� ���� �� �̰��� ���������� �θ���.
-- ���������� �ش� ������ ������� ������ ���� ������ ��������, ������ ���������� ������.
-- ������ ���������� �ݵ�� ������ �����ڿ� �Բ� ����ؾ� �Ѵ�.(IN, ANY=SOME, ALL)
-- ���������� ��ȣ(=) ������ ����Ѵ�.
-- ���������� ���������� ����Ǳ� ���� ���� �� �� �����Ѵ�.

--Question 1. SCOTT ������� �޿��� ���� �޴� ����� �����Ͻÿ�.
-- STEP 1. SCOTT�� �޿��� ���� �����Ѵ�.
SELECT SALARY
FROM EMPLOYEE
WHERE ENAME = 'SCOTT';
-- STEP 2. ����� SCOTT�� �޿��� �������� �ٸ� ����� �޿��� ���Ͽ� ����� �����Ѵ�.
SELECT *
FROM EMPLOYEE
WHERE SALARY > 3000;

SELECT *
FROM EMPLOYEE
WHERE SALARY > (SELECT SALARY
                                      FROM EMPLOYEE
                                      WHERE ENAME = 'SCOTT'); //������ ��������

-- Question 2. SCOTT�� ������ �μ����� �ٹ��ϴ� ����� ������ �����Ͻÿ�.
-- STEP 1. SCOTT�� �μ���ȣ�� ����
 SELECT DNO
 FROM EMPLOYEE
 WHERE ENAME = 'SCOTT';
-- STEP 2. ����� �μ���ȣ�� ��ġ�ϴ� ����� ������ ����
SELECT *
FROM EMPLOYEE
WHERE DNO = 20;

SELECT *
FROM EMPLOYEE
WHERE DNO = (SELECT DNO
                               FROM EMPLOYEE
                               WHERE ENAME = 'SCOTT');

-- Question 3. �ּұ޿��� �޴� ����� �̸�, ����, �޿��� �����Ͻÿ�.
SELECT ENAME, JOB, SALARY
FROM EMPLOYEE
WHERE SALARY = (SELECT MIN(SALARY)
                                      FROM EMPLOYEE);

-- Question 4. 30�� �μ��� ���� ���� �� �ּұ޿��� �޴� ����� �޿����� �� ū �޿��� �޴� �μ��� ��ȣ�� �ּұ޿��� �����Ͻÿ�.
-- STEP 1. �μ���ȣ�� 30���� �������� �޿� �� �ּұ޿� ����
SELECT MIN(SALARY)
FROM EMPLOYEE
WHERE DNO = 30;
-- STEP 2. �μ��� �ּұ޿��� ���� ���� 950���� ū �μ��� ��ȣ�� �ּұ޿��� �����Ѵ�.
SELECT DNO, MIN(SALARY)
FROM EMPLOYEE
GROUP BY DNO
HAVING MIN(SALARY) >950;

SELECT DNO, MIN(SALARY)
FROM EMPLOYEE
GROUP BY DNO
HAVING MIN(SALARY) > (SELECT MIN(SALARY)
                                                FROM EMPLOYEE
                                                WHERE DNO = 30);

 -- ������: WHERE���� HAVING��(�׷캰�� ������� ����� �������� ������ ��´�)
 
 -- Question 5. �μ��� �ּұ޿��� �޴� ����� �����ȣ�� �̸��� �����Ͻÿ�.
-- STEP 1. �μ���ȣ�� �μ��� �ּұ޿��� �����Ѵ�.
SELECT DNO, MIN(SALARY)
FROM EMPLOYEE
GROUP BY DNO; -- ������ ������� ������ �ִ�.
-- STEP 2. ������ �������� ���
SELECT ENO, ENAME, DNO
FROM EMPLOYEE
WHERE SALARY IN(950, 800, 1300);

SELECT ENO, ENAME
FROM EMPLOYEE
WHERE SALARY IN (SELECT MIN(SALARY)
                                       FROM EMPLOYEE
                                       GROUP BY DNO);

-- Question 6. ������ SALESMAN�� �ƴϸ鼭 �޿��� ������ SALESMAN���� ���� ����� ������ �����Ͻÿ�.
-- STEP 1. ������ SALESMAN�� ������� �޿��� �����Ѵ�.
SELECT SALARY
FROM EMPLOYEE
WHERE JOB = 'SALESMAN';

-- STEP 2. ������ SALESMAN�� �ƴ� �������� �޿��� ���� ���� ������� ���Ͽ� ����� �����Ѵ�.
SELECT *
FROM EMPLOYEE
WHERE JOB != 'SALESMAN';
-- ANY ���� ��
SELECT *
FROM EMPLOYEE
WHERE JOB != 'SALESMAN' AND SALARY < ANY (SELECT SALARY 
                                                                                               FROM EMPLOYEE 
                                                                                               WHERE JOB = 'SALESMAN');
-- ALL�� ��ü���� ���� ���� ���� ����
SELECT *
FROM EMPLOYEE
WHERE JOB != 'SALESMAN' AND SALARY < ALL (SELECT SALARY 
                                                                                               FROM EMPLOYEE 
                                                                                               WHERE JOB = 'SALESMAN')
