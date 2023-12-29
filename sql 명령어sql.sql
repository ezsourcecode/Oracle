-- 데이터 정의어(DDL, Data Definition Language): 데이터베이스의 구조를 생성하고 변경하고 삭제하는 명령어
-- 1. CREATE TABLE: 새로운 테이블을 생성하는 명령어
-- 자료형(DATA TYPE): 컬럼들의 속성
-- CHAR(SIZE): 고정길이 문자 데이터
-- VARCHAR2(SIZE): 가변길이 문자 데이터
-- NUMBER: 숫자, NUMBER(SIZE), NUMBER(SIZE, D) => NUMBER(7, 2)
-- DATE / TIMESTAMP
-- Question 1. 임이의 테이블 EMP01을 생성하고, 사원번호 ENO, 사원이름 ENAME, 사원급여 SAL을 컬럼으로 담아서 구현하시오.
-- 사용자 정의 규칙(명명법): 테이블명, 컬럼명, 기타 프로그램 안에서 사용자가 임의로 정의해서 사용하는 이름들을 작성하는 규칙
-- 반드시 문자로 시작, 글자수 1~30까지, 영문자(A~Z, 대소문자), 숫자(0~9), 특수문자('_', '$', '#')만 포함 가능. 중복불가능, 공백을 허용하지 않는다.
CREATE TABLE EMP01 (ENO NUMBER(4),
                                                ENAME VARCHAR2(20),
                                                SAL NUMBER);
-- 테이블 구조 확인
DESC EMP01

-- 기존에 존재하는 테이블을 활용하여 테이블을 생성: AS절
CREATE TABLE EMP02 AS SELECT * FROM EMP01; -- EMP01 테이블의 구조와 내용을 그대로 복사하여  새로운 테이블을 생성한다는 의미
DESC EMP02

CREATE TABLE EMP AS SELECT * FROM EMPLOYEE;

SELECT * FROM EMP01;
SELECT * FROM EMP02;
SELECT * FROM EMP;

-- 기존에 만들어진 테이블의 구조만 이용하여 새로운 테이블 생성
CREATE TABLE EMP03 AS SELECT * FROM EMPLOYEE WHERE 1 = 0;
DESC EMP03;
SELECT * FROM EMP03;

-- Question 2. 부서번호가 30번에 해당하는 사원들의 정보를 가지고 있는 테이블 EMP30을 생성하시오.
CREATE TABLE EMP30 AS SELECT * FROM EMPLOYEE WHERE DNO = 30;
SELECT * FROM EMP30;

-- 현재 접속된 계정에 존재하는 테이블 목록 추출
SELECT * FROM TAB;

-- 2. ALTER TABLE: 기존 테이블의 구조를 변경하는 명령어
-- 테이블의 구조 변경은 컬럼의 추가, 수정, 삭제시 사용한다.
-- 1) ALTER TABLE ~ ADD: 기존 테이블에 새로운 컬럼을 추가하는 명령어
SELECT * FROM EMP01;
DESC EMP01;
ALTER TABLE EMP01 ADD(JOB VARCHAR2(9));

-- 2) ALTER TABLE  ~ MODIFY: 기존 테이블에 컬럼을 변경하는 명령어
-- 해당 컬럼에 자료가 없는 경우: 데이터 타입(O) 컬럼의 크기(O)
-- 해당 컬럼에 자료가 있는 경우: 데이터 타입(X) 컬럼의 크기(O) 기존 컬럼의 크기보다 반드시 더 커야 한다.
ALTER TABLE EMP01 MODIFY(JOB VARCHAR2(30));


-- 3) ALTER TABLE ~ DROP COLUMN: 테이블에 존재하는 컬럼을 삭제하는 명령어
ALTER TABLE EMP01 DROP COLUMN JOB;

-- 3. DROP TABLE: 기존 테이블을 제거하는 명령어. 한 번 제거하면 절대 못 살림.
SELECT * FROM TAB;
DROP TABLE EMP01;
DESC EMP01

-- 4. RENAME: 기존 테이블 이름을 변경하는 명령어
RENAME EMP TO TEST;
SELECT * FROM EMP;
SELECT * FROM TEST;

-- 데이터 조작어(DML): 테이블의 내용을 추가, 수정, 삭제, 추출하는 명령어
-- 1. SELECT ~ FROM: 추출, 검색
-- 부서정보를 관리하는 테이블 DEPARTMENT 테이블의 모든 내용을 추출하시오.
SELECT * 
FROM DEPARTMENT;
-- 부서테이블의 구조만 이용하여 DEPT01이라는 테이블을 생성하시오.
CREATE TABLE DEPT01 AS SELECT * FROM DEPARTMENT WHERE 0 = 1;
DESC DEPT01
SELECT * FROM DEPT01;

-- 2. INSERT INTO ~ VALUES: 추가
INSERT INTO DEPT01 (DNO, DNAME, LOC) VALUES(11, '총무부', '금천구');
INSERT INTO DEPT01 VALUES(22,'전산실', '서구');
INSERT INTO DEPT01 (DNO, DNAME)VALUES(33, '홍보부');
INSERT INTO DEPT01 (DNO, LOC) VALUES(444, '서울시');

-- 3. UPDATE ~ SET: 변경
-- 테이블에 저장된 레코드를 수정하기 위해 사용하는 명령어
-- 주의! WHERE절을 사용하지 않을 경우 모든 레코드의 값이 수정된다.
SELECT * FROM TEST;
-- 모든 사원의 부서번호를 30으로 수정하시오.
UPDATE TEST SET DNO = 30;

-- 직원의 급여를 10% 인상하는 쿼리문을 기술하시오.
UPDATE TEST SET SALARY = SALARY * 1.1;

-- 모든 직원의 입사일을 오늘 날짜로 수정하시오.
UPDATE TEST SET HIREDATE = SYSDATE;

-- 직급이 SALESMAN인 직원의 부서번호를 40으로 수정하시오.
UPDATE TEST SET DNO = 40 WHERE JOB = 'SALESMAN';

-- 직급이 MANAGER인 직원의 급여를 10% 인상하는 쿼리문을 구현하시오.
UPDATE TEST SET SALARY = SALARY *1.1 WHERE JOB = 'MANAGER';

-- SCOTT 사원의 부서번호를 20으로, 직급을 MANAGER로, 급여는 50, 커미션은 4000으로 수정하는 쿼리문을 구현하시오.
UPDATE TEST SET DNO = 20, JOB = 'MANAGER', SALARY = 50, COMMISSION = 4000 WHERE ENAME = 'SCOTT';
SELECT * FROM TEST WHERE ENAME = 'SCOTT';

-- Question 3. 부서번호가 20번인 부서의 지역명을 40번의 지역으로 변경하는 쿼리를 작성하되 서브쿼리를 이용하시오.
-- 단, DEPARTMENT 테이블의 구조와 내용을 이용하여 DEPT02 테이블을 생성하여 작업할 것
CREATE TABLE DEPT02 AS SELECT * FROM DEPARTMENT; 
SELECT * FROM DEPT02;
UPDATE DEPT02 SET LOC = (SELECT LOC FROM DEPT02 WHERE DNO = 40 ) WHERE DNO = 20;

-- 4. DELETE ~FROM: 삭제
-- 테이블에 저장된 레코드를 삭제하는 명령어
-- WHERE 조건절이 없으면 모든 레코드가 삭제된다.
DELETE FROM DEPT02;

