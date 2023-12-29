-- 함수(Function): 사용자 정의 함수와 내장함수
--함수는 반복적으로 수행하는 기능이나 명령어를 하나의 이름으로 묶어서 사용하도록 만들어진 명령어 집단
--SQL 함수: 숫자함수, 문자함수, 날짜함수, 형변환함수, NVL etc.

-- 1. DUAL 테이블: 한 행의 결과값을 추출하기 위한 테이블, Oracle에서 만들어놓은 가상 테이블
-- 2. 숫자함수: 숫자 데이터를 처리하기 위한 함수
-- ABS(숫자데이터): 절대값을 구하는 함수
-- Question 1. -7의 절대값을 추출하시오.
SELECT -7, ABS(-7)
FROM DUAL;
-- AS: 별칭
SELECT -7 AS "데이터", ABS(-7) "절대값"
FROM DUAL;

-- FLOOR(숫자데이터): 소수점 아래를 버리는 함수
-- Question2. 42.19547 데이터의 소수점 아래를 지우고 추출하시오.
SELECT 42.69547, FLOOR(42.69547)
FROM DUAL;

--ROUND(숫자데이터, 자리수): 소수점 아래를 버리는 함수
SELECT 42.69547, ROUND(42.69547)
FROM DUAL;

--ROUND(숫자데이터, 자리수): 소수점 아래를 버리는 함수
-- 자릿수를 생략하면 0으로 간주한다.
-- 자릿수가 음수일 경우 일단위 -> 십단위 -> 백단위 순으로 반올림한다.
-- Question 3. 34.56789 숫자를 -1의 자리에서 반올림하여 추출하시오.
SELECT 34.56789, ROUND(34.56789 ,-1), ROUND(34.56789 ,-2)
FROM DUAL;

-- MOD(숫자데이터, 나눌수): 나머지를 추출하는 수
SELECT 27, MOD(27, 2), MOD(27, 5), MOD(27, 7)
FROM DUAL;

-- 3. 문자함수: 문자 데이터를 처리하는 함수
-- UPPER(문자데이터): 대문자로 변환하는 함수
SELECT 'Welcome to Oracle' "원본데이터", UPPER('Welcome to Oracle') "UPPER 적용 후"
FROM DUAL;

-- LOWER(문자데이터): 소문자로 변환하는 함수
SELECT 'Welcome to Oracle' "원본데이터", LOWER('Welcome to Oracle') "LOWER 적용 후"
FROM DUAL;

-- INITCAP(문자데이터): 이니셜만 대문자로 변환하는 함수, 첫 글자만 대문자로 변환하는 함수
SELECT 'welcome to oracle', INITCAP('welcome to oracle')
FROM DUAL;

-- LENGTH(문자데이터): 문자 길이를 추출하는 함수
-- 문자: 숫자, 영문자, 특수문자/한글, 한자
SELECT LENGTH('ORACLE'), LENGTH('오라클')
FROM DUAL;

-- LENGTHB(문자데이터): 문자의 바이트 길이를 추출하는 함수
-- 문자: 숫자, 영문자, 특수문자/한글, 한자
SELECT LENGTHB('ORACLE'), LENGTHB('오라클') //한글이 유니코드 처리됨(UNICODE - 한 글자당 3BYTE)
FROM DUAL;

--INSTR(문자데이터, 문자): 특정 문자의 위치를 추출하는 함수.
-- 'Welcome to Oracle'에서 'O'가 저장된 위치 값을 추출하는 쿼리문을 작성하시오.
SELECT INSTR('Welcome to Oracle', 'O')
FROM DUAL;

-- SUBSTR/SUBSTRB
-- SUBSTR(문자데이터, 시작위치, 글자수): 문자열의 시작위치에서 글자수만큼 추출하는 함수
-- 인덱스 4부터 시작해서 문자 3개를 추출하는 쿼리문을 작성하시오.
-- 오라클이나 R같은 프로그래밍 언어가 아닌 것의 인덱스의 시작값은 0이 아닌 1부터 시작한다.
SELECT SUBSTR('Welcome to Oracle', 4, 3)
FROM DUAL;
-- Question 4. 사원정보를 가지고 있는 테이블 EMPLOYEE에서 직원의 입사년도와 입사한 달만 추출하는 쿼리문을 작성하시오.
-- 직원이름과 입사년도, 입사월만 추출하도록 구현하시오. (예: 1980 12)
SELECT ENAME,19 || SUBSTR(HIREDATE, 1, 2) "년도", SUBSTR(HIREDATE, 4, 2) "월"
FROM EMPLOYEE;

