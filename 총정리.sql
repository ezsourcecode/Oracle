-- 1. 데이터 타입: 오라클에서 지원하는 자료형
-- CHAR(SIZE): SIZE의 크기와 고정길이 문자 데이터, 입력된 자료의 길이와 상관없이 정해진 길이만큼 저장 영역을 차지한다.
-- VARCHAR2(SIZE): 가변길이 문자 데이터
-- NUMBER(P, S): 정수(P), 소수점 이하(실수, S)
-- DATE: 날짜 형식의 데이터, TIMESTAMP(DATE의 확장된 개념)

-- 2. 오라클 데이터베이스의 접속
-- SQL*PLUS와 SQL 명령어(DDL, DML, DCL)
-- 사용자 계정: 관리자(SYSTEM, SYS), 일반 사용자 계정(SCOTT)
-- 오라클 접속: SQLPLUS 계정ID / 계정PW
-- 현재 계정 확인: SHOW USER
SHOW USER
-- 접속 명령: CONNECT(=CONN)
CONN SYSTEM/1234

-- 테이블 구조: DECS 테이블명
DESC EMPLOYEE

-- 테이블 조회/검색: SELECT
-- SELECT [DISTINCT] 컬럼명 [* = ALL] [AS = ALIAS]
-- FROM 테이블명
-- [WHERE 조건식]
-- [ORDER BY 컬럼명 [ASC/DESC]]
--- [GROUP BY 컬럼명]
-- [HAVING 그룹 조건식]

-- 수식: 산술식, 관계식(비교/판단), 논리식
-- 산술식(+, -, *, /): 숫자 OR 날짜 데이터만 사용 가능
-- Question 1. 직원테이블(EMPLOYEE) 컬럼명 SALARY는 급여를 뜻한다. 각 직원의 연봉을 계산하여 사원번호, 이름, 급여, 연봉이 추출되도록 쿼리문을 기술하시오.
SELECT ENO, ENAME, SALARY, SALARY*12  "연봉"
FROM EMPLOYEE;

-- 연봉은 급여와 보너스를 이용하여 계산할 것
-- NVL(COMMISSION, 0): 커미션 값에 NULL이 있으면 0으로 치환
SELECT ENO, ENAME, SALARY, SALARY*12 + NVL(COMMISSION, 0)  "연봉" -- 산술식은 NULL이 계산되지 않는다.
FROM EMPLOYEE;

-- 비교연산자(관계연산자): =(같다), !=, <>, ^=(같지 않다), >, >=, <, <=
-- Q1. 급여가 1500이상인 사원의 정보 추출
SELECT *
FROM EMPLOYEE
WHERE SALARY >= 1500;
-- Q2. 부서번호가 10인 사원의 정보 추출
SELECT *
FROM EMPLOYEE
WHERE DNO = 10;
-- Q3. SCOTT 사원의 정보 추출
SELECT *
FROM EMPLOYEE
WHERE ENAME = 'SCOTT';
-- Q4. 1981년 전에 입사한 직원의 정보 추출
SELECT *
FROM EMPLOYEE
WHERE HIREDATE < '1981-01-01';

-- 논리연산자: 하나 이상의 수식을 연결하여 계산할 때
-- AND: 모든 조건이 다 참이어야 참이 된다. 모두, ~ 이고
--OR: 조건 중 하나라도 참이면 결과가 참이 된다. 이거나, 또는, 어느거 하나라도
-- NOT: 단항연산자
-- Q1. 부서번호가 10이고, 직급이 'MANAGER'인 사원의 정보 추출
SELECT *
FROM EMPLOYEE
WHERE DNO = 10 AND JOB = 'MANAGER';
-- Q2. 부서번호가 10이거나 직급이 'MANAGER'인 사원의 정보 추출
SELECT *
FROM EMPLOYEE
WHERE DNO = 10 OR JOB = 'MANAGER';
-- Q3. 부서번호가 10이 아닌 사원의 정보 추출
SELECT *
FROM EMPLOYEE
WHERE DNO != 10;
-- Q4. 급여가 1000 ~ 1500 사이인 사원의 정보 추출
SELECT *
FROM EMPLOYEE
WHERE SALARY BETWEEN 1000 AND 1500;
-- Q5. 급여가 1000 미만이거나 1500 초과인 사원의 정보 추출
SELECT *
FROM EMPLOYEE
WHERE SALARY NOT BETWEEN 1000 AND 1500;
-- Q6. 커미션이 300이거나 500이거나 1400인 사원의 정보 추출
SELECT *
FROM EMPLOYEE
WHERE COMMISSION IN(300, 500, 1400);

