-- 주석(comment): 프로그램 실행과 상관없이 코드의 설명을 담기 위해 사용하는 구문(기호 --, #, /*~*/, //)
-- sql query: DB 표준인 명령어, 여러 줄에 명령어를 입력할 수 있기 때문에 명령어 끝에(종결자) 세미콜론(;)을 붙인다.
-- sql * plus 명령어: oracle에서만 사용 가능한 명령어, 한 줄 명령

-- 현재 접속한 사용자 계정을 확인하는 명령어
SHOW USER

-- SCOTT계정이 갖고 있는 테이블의 목록(TAB: TABLE)을 추출하는 명령
SELECT * FROM TAB;

-- CRUD 명령어: DML 관련 명령어를 뜻한다.
-- DDL: 정의어(CREATE 생성, ALTER 수정, DROP 삭제)
-- DML: 조작어(SELECT 추출/검색, INSERT 추가, UPDATE 수정, DELETE 삭제)
-- DCL: 제어어( COMMIT 영구저장/반영, ROLLBACK 복구, GRANT 권한부여, REVOKE 권한해제)
--트랜젝션(TRANSACTION): 데이터베이스를 통해 수행되는 명령어의 진행과정, 하나의 명령이 실행되는 과정

-- SELECT 명령어: 테이블에 저장된 레코드 단위로 작업을 수행하는 명령어, 추출(검색)
-- 1. 기본형: SELECT 필드명 FROM 테이블명
-- Question 1. 직원정보를 담고 있는 employee 테이블에 등로된 모든 사원의 정보를 추출하시오. (* = all)
-- 테이블의 구조를 확인하는 명렁어
DESC EMPLOYEE

SELECT * 
FROM EMPLOYEE;

-- Question 2. 직원정보(employee) 테이블에서 직원의 번호, 이름, 직급을 추출하시오.
SELECT ENO, ENAME, JOB 
FROM EMPLOYEE;

-- Question 3. 직급(job)이 사원(clerk)에 해당하는 사원의 정보만 추출하시오.
SELECT * 
FROM EMPLOYEE
WHERE JOB = 'CLERK'; // 되도록 레코드와 같이 대소문자 맞춰줘야 좋음

-- 2. 확장형: WHERE절 - 주어진 조건이 참인 것만 추출할 떄 사용하는 절
-- 조건식(OR 판정식 OR 비교/판단문): 반드시 그 결과가 참 OR 거짓으로 판정이 되는 수식
-- 연산자(OPERATION): 피 연산자 사이에 연산을 수행하기 위해 사용하는 기호들
-- 산술 연산자: 사칙연산을 수행하는 연산기호(+, -, *, /)
-- Question 4. 직원의 정보를 담고 있는 테이블 employee를 이용하여 현재 직원의 이름과 급여와 10씩 인상된 급여를 추출하시오.
SELECT ENAME, SALARY, SALARY + 10
FROM EMPLOYEE;

-- 별칭(NICKNAME): AS절
SELECT ENAME, SALARY, SALARY + 10 AS "인상된 급여" --문자열 같은 경우 AS 안 써도 되나 씀
FROM EMPLOYEE;

-- Question 5. 직원 정보를 담고 있는 테이블에 직급이 "ANALYST"에 해당하는 직원의 급여를 500씩 인상하여 추출하시오.
SELECT ENAME, JOB, SALARY, SALARY + 500 AS "인상된 급여"
FROM EMPLOYEE
WHERE JOB = 'ANALYST';

-- Question 6. 직원테이블의 연봉과 보너스를 합친 금액을 추출하되, 해당 칼럼명을 총급여로 표시하시오.
SELECT ENAME, SALARY, COMMISSION, SALARY + COMMISSION "총급여"
FROM EMPLOYEE;
-- NULL: 비어있다는 의미로 0이 아니다.
-- NULL을 다른 값으로 변화하는 함수: NVL함수, NVL(데이터, 대체 값)
SELECT ENAME, SALARY, COMMISSION, SALARY +NVL(COMMISSION, 0) "총급여"
FROM EMPLOYEE;

-- 관계 연산자 OR 비교 연산자
-- 두 수의 대소관계를 비교하는 연산자: =(같다), !=, <>, ^=(같지 않다), >, >=, <, <=
-- 주어진 조건에 참인 것만 추출하라는 의미를 가진다.
-- Question 7. 부서번호(DNO)가 20인 사원의 정보를 추출하시오.
SELECT *
FROM EMPLOYEE
WHERE DNO = 20;

-- Question 8. 부서번호가 20이 아닌 직원의 정보를 추출하시오.
SELECT *
FROM EMPLOYEE
WHERE DNO <> 20;

-- Question 9. 사원의 이름이 FORD인 사원의 사번, 이름, 급여를 추출하시오.
SELECT ENO, ENAME, SALARY
FROM EMPLOYEE
WHERE ENAME = 'FORD';

-- Question 10. 입사일이 1982년 1월 1일 이후에 해당하는 사원의 정보를 추출하시오.
-- 문자, 날짜는 반드시 홀따옴표 안에 표시해야 한다.
SELECT *
FROM EMPLOYEE
WHERE HIREDATE >= '1982-01-01';

-- 논리 연산자: 논리값(참, 거짓)을 이용하여 연산을 수행하는 연산자
-- 여러 개의 비교 연산자를 결합하영 결과를 얻어낼 때 사용하는 연산자
-- AND: 모두, 모든 조건에 만족하는 것만 추출
-- Question 11. 부서번호가 10이고, 직급이 MANGER에 해당하는 직원의 정보를 추출하시오.
SELECT *
FROM EMPLOYEE
WHERE DNO = 10 AND JOB = 'MANAGER';

-- OR  : 또는, 혹은, 어느 거 하나라도, 여러 개의 조건 중 하나만 참이어도 추출
-- Question 12. 부서번호가 10이거나 직급이 MANGER에 해당하는 직원의 정보를 추출하시오.
SELECT *
FROM EMPLOYEE
WHERE DNO = 10 OR JOB = 'MANAGER';

-- NOT: 논리값의 부정, 단항연산
-- Question 13 부서번호가 10이 아니 사원의 정보를 추출하시오. (3가지 유형)
SELECT *
FROM EMPLOYEE
WHERE DNO != 10;

SELECT *
FROM EMPLOYEE
WHERE DNO <> 10;

SELECT *
FROM EMPLOYEE
WHERE DNO ^= 10;

-- 관용적인 표현식을 이용한 논리 연산자
-- BETWEEN ~ AND: 하나의 컬럼을 기준으로 조건을 부여할 때 사용하는 연산자, 숫자, 문자, 날짜형에 사용가능하다.
-- Question 14. 급여가 2000이상 3000이하에 해당하는 사원의 정보를 추출하시오.
SELECT *
FROM EMPLOYEE
WHERE SALARY BETWEEN 2000 AND 3000;

-- IN: 포함여부를 판단하는 관용적 표현
-- Question 15. 급여가 2000 미만이거나 3000 초과에 해당하는 사원의 정보를 추출하시오.
SELECT *
FROM EMPLOYEE
WHERE SALARY NOT BETWEEN 2000 AND 3000;

-- Question 16. 1987년에 입사한 사원의 정보를 추출하시오.
-- 문자, 날짜는 반드시 홀따옴표 안에 표시해야 한다.
SELECT *
FROM EMPLOYEE
WHERE HIREDATE BETWEEN '1987-01-01' AND '1987-12-31';

-- Question 17. 부서번호가 10이거나 30, 40에 해당하는 사원의 정보를 추출하시오.
SELECT *
FROM EMPLOYEE
WHERE DNO ^=20; // 내 방식

SELECT *
FROM EMPLOYEE
WHERE DNO=10 OR DNO=30; // 선생님 방식1

SELECT *
FROM EMPLOYEE
WHERE DNO IN(10, 30, 40); // 선생님 방식2

-- !의 의미는 NOT을 뜻한다.
SELECT *
FROM EMPLOYEE
WHERE DNO NOT  IN(10, 30, 40); // 20만 출력됨

-- 만능문자, 와일드카드 문자(WILD CHARACTER): %, _ => 프로그래밍 언어에서는 *와?를 사용한다.
-- 대체문자
-- '='를 뜻하는 기호 대신 반드시 LIKE를 사용한다.
-- %: 글자 수에 상관없이 모든 글자를 대신하는 기호
-- Question 18. 사원의 이름의 첫 글자가 'M'로 시작하는 직원 정보를 추출하시오.
SELECT *
FROM EMPLOYEE
WHERE ENAME LIKE 'M%';

-- Question 19. 직원의 이름의 마지막 글자가 'N'에 해당하는 직원의 정보를 추출하시오.
SELECT *
FROM EMPLOYEE
WHERE ENAME LIKE '%N';

-- Question 20. 직원의 이름에 'R'이 포함된 직원의 정보를 추출하시오.
SELECT *
FROM EMPLOYEE
WHERE ENAME LIKE '%R%';

-- '_'는 개당 한 글자를 대체하는 만능문자
-- Question 21. 직원 이름의 두 번째 글자가 'A'인 직원의 정보를 추출하시오.
SELECT *
FROM EMPLOYEE
WHERE ENAME LIKE '_A%';

-- Question 22. 직원의 첫 글자가 'M'이 아닌 직원의 정보를 추출하시오.
SELECT *
FROM EMPLOYEE
WHERE ENAME NOT LIKE 'M%';

-- IS NULL / IS NOT NULL 
SELECT COMMISSION FROM EMPLOYEE;
SELECT COMMISSION FROM EMPLOYEE WHERE COMMISSION IS NULL;

SELECT * FROM EMPLOYEE WHERE COMMISSION IS NULL;
SELECT * FROM EMPLOYEE WHERE COMMISSION IS NOT  NULL;

-- 3. 확장형: 정렬을 위한 ORDER BY절
-- 정렬(SORT): 주어진 키 값에 따라 순서대로 나열하는 것
-- 정렬 방식: 오름차순(ASC, ASCENDING 생략가능)과 내림차순(DESC, DESCENDING)
-- 숫자: 1,2,3,4
-- 문자: A,B,C,D 사전순으로(오름차순) 반대는 내림차순
-- Question 23. 사원의 급여를 기준으로 오름차순 정렬하여 추출하시오..
SELECT * 
FROM EMPLOYEE
ORDER BY SALARY;

SELECT * 
FROM EMPLOYEE
ORDER BY SALARY DESC; //내림차순

-- Question 24. 부서번호를 기준으로 오름차순 정렬하여 추출하시오. 이떄, 동일한 부서번호를 가지고 있는 직원의 급여를 기준으로 내림차순 정렬하시오.
SELECT * 
FROM EMPLOYEE
ORDER BY DNO, SALARY DESC;

-- Question 25. 가장 최근에 입사한 사원순서대로 추출하시오.
SELECT * 
FROM EMPLOYEE
ORDER BY HIREDATE DESC;

-- DISTINCT: 동일한 값들이 중복되어 추출되지 않도록 하는 옵션
SELECT DISTINCT DNO FROM EMPLOYEE;

-- 연결 연산자: SELECT문 내부에 문자를 연결할 때 사용하는 연산자, ||
SELECT ENAME ||  '의 직무는 ' || JOB ||  '입니다.'
FROM EMPLOYEE;

-- 함수(FUNCTION): 반복적으로 수행하는 명령이나 기능을 하나의 명령으로 묶어서 관리하는 명령어
-- SQL 단일행 함수: 함수의 결과가 하나의 행으로 추출된다.
-- 종류: 숫자 함수, 문자 함수, 날짜 함수, 형변한, 일반 함수
-- SQL 복수행 함수 = 그룹함수

-- DUAL 테이블: 임시 테이블, 단일행 함수의 결과를 추출하기 위해 사용되는 가상의 테이블 이름
-- 10 * 5
SELECT 10 * 5
FROM DUAL;

DESC DUAL;

SELECT * FROM DUAL;

-- 현재 시스템의 날짜를 추출하는 함수
SELECT SYSDATE
FROM DUAL;

-- 숫자 함수: 숫자 데이터를 처리하는 함수
-- ABS(): 절대값을 추출하는 함수
SELECT -10, ABS(-10)
FROM DUAL;

-- ROUND(숫자, 자리수): 특정 자릿수에서 반올림하는 함수
--FLOOR(숫자): 소수점 아래를 버리는 함수
SELECT 34.5432, ROUND(34.5432, 0), FLOOR(34.5432)
FROM DUAL;

SELECT 34.5678, ROUND(34.5678, 2), ROUND(34.5678, -1)
FROM DUAL;

-- MOD(숫자, 나눌수): 숫자를 해당 나눌 수로 나누어 생기는 나머지를 추출하는 함수
SELECT MOD(27, 5), MOD(27, 7), MOD(27, 2)
FROM DUAL;

-- 자연어 처리, NLP
-- UPPER, LOWER, LENGTH, LENGTHB(문자 바이트 길이로 알려줌), INSTR, SUBSTR(중간에 있는 문자 확인) etc

