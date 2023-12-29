-- JOIN(����)
-- �ϳ� �̻��� ���̺� ��� ���� �����Ͽ� �����ϴ� ī��� �� ����(�÷��� ��������, ���ڵ�� ��������.), 
-- ������ �÷��� �̿��Ͽ� �־��� ���ǿ� �����ϴ� ���ڵ常 �����ϴ� �����(EQUI JOIN) =INNER JOIN(��������), ������(NON-EQUI JOIN),
-- ������ �̸��� ���̺��� ������ �����ϴ�  SELF JOIN, �Ϲ������� JOIN ���ǿ� �����ϴ� �ڷḸ ���������� �׷��� ���� �ڷḦ ������ �� OUTER JOIN(�ܺ�����)

-- Question 1. �����ȣ�� 7788�� ����� �̸��� �Ҽ� �μ����� �����Ͻÿ�.
-- �ǽ��� ���̺� ��� Ȯ��
SELECT * FROM TAB;
-- �ǽ��� ���̺��� ������ Ȯ��
SELECT * FROM DEPARTMENT; // �μ�����(�μ���ȣ, �μ���, �μ���ġ)
SELECT * FROM EMPLOYEE; // �������(���, �̸�, ����, ���, �޿�, ���ʽ�, �Ի���, �μ���ȣ)
SELECT * FROM SALGRADE; // �޿��� ���(���, �����޿�, �ְ�޿�)

-- STEP 1. �����ȣ�� 7788�� �ش��ϴ� ����� ������ ����
SELECT * FROM EMPLOYEE WHERE ENO = 7788;
SELECT DNO FROM EMPLOYEE WHERE ENO = 7788;
-- STEP 2. ������ �� �μ���ȣ�� �̿��� �μ����� ����
SELECT DNAME FROM DEPARTMENT WHERE DNO = 20;

-- JOIN: �ϳ� �̻��� ���̺��� �����Ͽ� ���ϴ� ���ǿ� �����ϴ� ������ �����ϴ� ���
SELECT ENAME, LOC
FROM EMPLOYEE E, DEPARTMENT D  /* E.DNO = D.DNO �̷��� �����μ��� ���������� ���� ������ ī��þ� ������ ����� ���´�.*/
WHERE ENO = 7788 AND E.DNO = D.DNO; /*JOIIN�ϴ� �� ���̺� ������ �̸��� �÷��� ������ ���� �� �ݵ�� ���̺���� ����ؾ� �Ѵ�.*/

--JOIN ���ǿ� �ش��ϴ� �÷��� ��� USING �Լ�
SELECT ENAME, LOC
FROM EMPLOYEE JOIN DEPARTMENT
USING(DNO)
WHERE ENO = 7788;

-- NON-EQUI JOIN: �� ����, <>, !=, ^=, >, >=, <, <= �����ڸ� �̿��� JOIN
-- Question 2. ������� �޿� �׸��� �޿������ �����Ͻÿ�.
SELECT ENAME, SALARY, GRADE
FROM EMPLOYEE, SALGRADE
WHERE SALARY>= LOSAL AND SALARY <= HISAL;

SELECT ENAME, SALARY, GRADE
FROM EMPLOYEE, SALGRADE
WHERE SALARY BETWEEN LOSAL AND HISAL;

-- Question 3. ����� �̸��� �Ҽӵ� �μ��� �̸� �׸��� �޿�, �޿������ �����Ͻÿ�.
SELECT ENAME, DNAME, SALARY, GRADE
FROM EMPLOYEE E ,DEPARTMENT D, SALGRADE
WHERE E.DNO = D.DNO AND SALARY BETWEEN LOSAL AND HISAL;

-- SELF-JOIN: �ڱ� �ڽŰ� ������ �����ϴ� JOIN.
-- ���� ��� ���̺��� �ڱ� �ڽ��̶�� �͸� �����ϸ� EQUI JOIN�� �����ϴ�.
-- Question 4. ����� �̸��� ���ӻ���� �̸��� ���� �Ͻÿ�.
-- MANAGER �÷��� �ش� ����� ���ӻ���� �����ȣ�� ��Ÿ����.
SELECT E.ENAME ����̸�, M.ENAME ����̸�
FROM EMPLOYEE E, EMPLOYEE M
WHERE E.MANAGER = M.ENO;

SELECT E.ENAME ����̸�, M.ENAME ����̸�
FROM EMPLOYEE E, EMPLOYEE M
WHERE E.MANAGER = M.ENO(+); //RIGHT OUTER JOIN �ΰ��� ������ ��

-- TEST 1. SCOTT ����� �μ���ȣ�� �μ����� �����Ͻÿ�.
SELECT E.DNO, LOC
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DNO = D.DNO AND ENAME = 'SCOTT';

-- TEST 2. ����� �̸��� �Ҽӵ� �μ��� �׸��� �μ��� ��ġ�� �����Ͻÿ�.
SELECT ENAME, DNAME, LOC
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DNO = D.DNO;

-- TEST 3. �μ���ȣ�� 10�� �ش�Ǵ� ������� ������ �����Ͻÿ�.
SELECT ENAME, JOB
FROM EMPLOYEE
WHERE DNO = 10;

-- TEST 4. Ŀ�̼��� �޴� ����� �̸��� �μ���, �μ��������� �����Ͻÿ�.
SELECT ENAME, DNAME, LOC, COMMISSION
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DNO = D.DNO AND COMMISSION IS NOT NULL;

-- TEST 5. ����� 'A'�� ���Ե� ����� �̸��� �μ����� �����Ͻÿ�.
SELECT ENAME, DNAME, LOC
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DNO = D.DNO AND ENAME LIKE '%A%';

-- TEST 6. NEW YORK���� �ٹ��ϴ� ����� �̸��� ����, �μ���ȣ, �μ����� �����Ͻÿ�.
SELECT ENAME, JOB, E.DNO, DNAME
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DNO = D.DNO AND LOC = 'NEW YORK';

-- TEST 7. ����̸�, �����ȣ, ����̸�, �����ȣ�� �����Ͻÿ�.
SELECT E.ENAME, E.ENO, M.ENAME, M.ENO
FROM EMPLOYEE E, EMPLOYEE M
WHERE E.MANAGER = M.ENO(+);