-- LIKE 연산자: 와일드카드 문자(대체문자, 만능문자) _, %
-- Q1. 사원의 이름이 'F'로 시작하는 사원의 정보 추출
SELECT *
FROM EMPLOYEE
WHERE ENAME LIKE 'F%';

SELECT *
FROM EMPLOYEE
WHERE  SUBSTR(ENAME, 1, 1) = 'F';

SELECT *
FROM EMPLOYEE
WHERE INSTR(ENAME, 'F') = 1 ;
-- Q2. 이름에 'M'이 포함된 사원의 정보 추출
SELECT *
FROM EMPLOYEE
WHERE ENAME LIKE'%M%' ;

SELECT *
FROM EMPLOYEE
WHERE INSTR(ENAME, 'M') ! = 0 ; -- ^=, <> 동일. 변칙적인 방법
-- Q3. 이름이 'N'으로 끝나는 사원의 정보 추출
SELECT *
FROM EMPLOYEE
WHERE ENAME LIKE '%N';

SELECT *
FROM EMPLOYEE
WHERE  SUBSTR(ENAME, -1, 1) = 'N';
-- Q4. 이름의 두 번째 글자가 'A'인 사원의 정보 추출
SELECT *
FROM EMPLOYEE
WHERE ENAME LIKE '_A%';

SELECT *
FROM EMPLOYEE
WHERE  SUBSTR(ENAME, 2, 1) = 'A';
-- Q5. 이름의 세 번째 글자가 'A'인 사원의 정보 추출
SELECT *
FROM EMPLOYEE
WHERE ENAME LIKE '__A%';

SELECT *
FROM EMPLOYEE
WHERE  SUBSTR(ENAME, 3, 1) = 'A';
-- Q6. 이름에 'A'를 포함하지 않는 사원의 정보 추출
SELECT *
FROM EMPLOYEE
WHERE ENAME NOT LIKE '%A%';

-- IS NULL / IS NOT NULL
SELECT ENAME, COMMISSION
FROM EMPLOYEE;
-- 보너스를 받는 직원의 정보만 추출
SELECT ENAME, COMMISSION
FROM EMPLOYEE
WHERE COMMISSION IS NOT NULL;

--ORDER BY: 주어진 컬럼을 기준으로 오름차순(ASC)/ 내림차순(DESC) 정렬하여 추출할 때
-- Q1. 직원의 급여를 기준으로 오름차순 정렬하여 추출하시오.
SELECT *
FROM EMPLOYEE
ORDER BY SALARY ;
-- Q2. 직원의 부서번호를 기준으로 오름차순, 정렬 결과에서 급여를 기준으로 내림차순하여 정렬하여 추출하시오.
SELECT *
FROM EMPLOYEE
ORDER BY DNO, SALARY DESC ;
-- Q3. 가장 최근에 입사한 직원순으로 추출하시오.
SELECT *
FROM EMPLOYEE
ORDER BY HIREDATE DESC;

-- 문자 함수 -문자(한글자), 문자열(STRING, 단어) => a(97), A(65)
-- UPPER(문자데이터), LOWER(문자데이터), INITCAP(문자데이터)
-- LENGTH(문자데이터), LENGHB(문자데이터)
-- CONCAT = ||
-- SUBSTR(문자데이터, 시작위치, 글자수), SUBSTRB
-- INSTR(문자데이터, 글자)
-- LPAD(LEFT FADDING): 왼쪽에 생긴 공백의 크기만큼 특정 문자로 채우는 함수
-- RPAD(RIGHT PADDING): 오른쪽에 생긴 공백의 크기만큼 특정 문자로 채우는 함수

