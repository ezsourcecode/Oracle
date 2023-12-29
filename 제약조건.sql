-- 데이터 무결성 제약조건: 유효성 검사
-- 테이블에 부적절한 데이터의 입력을 방지하기 위해 테이블을 생성할 때 기술하는 여러 규칙들
-- 1. NOT NULL: 생략불가능 ,NULL - 생략가능(기본형)
-- 2. UNIQUE: 중복불가능, 유일성, 중복값을 허용하지 않는다.
-- 3. PRIMARY KEY: 기본키(NOT NULL + UNIQUE)
-- 4. FOREIGN KEY: 외래키(다른 테이블을 참조할떄)
-- 5. CHECK: 유효성검사규칙, 입력값의 범위를 부여하는 것

DROP TABLE DEPT;
CREATE TABLE DEPT (DNO NUMBER(2), DNAME VARCHAR2(14), LOC VARCHAR2(13));

SELECT *FROM DEPT;

INSERT INTO DEPT VALUES(11, 'AAA', '서울시');
INSERT INTO DEPT(DNAME, LOC) VALUES('BBB', '대전시');
INSERT INTO DEPT(DNO, LOC) VALUES(33, '부산시');

-- NOT NULL 제약규칙
DROP TABLE DEPT;
CREATE TABLE DEPT (DNO NUMBER(2) NOT NULL,  
                                             DNAME VARCHAR2(14), LOC VARCHAR2(13));

SELECT *FROM DEPT;

INSERT INTO DEPT VALUES(11, 'AAA', '서울시');
INSERT INTO DEPT(DNAME, LOC) VALUES('BBB', '대전시'); --ERROR, DNO가 생략되어있으므로
INSERT INTO DEPT(DNO, LOC) VALUES(11, '부산시'); -- 동일한 DNO 가짐

-- UNIQUE:  유일성이 만족되어야 한다. 중복값을 허용하지 않는다.
DROP TABLE DEPT;
CREATE TABLE DEPT (DNO NUMBER(2) UNIQUE, 
                                             DNAME VARCHAR2(14), LOC VARCHAR2(13));

SELECT *FROM DEPT;

INSERT INTO DEPT VALUES(11, 'AAA', '서울시');
INSERT INTO DEPT(DNAME, LOC) VALUES('BBB', '대전시');
INSERT INTO DEPT(DNO, LOC) VALUES(11, '부산시'); -- ERROR, DNO가 유일성을 위반했기 때문

-- NOT NULL과 UNIQUE 제약조건을 동시에 담는다면 => 기본키(PRIMARY KEY)
-- 기본키는 레코드를 식별할 용도로 사용하는 키로 중복을 허용하지 않고, 생략이 불가능하다.
DROP TABLE DEPT;
CREATE TABLE DEPT (DNO NUMBER(2) PRIMARY KEY, 
                                             DNAME VARCHAR2(14), LOC VARCHAR2(13));

SELECT *FROM DEPT;

INSERT INTO DEPT VALUES(11, 'AAA', '서울시');
INSERT INTO DEPT(DNAME, LOC) VALUES('BBB', '대전시');
INSERT INTO DEPT(DNO, LOC) VALUES(11, '부산시'); -- ERROR, DNO가 유일성을 위반했기 때문

-- FOREIGN KEY: 외래키, 참조무결성
-- 테이블 사이의 관계를 발생시키는 제약 조건
-- 부모테이블(DEPT)를 참조하여 자식테이블(EMP)를 구현한다.
-- STEP 1. 참조테이블은 부모테이블이 DEPT에 테이블 기본키 설정(DNO)
-- STEP 2. 부모테이블에 레코드를 삽입한다.
-- SETP 3. 자녀테이블(EMP)에 해당 컬럼에 외래키 설정, 이때 동일한 이름이 존재하면 에러가 발생한다.
-- STEP 4. 자녀테이블에 새로운 레코드를 삽입할 때, 부모테이블을 참조하는 컬럼에 없는 값을 삽입하면 무결성 제약규칙에 어긋난다.
DROP TABLE EMP;
DESC EMPLOYEE

CREATE TABLE EMP(
                                          ENO NUMBER(4) PRIMARY KEY,
                                          ENAME VARCHAR(20) NOT NULL,
                                          DNO NUMBER(2)  CONSTRAINT DNO_FK REFERENCES DEPT(DNO) -- 외래키 설정
);

INSERT INTO EMP VALUES(1111, 'AAA', 10);
INSERT INTO EMP VALUES(2222, 'BBB', 20);
INSERT INTO EMP VALUES(3333, 'CCC', 10);
INSERT INTO EMP VALUES(4444, 'DDD', 30);
INSERT INTO EMP VALUES(5555, 'EEE', 40); -- 오류가 발생한다.(부모테이블 부서번호에 40은 존재하지 않기 때문이다.)
 
SELECT * FROM EMP;

DROP TABLE DEPT;
-- 부모테이블
CREATE TABLE DEPT(
                                             DNO NUMBER(2) PRIMARY KEY,
                                             DNAME VARCHAR2(20),
                                             LOC VARCHAR2(20)
);

INSERT INTO DEPT VALUES(10, '홍보부', '서울시');
INSERT INTO DEPT VALUES(20, '영업부', '부산시');
INSERT INTO DEPT VALUES(30, '개발부', '대전시');

SELECT * FROM DEPT;

INSERT INTO EMP VALUES(6666, 'KKK', 40);

-- 부서번호가 40번인 직원정보 삭제
DELETE FROM EMP WHERE DNO = 40;

-- 테이블을 생성한 후 외래키 설정하기
-- ALTER TABLE EMP
--- ADD CONSTRAINT FK_DNO REFERENCES DEPT(DNO);

-- 외래키 조회: USER_CONSTRAINTS, USER_CONS_COLUMNS 딕셔너리를 이용해서 외래키 조회
SELECT A.CONSTRANIT_NAME, A.TABLE_NAME, B.COLUMN_NAME, A.CONSTRAINT_TYPE, A.R_CONSTRAINT_NAME 
FROM USER_CONSTRAINTS A, USER_CONS_COLUMNS B
WHERE A.CONSTRAINT_NAME = B.CONSTRAINT_NAME;

SELECT uc.constraint_name, uc.table_name, ucc.column_name, uc.constraint_type, uc.r_constraint_name
FROM user_constraints uc, user_cons_columns ucc
WHERE uc.constraint_name = ucc.constraint_name;

-- 외래키 삭제
ALTER TABLE EMPLOYEE DROP CONSTRAINT FK_DNO;

-- CHECK: 유효성 검사 규칙, 특정 컬럼에 입력되는 값의 범위를 설정하는 기능
DROP TABLE EMP01;
CREATE TABLE EMP01(
                                               ENO NUMBER(4) PRIMARY KEY,
                                               ENAME VARCHAR2(20),
                                               SALARY NUMBER(7, 2) CONSTRAINT SAL_C CHECK(SALARY > 1000)
);

INSERT INTO EMP01 VALUES(1111, 'AAA', 890);



