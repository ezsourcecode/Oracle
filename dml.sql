-- 데이터 정의어: DDL
-- 데이터 베이스의 구조를 생성하는 명령어 CREATE
-- 데이터 베이스의 구조를 변경하는 명령어 ALTER
-- 데이터 베이스의 구조를 제거하는 명령어 DROP / CASCADE - 제약조건(연쇄)
-- 데이터 베이스의 구조에 이름을 변경하는 RENAME

-- 데이터 베이스 구조: 테이블(기본), 뷰, 인덱스, 시퀀스, 시스템 카탈로그 등
-- 테이블을 생성할 때 CREATE TAB ~
-- Question 1. 상품(PRODUCT) 테이블을 생성하시오.
CREATE TABLE PRODUCT(
                                NUM NUMBER(2), 
                                NAME VARCHAR2(5), 
                                PRICE NUMBER, 
                                QTY NUMBER
);
-- 테이블 구조 확인
DESC PRODUCT;

-- Question 2. 부서(DEPT) 테이블을 생성하시오. 생성된 테이블에 부서번호(DNO), 부서명(DNAME), 부서위치(LOC)를 적당한 자료형을 사용하여 생성하시오.
CREATE TABLE DEPT(
                                DNO NUMBER(2), 
                                DNAME VARCHAR2(15), 
                                LOC VARCHAR2(20)
 );
 
 DESC DEPT
 
 -- Question 3. 기존에 존재하는 테이블을 이용하여 새로운 테이블 생성: AS절
 -- 기존에 존재하는 테이블의 구조와 내용 또는 구조만 복사하여 새로운 테이블을 생성할 수 있다.
SELECT  * FROM DEPT;

CREATE TABLE DEPT_SECOND 
AS /*AS 서브쿼리*/
SELECT * FROM DEPARTMENT;

DESC DEPT_SECOND

SELECT * FROM DEPT_SECOND;

-- Question 4. 사원테이블에 직급이 SALESMAN에 해당하는 사원의 정보만 새로운 테이블 SALES로 구조와 내용을 복사하는 쿼리를 기술하시오.
CREATE TABLE SALES
AS
SELECT * FROM EMPLOYEE
WHERE JOB = 'SALESMAN';
SELECT * FROM SALES;

-- Question 5. 사원테이블에 사원번호, 사원명, 입사일자, 급여 컬럼을 이용하여 EMP_SECOND라는 테이블을 생성하시오.
CREATE TABLE EMP_SECOND
AS
SELECT ENO, ENAME, HIREDATE, SALARY
FROM EMPLOYEE;
SELECT * FROM EMP_SECOND;

-- Question 6. 부서테이블의 구조만 복사하여 DEPT_THIRD라는 이름의 테이블을 생성하시오.
CREATE TABLE DEPT_THIRD
AS
SELECT *
FROM DEPARTMENT
WHERE 1=0;
SELECT * FROM DEPT_THIRD;

-- ALTER ~: 데이터 베이스의 구조를 변경하는 명령어
-- ALTER TABLE ~ ADD()
--- Question 7. 사원정보테이블에 날짜형태의 데이터를 담는 BIRTH라는 이름의 컬럼을 추가하시오.
ALTER TABLE EMPLOYEE ADD(BIRTH DATE);

-- ALTER TABLE ~ MODIFY
--- 수정하려는 컬럼의 값이 있는 경우 => 크기는 기존 자료형보다 커야 변경 가능.
-- 수정하려는 컬럼의 값이 없는 경우 => 크기와 자료형을 변경할 수 있다.
-- Question 8. 사원테이블의 사원 이름을 변경하시오.
CREATE TABLE EMP
AS
SELECT *
FROM EMPLOYEE;

ALTER TABLE EMP MODIFY ENAME VARCHAR2(10);
DESC EMP

-- ALTER TABLE ~ DROP COLUMN 컬럼명: 특정 컬렁을 삭제하는 명령어
ALTER TABLE EMPLOYEE DROP COLUMN BIRTH;

-- TEST를 SAMPLE로 변경하시오.
RENAME TEST TO SAMPLE;
SELECT * FROM TAB;

-- DROP TABLE 테이블명;
DROP TABLE DEPT01;