SELECT * FROM EMPLOYEE;
SELECT LPAD(SALARY,10, ' ')
FROM EMPLOYEE;

-- TRIM: 공백을 제거하는 함수
-- LTRIM(문자데이터): 왼쪽 공백 제거
-- RTRIM(문자데이터):
SELECT TRIM('   ORACLE') FROM DUAL;

-- 그룹함수: 하나 이상의 행을 묶어서 연산을 수행하는 함수, 하나의 결과를 추출한다.
-- SUM(컬럼명): 해당 컬럼 값들의 총합을 구하는 함수
-- AVG(컬럼명): 
-- MAX(컬럼명)/MIN(컬럼명)
-- COUNT(컬럼명): 해당 컬럼에 NULL 값이 아닌 행의 수를 반환, COUNT(*): 해당 테이블의 레코드 수를 반환
SELECT COUNT(*)
FROM EMPLOYEE;
SELECT COUNT(COMMISSION)
FROM EMPLOYEE;

-- GROUP BY절 : 특정 컬럼을 기준으로 그룹화하는 것

-- 사원테이블의 직원급여의 총합을 추출하시오.
SELECT SUM(SALARY)
FROM EMPLOYEE;

-- 부서별 급여의 총합을 추출하되, 부서번호와 급여의 총합이 표시되도록 하시오.
SELECT DNO, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DNO;

-- 소속부서별 평균 급여를 추출하시오.
SELECT DNO, ROUND(AVG(SALARY), 2)
FROM EMPLOYEE
GROUP BY DNO;

-- 부서별 사원 수와 커미션을 받는 사원의 수가 추출되도록 쿼리문을 작성하시오.
-- 부서번호/ 부서별 사원 수 /커미션 받는 수
SELECT DNO, COUNT(*), COUNT(COMMISSION)
FROM EMPLOYEE
GROUP BY DNO;

-- 직군(JOB)의 종류와 개수를 추출하시오.
SELECT JOB, COUNT(JOB)
FROM EMPLOYEE
GROUP BY JOB;

SELECT COUNT(DISTINCT JOB) FROM EMPLOYEE;
SELECT DISTINCT JOB FROM EMPLOYEE;

-- HAVING절: GROUP BY절에 의해 생성된 결과값을 대상으로 원하는 조건에 만족하는 자료만 추출할 때
-- Q1. 부서별 평균 급여가 2000이상인 부서의 번호와 부서별 평균 급여를 추출하시오.
SELECT  DNO, ROUND(AVG(SALARY), 2)
FROM EMPLOYEE
GROUP BY DNO
HAVING AVG(SALARY) >= 2000;

SELECT  E.DNO, DNAME, ROUND(AVG(SALARY), 2)
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DNO = D.DNO
GROUP BY E.DNO, DNAME
HAVING AVG(SALARY) >= 2000;


-- Q2. 부서별 최대급여와 최소급여를 추출하되, 최대급여가 2900이상인 부서만 추출하시오.
SELECT DNO, MAX(SALARY), MIN(SALARY)
FROM EMPLOYEE
GROUP BY DNO
HAVING MAX(SALARY) >= 2900;

-- 다중그룹 - 소계
SELECT DNO, JOB, COUNT(*), SUM(SALARY)
FROM EMPLOYEE
GROUP BY DNO, JOB
ORDER BY DNO, JOB;

-- 조인(JOIN): 여러 테이블을 연결하여 사용자가 원하는 정보를 추출하도록 도와주는 기능
-- 카디시안 곱, EQUI(등가조인), NON-EQUI(비등가조인), SEL, OUTER
-- 실무에서는 내부조인(EQUI JOIN - LEFT INNER JOIN, RIGHT INNER JOIN)과 외부조인(OUTER JOIN)
-- INNER JOIN: 내부 조인, 특정 컬럼을 기준으로 정확하게 일치하는 행들만 추출하는 JOIN(교집합)

-- 내부조인 = EQUI JOIN
SELECT *
FROM EMPLOYEE E INNER JOIN DEPARTMENT D
ON E.DNO = D.DNO;

