-- ���� ���̺� ��(VIEW)
-- ��(VIEW): �������� ���̺��� �ٰŷ� ������� ���� ���̺�, ���̺� �����ʹ� ������ ���� ���� ���̺��� �������� �ʰ� SQL�� ����Ǿ� �ִ�.
-- �⺻���̺�: �並 �����ϱ� ���ؼ� ���������� �����͸� ������ �ִ� �������� ���̺��� ���Ѵ�.
-- �ǽ��� ���� DEPT, EMP ���̺� ����: DEPARTEMENT, EMPLOYEE ���̺� ���� ����
DROP TABLE DEPT CASCADE CONSTRAINTS;
CREATE TABLE DEPT AS SELECT * FROM DEPARTMENT;
SELECT * FROM DEPT;

DROP TABLE EMP;
CREATE TABLE EMP AS SELECT * FROM EMPLOYEE;
SELECT * FROM EMP;

-- �並 �����ϴ� ���: CREATE VIEW ���̸�(�ɼ�)
-- �並 ������ �� ����ϴ� �ɼ�: CREATE OR REPLACE VIEW, FORCE(�⺻���̺��� ��� ����� ��), WITH CHECK OPTION, WITH READ ONLY

-- Question 1. �μ���ȣ�� 30���� �ش��ϴ� ������� ��ȣ, �̸�, �μ���ȣ�� �����Ͻÿ�.
SELECT ENO, ENAME, DNO
FROM EMP
WHERE DNO = 30;

-- 30�� �μ��� �Ҽӵ� ������� ��ȣ, �̸�, �μ���ȣ�� ����ϱ� ���� SELECT���� �ϳ��� ��� ����
CREATE VIEW EMP_VIEW30
AS
SELECT ENO, ENAME, DNO
FROM EMP
WHERE DNO = 30;

SELECT * 
FROM EMP_VIEW30;

-- �並 ����ϴ� ����: �����ϰ� �� �������� ��� �����ϸ� �����̳� �۾��� ȿ������ ���� �� �ִ�. ���ȿ� ����
DROP VIEW EMP_VIEW30; -- �並 �����ص� ��� ���̺��� �����Ǵ� ���� �ƴϴ�. �׷��� ��� ���̺��� �����Ǹ� �䵵 �ڵ� ������

-- ������(SEQUENCE):�Ϸù�ȣ�� ������ ������ �ִ� ���
-- ����Ŭ������ ���� �����ϱ� ���ؼ� �Ϲ������� ���� ���� �⺻Ű�� ����ϴ� ��찡 �ִ�.
-- �⺻Űó�� ����, �ߺ� �Ұ�. �ڵ� ��ȣ �߻���
-- �������� ����: CREATE SEQUENCE ��������, START WITH => ���۹�ȣ, INCREMENT BY =>������, MAXVALUE => �ִ밪
-- �������� ���� Ȯ���ϴ� ��ɾ�: CURRVAL(�������� ���簪), NEXTVAL(������)

-- ������ �����ϱ�
CREATE SEQUENCE SAMPLE_SEQ; -- 1���� �����ؼ� 1�� �����ϴ� ������ ����

SELECT SAMPLE_SEQ.NEXTVAL FROM DUAL;

SELECT SAMPLE_SEQ.CURRVAL FROM DUAL;

-- �����ȣ�� ������ �������� ������ ��ü�� �����Ͻÿ�.
--  ���۰��� 1,  1�� ���� �ִ밪 100000�� �Ǵ� EMP_SEQ�� �����Ͻÿ�.
CREATE SEQUENCE EMP_SEQ START WITH 1 INCREMENT BY 1 MAXVALUE 100000;

DROP TABLE EMP01 CASCADE CONSTRAINTS;
CREATE TABLE EMP01(
                                                ENO NUMBER PRIMARY KEY,
                                                ENAME VARCHAR2(14),
                                                SALARY NUMBER
);

INSERT INTO EMP01 VALUES(EMP_SEQ.NEXTVAL, '�̼���', 1000);

SELECT * FROM EMP01;