-- DML: 데이터 조작어
-- 실제 데이터 베이스의 테이블을 이용하여 레코드 단위로 작업을 수행하는 명령어
-- CRUD: SELECT, INSERT, UPDATE, DELETE
-- SELECT ~ FROM, INSERT INTO ~ VALUES, UPDATE ~ SET, DELETE ~ FROM
-- 1. SELECT: 검색, 추출
-- 기본형: SELECT 컬럼명 FROM 테이블명
-- 확장형: WHERE조건식, ORDER BY(ASC, DESC), GROUP BY, HAVING

-- 2. INSERT: 추가
-- 기본형: INSERT INTO 테이블명(컬럼명) VALUES(값);
-- Question 9. 기존의 부서테이블에서 데이터를 제외하고 구조만 복사해서 DEPT_COPY 테이블을 생성하시오.
CREATE TABLE DEPT_COPY
AS
SELECT *
FROM DEPARTMENT
WHERE 1 = 0;

DESC DEPT_COPY
SELECT * FROM DEPT_COPY;

-- 레코드 삽입하는 방법 1
INSERT INTO DEPT_COPY(DNO, DNAME, LOC) VALUES(11 ,'개발부' , '서울시');

-- 레코드 삽입하는 방법 2: 해당 테이블에 존재하는 모든 컬럼에 값을 추가할 경우 컬럼명을 생략가능하다.
INSERT INTO DEPT_COPY VALUES(22, '홍보부', '부산시');

-- 레코드 삽입하는 방법 3:  특정 컬럼에만 값을 추가하는 경우
INSERT INTO DEPT_COPY(DNO, LOC) VALUES(33, '대전시');

-- 레코드 삽입하는 방법 4:  VALUES 대신에 서브 쿼리를 사용하여 다른 테이블에 있는 레코드를 복사할 수 있다.
-- DEPT_COPY 테이블 삭제
DROP TABLE DEPT_COPY;
SELECT * FROM TAB;
-- DEPARTMENT 테이블의 구조만 이용하여 DEPT_COPY 테이블 생성
CREATE TABLE DEPT_COPY
AS
SELECT *
FROM DEPARTMENT
WHERE 1 = 0;

INSERT INTO DEPT_COPY
SELECT *
FROM DEPARTMENT; -- 컬럼명과 컬럼 수는 일치해야 한다.

-- 테이블의 컬럼 내용을 변경할 때 사용하는 명령어: UPDATE
-- UPDATE 실행시 WHERE조건절이 생략되면 모든 레코드 값이 변경된다.
-- Question 10. DEPT_COPY 테이블의 부서명을 모두 HR로 변경하시오.
UPDATE DEPT_COPY SET DNAME = 'HR';

-- 서브쿼리를 이용하여 다른 테이블에 저장된 데이터로 해당 컬럼의 값을 변경할 수 있다.
-- Question 11. 부서테이블의 모든 부서의 지역명을 부서번호가 20번에 해당하는 부서의 지역으로 변경하시오.
UPDATE DEPT_COPY SET LOC = (SELECT LOC FROM DEPT_COPY WHERE DNO = 20);

-- DEPT_COPY 테이블의 부서명을 'AAA'로 변경하고 부서번호를 33으로 변경하시오.
UPDATE DEPT_COPY SET DNAME = 'AAA', DNO = 33;

-- DELETE ~ FROM: 테이블에 레코드를 삭제하는 명령어'
DELETE FROM DEPT_COPY;

-- DEPARTMENT 테이블의 레코드를 DEPT_COPY 테이블에 추가하시오.
INSERT INTO DEPT_COPY SELECT * FROM DEPARTMENT;

DELETE FROM DEPT_COPY WHERE DNAME = 'SALES';

-- 서브쿼리를 이용하여 레코드 삭제하기
-- 사원정보테이블의 구조와 내용을 복사하여 EMP라는 이름의 테이블을 생성한다.
DROP TABLE EMP;
CREATE TABLE EMP AS SELECT * FROM EMPLOYEE;

-- Question 12.부서명이 SALES에 해당하는 사원의 정보를 EMP테이블에서 삭제하는 작업을 수행하시오.
-- STEP 1. 부서정보를 가지고 있는 테이블에서 SALES라는 부서명에 해당하는 부서번호를 추출한다.
SELECT DNO FROM DEPARTMENT WHERE DNAME = 'SALES';
-- STEP 2. 위에서 찾은 부서번호가 30번에 해당하는 사원의 정보를 삭제하는 작업을 수행한다.
DELETE FROM EMP WHERE DNO = 30;

DELETE FROM EMP WHERE DNO = (SELECT DNO FROM DEPARTMENT WHERE DNAME = 'SALES');

