-- DCL: 데이터 제어어
-- 데이터베이스의 일관성과 무결성을 유지하고, 동시에 여러 시스템이 병행수행이 가능하도록 제어하면, 접근권한을 부여하거나 해제하는 명령어
-- 트랜잭션: 데이터 베이스에 접속하여 SQL명령어를 수행하는 일련의 과정, 명령이 실행되는 단위
-- COMMIT: 트랜젹션 수행이 정상적으로 완료되었음을 알려주는 것으로 그 결과가  DB에 반영된다.
-- ROLLBACK: 트랜잭션을 수행하는 도중에 문제가 발생하여 트랜잭션 처리를 멈추고 원래 상태로 되돌려놓은 것
-- GRANT: 권한부여
--REVOKE: 권한해제

-- DEPARTMENT테이블을 활용하여 DEPT 테이블을 생성하고, 구조와 내용을 복사하시오.
DROP TABLE DEPT;
CREATE TABLE DEPT AS SELECT * FROM DEPARTMENT;
-- AUTO COMMIT이 된 상태 이 윗줄까지
SELECT * FROM DEPT;

DELETE FROM DEPT;

ROLLBACK;

-- 부서번호가 10번인 부서정보를 삭제한 후 DB에 반영하는 쿼리문을 기술하시오.
DELETE FROM DEPT WHERE DNO = 10;
COMMIT;