-- Question 5. 위 코드를 활용하여 9월에 입사한 직원만 추출하는 쿼리문을 기술하시오.
SELECT ENAME,19 || SUBSTR(HIREDATE, 1, 2) "년도", SUBSTR(HIREDATE, 4, 2) "월"
FROM EMPLOYEE
WHERE SUBSTR(HIREDATE, 4, 2) = '09';

-- 4. 날짜함수: DATE형에 사용하는 함수
-- 결과 값응로 날짜 or 기간을 얻는다. 이때 기간은 주로 일단위로 계산된다.
-- 날짜 + 숫자, 날짜 - 숫자, 날짜 - 날짜

--SYSDATE: 현재 시스템에 등록된 날짜를 반환하는 함수, 시스템의 현재 날짜를 추출한다.
SELECT SYSDATE
FROM DUAL;

-- Question 6. SYSDATE를 활용하여 어제, 오늘, 내일 날짜를 추출하는 쿼리문을 구현하시오.
SELECT SYSDATE -1 어제, SYSDATE 오늘, SYSDATE +1 내일
FROM DUAL;

--MONTHS_BETWEEN: 두 날짜 사이의 개월 수를 구하는 함수
-- Question 7. 직원들의 근무개월수를 추출하는 쿼리문을 기술하시오.
SELECT ENAME, SYSDATE, HIREDATE, FLOOR(MONTHS_BETWEEN(SYSDATE, HIREDATE)) 근무개월수
FROM EMPLOYEE;

-- ADD_MONTHS: 특정 개월 수를 더한 날짜를 추출하는 함수
-- Question 8. 직원들의 입사 4개월 후의 날짜를 추출하시오.
SELECT ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 4)  "입사 4개월 후"
FROM EMPLOYEE;

-- 5. 형변환함수(숫자형, 문자형, 날짜형)
-- Number <=> Character(VARCHAR2, CHAR) / Character <=> Date
-- TO_NUMBER(), TO_CHAR(), TO_DATE()
-- 일반적으로 날짜를 문자데이터 형태로 변환하여 표시하는 경우가 많다.
-- YYYY/YY, MM, MON, DAY

--TO_CHAR(): 날짜 or 숫자를 문자형으로 변환하는 함수
SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD')
FROM DUAL;

-- Question 9. 직원들의 입사일을 년도-월-일 요일로 추출되도록 구현하시오.
SELECT HIREDATE, TO_CHAR(HIREDATE, 'YYYY-MM-DD DY', 'NLS_DATE_LANGUAGE = AMERICAN')
FROM EMPLOYEE;

-- SELECT 확장형: 그룹함수(GROUP BY)와 그룹별 정렬(HAVING)
-- 그룹함수: 하나 이상의 행을 그룹으로 묶어서 연산을 수행하고, 하나의 결과를 추출하는 함수
-- 단일행 함수: 하나의 결과만 추출하는 함수
-- 다중행 함수: 여러 개의 결과를 추출하는 함수, 별도의 함수를 사용하여 처리한다.

-- SUM(컬럼명): 해당 컬럼의 값들에 총합을 추출하는 함수
-- Question 10. 직원들의 급여의 총합을 추출하되, 천 단위 이하를 반올림하여 추출하도록 구현하시오.
SELECT ENAME, SALARY, ROUND(SALARY, -3)
FROM EMPLOYEE;

SELECT SUM(SALARY)
FROM EMPLOYEE;

-- Question 11. 직원들의 COMMISSION 총합을 추출하도록 구현하시오.
SELECT SUM(COMMISSION)
FROM EMPLOYEE;

--AVG(컬럼명): 해당 컬럼의 값들의 평균을 추출하는 함수
-- Question 12. 직원 급여의 총 평균을 추출하시오.
SELECT ROUND(AVG(SALARY), 2)
FROM EMPLOYEE;

-- MAX /MIN(컬럼명)
-- Question 13. 직원들의 급여 중 가장 높은 급여와 가장 낮은 급여를 추출하도록 구현하시오.
SELECT MAX(SALARY), MIN(SALARY)
FROM EMPLOYEE;

-- Question 14. 가장 높은 급여를 받는 직원을 추출하도록 구현하시오.
SELECT ENAME, SALARY
FROM EMPLOYEE
WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEE);