-- 외부조인 = OUTER JOIN, 일치하지 않는 값도 추출
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

INSERT INTO FOOD_A VALUES(1, '돈까스');
INSERT INTO FOOD_A VALUES(2, '삼겹살');
INSERT INTO FOOD_A VALUES(3, '초밥');
INSERT INTO FOOD_A VALUES(4, '곱창전골');

INSERT INTO FOOD_B VALUES(1, '초밥');
INSERT INTO FOOD_B VALUES(2, '돈까스');
INSERT INTO FOOD_B VALUES(3, '칼국수');
INSERT INTO FOOD_B VALUES(4, '햄버거');

SELECT * FROM FOOD_A;
SELECT * FROM FOOD_B;

-- INNER JOIN: JOIN하는 두 테이블에 정확하게 일치하는 값만 추출
SELECT *
FROM FOOD_A, FOOD_B
WHERE FOOD_A.FNAME  = FOOD_B.FNAME;

SELECT *
FROM FOOD_A A INNER JOIN  FOOD_B B
ON A.FNAME = B.FNAME;

-- OUTER JOIN: LEFT OUTER JOIN, A LEFT OUTER JOIN B, A는 모두 추출되고, B는 A에 존재하는(매핑되는) 행등만 추출
SELECT *
FROM FOOD_A A LEFT OUTER JOIN  FOOD_B B
ON A.FNAME = B.FNAME;

-- LEFT OUTER JOIN -: LEFT ONLY, A LEFT OUTER JOIN B ~ WHERE B.ID IS NULL
-- A 전체를 추출하되, B와 일치하는 값이 있다면 그것을 제외하고 추출
SELECT *
FROM FOOD_A A LEFT OUTER JOIN  FOOD_B B 
ON A.FNAME = B.FNAME
WHERE B.ID IS NULL;

-- RIGHT OUTER JOIN - : RIGHT ONLY
SELECT * 
FROM FOOD_A A RIGHT OUTER JOIN FOOD_B B
ON A.FNAME = B.FNAME
WHERE A.ID IS NULL;

-- Q1. EQUI JOIN을 이용하여 SCOTT 사원의 부서번호와 부서명을 추출하시오.
SELECT ENAME, E.DNO, DNAME
FROM EMPLOYEE E , DEPARTMENT D
WHERE E.DNO = D.DNO AND ENAME = 'SCOTT';

SELECT E.DNO, DAME
FROM EMPLOYEE E INNER JOIN DEPARTMENT D
ON E.DNO = D.DNO;
-- Q2. INNER JOIN과 ON 연산자를 사용하여 사원이름과 해당 사원의 소속된 부서명 그리고 부서의 지역명을 추출하시오.
SELECT ENAME, DNAME, LOC
FROM EMPLOYEE E INNER JOIN DEPARTMENT D
ON E.DNO = D.DNO;

SELECT ENAME, DNAME, LOC
FROM EMPLOYEE E INNER JOIN DEPARTMENT D
USING(DNO);
-- Q3. INNER JOIN과 USING 연산자를 사용하여 부서번호가 10번에 해당하는 사원의 담당업무와 부서의 지역명을 추출하시오.
SELECT DNO, JOB, LOC
FROM EMPLOYEE INNER JOIN DEPARTMENT
USING(DNO)
WHERE DNO = 10;

SELECT E.DNO, JOB, LOC
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DNO = D.DNO AND E.DNO = 10;

-- Q4. NATURAL JOIN를 사용하여 COMMISION을 받는 사원이름, 부서명, 지역명을 추출하시오.
/* NATURAL JOIN은 기본으로 같은 컬럼명을 알아서 EQUI로 조인시킴. 그러나 동일한 컬럼이 여러개면 에러남*/
SELECT ENAME, DNAME, LOC
FROM EMPLOYEE E, DEPARTMENT Dㄴ
WHERE E.DNO  = D.DNO AND COMMISSION > 0;

SELECT ENAME, DNAME, LOC
FROM EMPLOYEE NATURAL JOIN DEPARTMENT
WHERE COMMISSION > 0;
