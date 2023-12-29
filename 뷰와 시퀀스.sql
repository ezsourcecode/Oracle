-- 가상 테이블 뷰(VIEW)
-- 뷰(VIEW): 물리적인 테이블을 근거로 만들어진 가상 테이블, 테이블에 데이터는 있지만 실제 뷰라는 테이블이 존재하지 않고 SQL만 저장되어 있다.
-- 기본테이블: 뷰를 생성하기 위해서 실질적으로 데이터를 가지고 있는 물리적인 테이블을 뜻한다.
-- 실습을 위해 DEPT, EMP 테이블 생성: DEPARTEMENT, EMPLOYEE 테이블 각각 복사
DROP TABLE DEPT CASCADE CONSTRAINTS;
CREATE TABLE DEPT AS SELECT * FROM DEPARTMENT;
SELECT * FROM DEPT;

DROP TABLE EMP;
CREATE TABLE EMP AS SELECT * FROM EMPLOYEE;
SELECT * FROM EMP;

-- 뷰를 생성하는 명령: CREATE VIEW 뷰이름(옵션)
-- 뷰를 생성할 때 사용하는 옵션: CREATE OR REPLACE VIEW, FORCE(기본테이블이 없어도 만들게 함), WITH CHECK OPTION, WITH READ ONLY

-- Question 1. 부서번호가 30번에 해당하는 사원들의 번호, 이름, 부서번호만 추출하시오.
SELECT ENO, ENAME, DNO
FROM EMP
WHERE DNO = 30;

-- 30번 부서에 소속된 사원들의 번호, 이름, 부서번호를 출력하기 위한 SELECT문을 하나의 뷰로 정의
CREATE VIEW EMP_VIEW30
AS
SELECT ENO, ENAME, DNO
FROM EMP
WHERE DNO = 30;

SELECT * 
FROM EMP_VIEW30;

-- 뷰를 사용하는 이유: 복잡하고 긴 쿼리문을 뷰로 정의하면 접근이나 작업에 효율성을 높일 수 있다. 보안에 유리
DROP VIEW EMP_VIEW30; -- 뷰를 삭제해도 기반 테이블이 삭제되는 것은 아니다. 그러나 기반 테이블이 삭제되면 뷰도 자동 삭제됨

-- 시퀀스(SEQUENCE):일련번호의 성질을 가지고 있는 기능
-- 오라클에서는 행을 구분하기 위해서 일반적으로 행의 값을 기본키로 사용하는 경우가 있다.
-- 기본키처럼 생략, 중복 불가. 자동 번호 발생기
-- 시퀀스를 생성: CREATE SEQUENCE 시퀀스명, START WITH => 시작번호, INCREMENT BY =>증감값, MAXVALUE => 최대값
-- 시퀀스의 값을 확인하는 명령어: CURRVAL(시퀀스의 현재값), NEXTVAL(다음값)

-- 시퀀스 생성하기
CREATE SEQUENCE SAMPLE_SEQ; -- 1부터 시작해서 1씩 증가하는 시퀀스 생성

SELECT SAMPLE_SEQ.NEXTVAL FROM DUAL;

SELECT SAMPLE_SEQ.CURRVAL FROM DUAL;

-- 사원번호를 생성할 목적으로 시퀀스 객체를 생성하시오.
--  시작값은 1,  1씩 증가 최대값 100000이 되는 EMP_SEQ를 생성하시오.
CREATE SEQUENCE EMP_SEQ START WITH 1 INCREMENT BY 1 MAXVALUE 100000;

DROP TABLE EMP01 CASCADE CONSTRAINTS;
CREATE TABLE EMP01(
                                                ENO NUMBER PRIMARY KEY,
                                                ENAME VARCHAR2(14),
                                                SALARY NUMBER
);

INSERT INTO EMP01 VALUES(EMP_SEQ.NEXTVAL, '이순신', 1000);

SELECT * FROM EMP01;