--COUNT(컬럼명): 해당 컬럼의 개수를 반환하는 함수, NULL값은 계산하지 않는다.
-- Question 15. 직원의 수를 추출하시오.
SELECT COUNT(*)
FROM EMPLOYEE;

SELECT COUNT(COMMISSION)
FROM EMPLOYEE;

-- Question 16. 담당업무(JOB)의 개수를 추출하시오.
SELECT COUNT(DISTINCT JOB)
FROM EMPLOYEE;

-- Question 17. 부서의 개수를 추출하시오.
SELECT COUNT(DISTINCT DNO)
FROM EMPLOYEE;

-- GROUP BY절: 특정 컬럼을 기준으로 그룹화하여 계산을 수행한다.
-- 그룹함수와 함께 사용한다.
-- Question 18. 부서별 직원의 급여의 총합을 추출하시오.
SELECT DNO, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DNO;

-- Question 19. 직급별 급여의 총합과 평균을 추출하되, 해당 직급도 표시하시오.
SELECT JOB, SUM(SALARY), ROUND(AVG(SALARY), 1)
FROM EMPLOYEE
GROUP BY JOB;

-- Question 20. 각 부서별 인원수와 보너스를 받는 직원의 수를 추출하시오.
SELECT DNO, COUNT(DNO), COUNT(COMMISSION)
FROM EMPLOYEE
GROUP BY DNO;

SELECT * FROM DEPARTMENT;

-- HAVING절: GROUP BY에 의해 생성된 결과에 조건을 담을 때 사용한다.
--Question 21. 부서번호가 30번에 해당하는 직원들의 직급별 급여의 합을 추출하시오.
SELECT JOB, SUM(SALARY)
FROM EMPLOYEE
WHERE DNO = 30
GROUP BY JOB;

-- Question 22. 부서별 평균 급여가 2000 이상인 부서의 번호와 평균 급여를 추출하시오.
SELECT DNO, ROUND( AVG(SALARY), 1)
FROM EMPLOYEE
GROUP BY DNO
HAVING AVG(SALARY) >= 2000;

-- Question 23. 부서별 최대급여와 최소급여를 추출하되 최대급여가 2900이상인 부서만 추출하시오
SELECT DNO, MAX(SALARY), MIN(SALARY)
FROM EMPLOYEE
GROUP BY DNO
HAVING MAX(SALARY) >= 2900;

-- 조인(JOIN): 하나 이상의 테이블을 묶어 마치 하나의 테이블인 것처럼 사용하는 기능
-- 데이터베이스는 하나의 테이블에 모든 데이터를 담지 않고 여러 테이블로 나누어 분산처리한다. 이떄 각 테이블끼리 특정 규칙이나 관계가 있도록 설계된다.
-- 여러 테이블에 흩어져 있는 데이터를 사용자가 원하는 데이터를 모두 찾아 추출하기 위해 여러 테이블을 조회해야 한다. 그래서 등장한 기능이 JOIN이다.

-- Question 24. SCOTT의 부서명을 추출하시오.
-- STEP 1. 
SELECT DNO
FROM EMPLOYEE
WHERE ENAME = 'SCOTT';
-- STEP 2. 20번에 해당하는 부서명을 추출
SELECT DNAME
FROM DEPARTMENT
WHERE DNO = 20;

-- 조인의 종류: CARTESIAN PRODUCT(카디시안 곱), EQUI JOIN, NON-EQUI JOIN, SELF JOIN, OUTER JOIN
-- CARTESIAN PRODUCT(카디시안 곱): 서로 다른 두 개의 테이블을 연결할 때 특정 컬럼에 의해 조인되지 않고 모든 데이터를 결과로 나타내는 경우
-- 결과: 컬럼 수는 더해지고, 행의 수는 곱해진 결과를 출력한다.
SELECT *
FROM EMPLOYEE; // 직원정보(행의 수 14, 컬럼 수 8)
SELECT *
FROM DEPARTMENT; // 부서정보(행의 수 4 컬럼 수 3)

SELECT *
FROM EMPLOYEE, DEPARTMENT; -- JOIN  매개체 없이 묶으면 그냥 다 곱해지는 카디시안 곱이 나옴.(행의 수 56 컬럼 수 11)

-- EQUI-JOIN:  연결할 두 데이터에 공통적으로 존재하는 컬럼의 값이 일치하는 행만 연결하여 결과를 생성하는 조인. INNER JOIN
-- 비교연산자: =, <>, !=, ^=, >, >=, <, <=
-- Question 25. 직원정보를 추출하되 각 사원의 소속부서에 대한 정보를 함께 추출되도록 구현하시오.
SELECT *
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DNO = D.DNO;

