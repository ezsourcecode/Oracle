-- 데이터 무결성 제약 조건
-- 1. NOT NULL: NULL을 허용하지 않는 제약 조건, 생략불가, 필수입력
-- Question 1. DEPARTEMENT테이블의 구조와 내용을 복사하여 DEPT테이블을 생성하시오.
DROP TABLE DEPT CASCADE CONSTRAINTS;
CREATE TABLE DEPT AS SELECT * FROM DEPARTMENT; --구조만 복사할 경우 WHERE 조건식에 항상 거짓이 되는 조건을 명시한다. 1=0 OR 0=1
SELECT * FROM DEPT;
DESC DEPT

INSERT INTO DEPT(DNO, DNAME, LOC) VALUES(50, '개발부', '서울시');
INSERT INTO DEPT(DNO, DNAME, LOC) VALUES(50, '영업부', '대전시');
INSERT INTO DEPT(DNO, DNAME) VALUES(50, 'DB');

DROP TABLE DEPT;
CREATE TABLE DEPT(
                                             DNO NUMBER(2) NOT NULL,
                                             DNAME VARCHAR2(14) NOT NULL,
                                             LOC VARCHAR2(13) NOT NULL
);

INSERT INTO DEPT(DNO, DNAME, LOC) VALUES(10, '개발부', '서울');
INSERT INTO DEPT VALUES(20, '홍보부', '광주');
INSERT INTO DEPT(DNO, DNAME) VALUES(30, '영업부');
INSERT INTO DEPT(DNO, DNAME, LOC) VALUES(20, '영업부', '부산');

-- 2. UNIQUE: 중복값을 허용하지 않는 제약 조건, 유일성
DROP TABLE EMP;
CREATE TABLE EMP(
                                          ENO NUMBER(4) UNIQUE,
                                          ENAME VARCHAR2(14) NOT NULL,
                                          JOB VARCHAR2(14),
                                          SALARY NUMBER(7)
);
DESC EMP
SELECT * FROM EMP;

INSERT INTO EMP VALUES(1111, '장보고', '부장', 1000);
INSERT INTO EMP(ENAME, JOB, SALARY) VALUES('이순신', '과장', 800);
INSERT INTO EMP(ENAME, JOB, SALARY) VALUES('이순신', '과장', 800);

-- 3. PRIMARY KEY: NULL을 허용하지 않고, 중복값도 허용하지 않는 제약 조건, NOT NULL + UNIQUE, 기본키
DROP TABLE EMP;
CREATE TABLE EMP(
                                          ENO NUMBER(4) PRIMARY KEY,
                                          ENAME VARCHAR2(14) NOT NULL,
                                          JOB VARCHAR2(14),
                                          SALARY NUMBER(7)
);

CREATE TABLE EMP(
                                          ENO NUMBER(4),
                                          ENAME VARCHAR2(14) NOT NULL,
                                          JOB VARCHAR2(14),
                                          SALARY NUMBER(7),
                                          CONSTRAINT ENO_PK PRIMARY KEY(ENO) -- 외래키는 이렇게 줘야함.
);

DESC EMP
SELECT * FROM EMP;

INSERT INTO EMP VALUES(1111, '장보고', '부장', 1000);
INSERT INTO EMP VALUES(2222, '이순신', '과장', 800);
INSERT INTO EMP(ENAME, JOB, SALARY) VALUES('이순신', '과장', 800);
INSERT INTO EMP(ENO, ENAME) VALUES(3333, '홍길동');

-- 4. FOREIGN KEY: 참조되는 테이블의 컬럼에 존재하는 값만 입력이 허용되도록 하는 제약 조건, 참조 무결성, 외래키
--참조 무결성: 테이블 사이의 관계에서 발생하는 개념으로 두 테이블의 부모테이블(주체가 되는 테이블)과 자녀테이블(종속이 되는 테이블)에 의해 결정
-- 부서테이블(DEPARTMENT): DNO(기본키) => 부모테이블, 부모
-- 사원테이블(EMPLOYEE): ENO(기본키), DNO(외래키) => 자식테이블
DROP TABLE DEPT;
DROP TABLE EMP;
CREATE TABLE DEPT(
                                             DNO NUMBER(2) PRIMARY KEY,
                                             DNAME VARCHAR2(14),
                                             LOC VARCHAR2(13)
);

INSERT INTO DEPT VALUES(10, '개발부', '서울');
INSERT INTO DEPT VALUES(20, '홍보부', '대전');
INSERT INTO DEPT VALUES(30, '영어부', '대구');
INSERT INTO DEPT VALUES(40, '회계부', '부산');

SELECT * FROM DEPT;

CREATE TABLE EMP(
                                           ENO NUMBER(4) PRIMARY KEY,
                                           ENAME VARCHAR2(14) NOT NULL,
                                           JOB VARCHAR2(20),
                                           SALARY NUMBER,
                                           DNO NUMBER(2) CONSTRAINT EMP_DNO_FK REFERENCES DEPT(DNO)
);

INSERT INTO EMP VALUES(1111, '장보고', '부장', 1000, 10);
INSERT INTO EMP VALUES(2222, '장보고', '과장', 800, 30);
INSERT INTO EMP VALUES(3333, '이순신', '대리', 600, 50);

-- 5. CHECK: 유효성 검사 규칙, 입력값의 범위나 조건을 부여하는 제약 조건
DROP TABLE SAMPLE;
CREATE TABLE SAMPLE(
                                                  NAME VARCHAR2(20),
                                                  AGE NUMBER CONSTRAINT CHECK_AGE CHECK(AGE > 0 AND AGE < 150),
                                                  GENDER CHAR(1) CONSTRAINT CHECK_GENDER CHECK(GENDER IN('M' ,'W')), -- 제약조건에 OR 못씀.
                                                  ID NUMBER PRIMARY KEY
);

INSERT INTO SAMPLE VALUES('홍길동', 30, 'M', 1);
INSERT INTO SAMPLE VALUES('장보고', 25, 'M', 2);
INSERT INTO SAMPLE VALUES('유관순', -100, 'W', 3);
INSERT INTO SAMPLE VALUES('유관순', 20, 'F', 3);
