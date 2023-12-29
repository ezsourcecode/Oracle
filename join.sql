-- JOIN(조인)
-- 하나 이상의 테이블에 모든 행을 연결하여 추출하는 카디션 곱 조인(컬럼은 더해지고, 레코드는 곱해진다.), 
-- 공통의 컬럼을 이용하여 주어진 조건에 만족하는 레코드만 추출하는 등가조인(EQUI JOIN) =INNER JOIN(내부조인), 비등가조인(NON-EQUI JOIN),
-- 동일한 이름의 테이블을 여러번 참조하는  SELF JOIN, 일반적으로 JOIN 조건에 만족하는 자료만 추출하지만 그렇지 않은 자료를 추출할 때 OUTER JOIN(외부조인)

-- Question 1. 사원번호가 7788인 사원의 이름과 소속 부서명을 추출하시오.
-- 실습용 테이블 목록 확인
SELECT * FROM TAB;
-- 실습용 테이블의 내용을 확인
SELECT * FROM DEPARTMENT; // 부서정보(부서번호, 부서명, 부서위치)
SELECT * FROM EMPLOYEE; // 사원정보(사번, 이름, 직급, 상관, 급여, 보너스, 입사일, 부서번호)
SELECT * FROM SALGRADE; // 급여의 등급(등급, 최저급여, 최고급여)

-- STEP 1. 사원번호가 7788에 해당하는 사원의 정보를 추출
SELECT * FROM EMPLOYEE WHERE ENO = 7788;
SELECT DNO FROM EMPLOYEE WHERE ENO = 7788;
-- STEP 2. 위에서 얻어낸 부서번호를 이용해 부서명을 추출
SELECT DNAME FROM DEPARTMENT WHERE DNO = 20;

-- JOIN: 하나 이상의 테이블을 연결하여 원하는 조건에 만족하는 정보를 추출하는 기능
SELECT ENAME, LOC
FROM EMPLOYEE E, DEPARTMENT D  /* E.DNO = D.DNO 이렇게 공통인수로 조인조건을 주지 않으면 카디시안 곱으로 결과가 나온다.*/
WHERE ENO = 7788 AND E.DNO = D.DNO; /*JOIIN하는 두 테이블에 공통의 이름의 컬럼을 가지고 있을 때 반드시 테이블명을 명시해야 한다.*/

--JOIN 조건에 해당하는 컬럼을 담는 USING 함수
SELECT ENAME, LOC
FROM EMPLOYEE JOIN DEPARTMENT
USING(DNO)
WHERE ENO = 7788;

-- NON-EQUI JOIN: 비등가 조인, <>, !=, ^=, >, >=, <, <= 연산자를 이용한 JOIN
-- Question 2. 사원별로 급여 그리고 급여등급을 추출하시오.
SELECT ENAME, SALARY, GRADE
FROM EMPLOYEE, SALGRADE
WHERE SALARY>= LOSAL AND SALARY <= HISAL;

SELECT ENAME, SALARY, GRADE
FROM EMPLOYEE, SALGRADE
WHERE SALARY BETWEEN LOSAL AND HISAL;

-- Question 3. 사원의 이름과 소속된 부서의 이름 그리고 급여, 급여등급을 추출하시오.
SELECT ENAME, DNAME, SALARY, GRADE
FROM EMPLOYEE E ,DEPARTMENT D, SALGRADE
WHERE E.DNO = D.DNO AND SALARY BETWEEN LOSAL AND HISAL;

-- SELF-JOIN: 자기 자신과 조인을 수행하는 JOIN.
-- 조인 대상 테이블이 자기 자신이라는 것만 제외하면 EQUI JOIN과 동일하다.
-- Question 4. 사원의 이름과 직속상관의 이름을 추출 하시오.
-- MANAGER 컬럼의 해당 사원의 직속상관의 사원번호를 나타낸다.
SELECT E.ENAME 사원이름, M.ENAME 상관이름
FROM EMPLOYEE E, EMPLOYEE M
WHERE E.MANAGER = M.ENO;

SELECT E.ENAME 사원이름, M.ENAME 상관이름
FROM EMPLOYEE E, EMPLOYEE M
WHERE E.MANAGER = M.ENO(+); //RIGHT OUTER JOIN 널값도 나오게 함

-- TEST 1. SCOTT 사원의 부서번호와 부서명을 추출하시오.
SELECT E.DNO, LOC
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DNO = D.DNO AND ENAME = 'SCOTT';

-- TEST 2. 사원의 이름과 소속된 부서명 그리고 부서의 위치를 추출하시오.
SELECT ENAME, DNAME, LOC
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DNO = D.DNO;

-- TEST 3. 부서번호가 10에 해당되는 사원들의 직급을 추출하시오.
SELECT ENAME, JOB
FROM EMPLOYEE
WHERE DNO = 10;

-- TEST 4. 커미션을 받는 사원의 이름과 부서명, 부서지역명을 추출하시오.
SELECT ENAME, DNAME, LOC, COMMISSION
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DNO = D.DNO AND COMMISSION IS NOT NULL;

-- TEST 5. 사원명에 'A'가 포함된 사원의 이름과 부서명을 추출하시오.
SELECT ENAME, DNAME, LOC
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DNO = D.DNO AND ENAME LIKE '%A%';

-- TEST 6. NEW YORK에서 근무하는 사원의 이름과 직급, 부서번호, 부서명을 추출하시오.
SELECT ENAME, JOB, E.DNO, DNAME
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DNO = D.DNO AND LOC = 'NEW YORK';

-- TEST 7. 사원이름, 사원번호, 상관이름, 상관번호를 추출하시오.
SELECT E.ENAME, E.ENO, M.ENAME, M.ENO
FROM EMPLOYEE E, EMPLOYEE M
WHERE E.MANAGER = M.ENO(+);
