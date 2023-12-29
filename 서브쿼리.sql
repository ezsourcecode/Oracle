-- 서브쿼리(SUB QUERY): JOIN을 확장한 개념
-- SELECT문 안에 또 다른 SELECT문을 담을 때 이것을 서브쿼리락 부른다.
-- 서브쿼리는 해당 쿼리의 결과값의 개수에 따라 단일행 서브쿼리, 다중행 서브쿼리로 나눈다.
-- 다중행 서브쿼리는 반드시 다중행 연산자와 함께 사용해야 한다.(IN, ANY=SOME, ALL)
-- 서브쿼리는 등호(=) 우측에 기술한다.
-- 서브쿼리는 메인쿼리가 실행되기 전에 먼저 한 번 수행한다.

--Question 1. SCOTT 사원보다 급여를 많이 받는 사원을 추출하시오.
-- STEP 1. SCOTT의 급여를 먼저 추출한다.
SELECT SALARY
FROM EMPLOYEE
WHERE ENAME = 'SCOTT';
-- STEP 2. 추출된 SCOTT의 급여를 기준으로 다른 사원의 급여와 비교하여 결과를 추출한다.
SELECT *
FROM EMPLOYEE
WHERE SALARY > 3000;

SELECT *
FROM EMPLOYEE
WHERE SALARY > (SELECT SALARY
                                      FROM EMPLOYEE
                                      WHERE ENAME = 'SCOTT'); //단일행 서브쿼리

-- Question 2. SCOTT과 동일한 부서에서 근무하는 사원의 정보를 추출하시오.
-- STEP 1. SCOTT의 부서번호를 추출
 SELECT DNO
 FROM EMPLOYEE
 WHERE ENAME = 'SCOTT';
-- STEP 2. 추출된 부서번호와 일치하는 사원의 정보를 추출
SELECT *
FROM EMPLOYEE
WHERE DNO = 20;

SELECT *
FROM EMPLOYEE
WHERE DNO = (SELECT DNO
                               FROM EMPLOYEE
                               WHERE ENAME = 'SCOTT');

-- Question 3. 최소급여를 받는 사원의 이름, 직급, 급여를 추출하시오.
SELECT ENAME, JOB, SALARY
FROM EMPLOYEE
WHERE SALARY = (SELECT MIN(SALARY)
                                      FROM EMPLOYEE);

-- Question 4. 30번 부서에 속한 직원 중 최소급여를 받는 사원의 급여보다 더 큰 급여를 받는 부서의 번호와 최소급여를 추출하시오.
-- STEP 1. 부서번호가 30번인 직원들의 급여 중 최소급여 추출
SELECT MIN(SALARY)
FROM EMPLOYEE
WHERE DNO = 30;
-- STEP 2. 부서별 최소급여를 구한 다음 950보다 큰 부서의 번호와 최소급여를 추출한다.
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

 -- 조건절: WHERE절과 HAVING절(그룹별로 묶어놓은 결과를 기준으로 조건을 담는다)
 
 -- Question 5. 부서별 최소급여를 받는 사원의 사원번호와 이름을 추출하시오.
-- STEP 1. 부서번호와 부서별 최소급여를 추출한다.
SELECT DNO, MIN(SALARY)
FROM EMPLOYEE
GROUP BY DNO; -- 다중행 결과값을 가지고 있다.
-- STEP 2. 다중행 서브쿼리 기술
SELECT ENO, ENAME, DNO
FROM EMPLOYEE
WHERE SALARY IN(950, 800, 1300);

SELECT ENO, ENAME
FROM EMPLOYEE
WHERE SALARY IN (SELECT MIN(SALARY)
                                       FROM EMPLOYEE
                                       GROUP BY DNO);

-- Question 6. 직급이 SALESMAN이 아니면서 급여가 임의의 SALESMAN보다 낮은 사원의 정보를 추출하시오.
-- STEP 1. 직급이 SALESMAN인 사원들의 급여를 추출한다.
SELECT SALARY
FROM EMPLOYEE
WHERE JOB = 'SALESMAN';

-- STEP 2. 직급이 SALESMAN이 아닌 직원들의 급여를 위에 구한 결과값과 비교하여 결과를 추출한다.
SELECT *
FROM EMPLOYEE
WHERE JOB != 'SALESMAN';
-- ANY 임의 값
SELECT *
FROM EMPLOYEE
WHERE JOB != 'SALESMAN' AND SALARY < ANY (SELECT SALARY 
                                                                                               FROM EMPLOYEE 
                                                                                               WHERE JOB = 'SALESMAN');
-- ALL은 전체에서 가장 작은 값이 기준
SELECT *
FROM EMPLOYEE
WHERE JOB != 'SALESMAN' AND SALARY < ALL (SELECT SALARY 
                                                                                               FROM EMPLOYEE 
                                                                                               WHERE JOB = 'SALESMAN')