-- Question 26. SCOTT의 부서명을 추출하시오.
SELECT E.DNO, ENAME, DNAME
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DNO = D.DNO AND ENAME = 'SCOTT';

-- NON-EQUI JOIN: 동일한 컬럼이 없이 다른 조건을 사용하여 조인할 때 쓰인다.
SELECT * 
FROM TAB;
SELECT *
FROM SALGRADE;

-- Question 27. 각 직원의 급여가 몇 등급에 해당하는지를 추출하시오. 단, 직원이름, 급여, 등급이 표시되도록 구현할 것.
SELECT ENAME, SALARY, GRADE
FROM EMPLOYEE, SALGRADE
WHERE SALARY BETWEEN LOSAL AND HISAL;

-- Question 28. 직원의 이름, 소속부서명, 급여 등급을 추출하시오.
SELECT E.ENAME, D.DNAME, S.GRADE
FROM EMPLOYEE E, DEPARTMENT D, SALGRADE S
WHERE E.DNO = D.DNO AND E.SALARY BETWEEN S.LOSAL AND S.HISAL;

-- SELF-JOIN: 자기 자신과의 조인을 수행하는 기법
SELECT *
FROM EMPLOYEE;

-- Question 29. ALLEN의 직속상관의 이름을 추출하시오.
-- STEP 1. ALLEN의 MANAGER 값을 얻어온다.
SELECT MANAGER
FROM EMPLOYEE
WHERE ENAME = 'ALLEN';
-- STEP 2. MANAGER의 값과 일치하는 ENO를 가지고 있는 사원의 이름을 추출한다.
SELECT ENAME
FROM EMPLOYEE
WHERE ENO =7698 ;

SELECT MAG.ENAME
FROM EMPLOYEE EMP, EMPLOYEE MAG 
WHERE EMP.ENAME = 'ALLEN' AND MAG.ENO = EMP.MANAGER;

-- Question 30. 직원의 이름과 직속상관의 이름을 추출하는 프로그램을 구현하시오.
SELECT EMP.ENAME 직원명, MAG.ENAME 직속상관명
FROM EMPLOYEE EMP, EMPLOYEE MAG
WHERE EMP.MANAGER = MAG.ENO; // KING은 매니저가 없어 이 조건을 만족하지 못해 출력이 안 됨.

-- OUTER JOIN: 조인 조건에 만족하지 않는 값도 추출하는 기법

SELECT EMP.ENAME 직원명, MAG.ENAME 직속상관명
FROM EMPLOYEE EMP, EMPLOYEE MAG
WHERE EMP.MANAGER = MAG.ENO(+);

-- 서브쿼리(SUB QUERY): 쿼리 안에 또 다른 쿼리를 담아서 표현하는 기ㅏ법
-- 하나의 SELECT 구문내에 포함된 또 다른 SELECT 문장을 뜻한다.
-- 비교연산자의 오른쪽에 기술해야 하과, 반드시 괄호로 묶어줘야 한다.
-- 메인쿼리가 실행되기 전에 먼저 한 번만 실행된다.
-- 종류: 단일행 서브쿼리와 다중행 서브쿼리

-- 단일행 서브 쿼리: 서브쿼리의 실행결과가 오직 하나의 행만 반환된다.
-- 비교연산자: =, <>, !=, ^=, >, >=, <, <=

-- Question 31. SCOTT의 부서명을 추출하시오.
-- EQUI JOIN 실행예시
SELECT DNAME
FROM EMPLOYEE EMP, DEPARTMENT DEPT
WHERE EMP.ENAME = 'SCOTT' AND EMP.DNO = DEPT.DNO;

--서브쿼리
SELECT DNAME
FROM DEPARTMENT
WHERE DNO = (SELECT DNO
                                FROM EMPLOYEE
                                WHERE ENAME = 'SCOTT');

-- Question 32. 직원들의 평균 급여보다 더 적은 급여를 받는 사원의 이름과 급여를 추출하시오.
SELECT ENAME, SALARY
FROM EMPLOYEE
WHERE SALARY < (SELECT ROUND(AVG(SALARY), 1)
                                        FROM EMPLOYEE);

-- Question 33. SCOTT과 급여가 동일하거나 더 많이 받는 사원의 이름과 급여를 추출하시오.
SELECT ENAME, SALARY
FROM EMPLOYEE
WHERE SALARY >= (SELECT SALARY
                                        FROM EMPLOYEE
                                        WHERE ENAME = 'SCOTT');
                                        
-- Question 34. 부서번호가 20번에 해당하는 사원 중에 전체 사원 급여의 평균보다 높은 급여를 받는 사원의 이름, 급여, 부서명을 추출하시오.
SELECT ENAME, SALARY, DNAME
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DNO = D. DNO AND  E.DNO = 20 AND SALARY > (SELECT AVG(SALARY)
                                                                                                                 FROM EMPLOYEE);
-- WHERE에 E.DNO = D. DNO 이 조인 조건을 빠트려서 카디시안 곱이 나옴

-- 다중행 서브쿼리: 서브쿼리의 결과값이 하나 이상에 해당하는 쿼리
-- 반드시 다중행 연산자와 함께 사용해야 한다.
-- IN: 메인 쿼리의 비교 조건이 서브 쿼리의 결과 중에서 어느 것 하날라도 일치하면 참이 되는 연산자
-- Question 35. 급여가 3000 이상인 직원과 동일한 부서에서 근무하는 사원들의  이름, 급여, 부서번호를 추출하시오.
-- STEP 1. 급여가 3000 이상인 직원의 부서번호를 추출한다.
SELECT DNO
FROM EMPLOYEE
WHERE SALARY >= 3000);
-- STEP 2. 부서번호가 10이거나 20번에 해당하는 직원 중 급여가 3000 이상인 직원에 정보를 추출한다.
SELECT ENAME, SALARY, DNO
FROM EMPLOYEE
WHERE DNO = 10 OR DNO = 20;
-- 부서번호가 10이거나 20번에 해당하는 사원의 정보를 추출하시오.
SELECT *
FROM EMPLOYEE
WHERE DNO IN(10, 20);

SELECT ENAME, SALARY, DNO
FROM EMPLOYEE
WHERE DNO IN  (SELECT DNO
                                     FROM EMPLOYEE
                                     WHERE SALARY >= 3000);

-- ANY, SOME: 메인 쿼리의 비교 조건이 서브 쿼리의 검색 결과와 하나 이상이 일치하면 참이 되는 연산자
-- < ANY: 찾아진 값에 대해서 하나라도 크면 참이 되는 연산자, 최소값을 반환하는 것과 같은 의미
-- >ANY: 찾아진 값에 대해서 하나라도 작으면 참이 되는 연산자, 최대값을 반화하는 것과 같은 의미
-- Question 36. 부서번호가 30번인 사원 중 급여가 가장 작은 사원보다 높은 급여를 받는 사원의 이름과 급여를 추출하시오.
-- STEP 1. 부서번호가 30번에 해당하는 사원 추출
SELECT ENAME, SALARY
FROM EMPLOYEE
WHERE DNO = 30;
-- STEP 2. 급여가 950보다 높은 사원의 이름과 급여 추출
SELECT ENAME, SALARY
FROM EMPLOYEE
WHERE SALARY >  950;

-- 950보다 큰 값은 다 나옴
SELECT ENAME, SALARY
FROM EMPLOYEE
WHERE SALARY >  ANY(SELECT SALARY
                                               FROM EMPLOYEE
                                               WHERE DNO = 30);
--부서번호 30번에 속한 사람들보다 급여가 작으면 출력되라
SELECT ENAME, SALARY
FROM EMPLOYEE
WHERE SALARY <  ANY(SELECT SALARY
                                               FROM EMPLOYEE
                                               WHERE DNO = 30);

-- Question 37. 부서번호가 30번인 사원들 중에 급여를 가장 많이 받는 사원보다 더 많은 급여를 받는 사원의 이름과 급여를 추출하시오.
-- STEP 1. 부서번호가 30번에 해당하는 사원 추출
SELECT ENAME, SALARY
FROM EMPLOYEE
WHERE DNO = 30;
-- STEP 2. 급여가 2850보다 높은 사원의 이름과 급여 추출
SELECT ENAME, SALARY
FROM EMPLOYEE
WHERE SALARY >  2850;
-- 다중행
SELECT ENAME, SALARY
FROM EMPLOYEE
WHERE SALARY > ALL(SELECT SALARY
                                               FROM EMPLOYEE
                                               WHERE DNO = 30);
-- 단일행
SELECT ENAME, SALARY
FROM EMPLOYEE
WHERE SALARY > (SELECT MAX(SALARY)
                                               FROM EMPLOYEE
                                               WHERE DNO = 30);

