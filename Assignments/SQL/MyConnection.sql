DROP TABLE EMP;
DROP TABLE DEPT;

CREATE TABLE DEPT
(
	DEPTNO NUMERIC(2) CONSTRAINT DEPTNO_DEPT_PK PRIMARY KEY,
	DNAME VARCHAR(14),
	LOC VARCHAR(13)
);

INSERT INTO DEPT VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES (20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES (30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES (40,'OPERATIONS','BOSTON');

CREATE TABLE EMP
(
	 EMPNO NUMERIC(4) CONSTRAINT EMPNO_EMP_PK PRIMARY KEY,
	 ENAME VARCHAR(10),
	 JOB   VARCHAR(9),
	 MGR   NUMERIC(4), 
	 HIREDATE DATE,
	 SAL NUMERIC(7,2),        
	 COMM NUMERIC(7,2),        
	 DEPTNO NUMERIC(2) CONSTRAINT DEPTNO_DEPT_FK REFERENCES DEPT(DEPTNO)      
);

INSERT INTO EMP VALUES (7369,'SMITH','CLERK',7902,'17-DEC-00',800,NULL,20);
INSERT INTO EMP VALUES (7499,'ALLEN','SALESMAN',7698,'20-FEB-01',1600,300,30);
INSERT INTO EMP VALUES (7521,'WARD','SALESMAN',7698,'22-FEB-01',1250,500,30);
INSERT INTO EMP VALUES (7566,'JONES','MANAGER',7839,'02-APR-01',2975,NULL,20);
INSERT INTO EMP VALUES (7654,'MARTIN','SALESMAN',7698,'28-SEP-01',1250,1400,30);
INSERT INTO EMP VALUES (7698,'BLAKE','MANAGER',7839,'01-MAY-01',2850,NULL,30);
INSERT INTO EMP VALUES (7782,'CLARK','MANAGER',7839,'09-JUN-01',2450,NULL,10);
INSERT INTO EMP VALUES (7788,'SCOTT','ANALYST',7566,'19-APR-07',3000,NULL,20);
INSERT INTO EMP VALUES (7839,'KING','PRESIDENT',NULL,'17-NOV-01',5000,NULL,10);
INSERT INTO EMP VALUES (7844,'TURNER','SALESMAN',7698,'08-SEP-01',1500,0,30);
INSERT INTO EMP VALUES (7876,'ADAMS','CLERK',7788,'23-MAY-07',1100,NULL,20);
INSERT INTO EMP VALUES (7900,'JAMES','CLERK',7698,'03-DEC-01','950',NULL,30);
INSERT INTO EMP VALUES (7902,'FORD','ANALYST',7566,'03-DEC-01',3000,NULL,20);
INSERT INTO EMP VALUES (7934,'MILLER','CLERK',7782,'23-JAN-02',1300,NULL,10);

commit; 

-- Tables Created --

SELECT * FROM EMP;
SELECT * FROM DEPT;

-- Q1
SELECT DNAME FROM DEPT;

-- Q2
SELECT ENAME FROM EMP;

-- Q3
SELECT * FROM EMP WHERE DEPTNO = 30;

-- Q4
SELECT ENAME, EMPNO, DEPTNO FROM EMP WHERE JOB = 'CLERK';

-- Q5
SELECT DEPTNO, ENAME FROM EMP WHERE DEPTNO >= 20;

-- Q6
SELECT * FROM EMP WHERE COMM > SAL;

-- Q7
SELECT * FROM EMP WHERE COMM > (SAL * 60/100);

-- Q8
SELECT * FROM EMP WHERE COMM > (SAL * 50/100);

-- Q9
SELECT ENAME, JOB, SAL FROM EMP WHERE DEPTNO = 20 AND SAL > 2000;

-- Q10
SELECT * FROM EMP WHERE JOB = 'SALESMAN' AND DEPTNO = 30 AND SAL >= 1500;

-- Q11
SELECT * FROM EMP WHERE JOB = 'PRESIDENT' OR JOB = 'MANAGER'; 

-- Q12
SELECT * FROM EMP WHERE JOB = 'MANAGER' AND DEPTNO != 30;

-- Q13
SELECT * FROM EMP WHERE (JOB = 'MANAGER' OR JOB = 'CLERK') AND DEPTNO = 10;

-- Q14
SELECT * FROM EMP WHERE (JOB = 'MANAGER') OR (JOB = 'CLERK' AND DEPTNO = 10);

-- Q15
SELECT * FROM EMP WHERE (JOB = 'MANAGER' AND DEPTNO = 10) OR (JOB = 'CLERK' AND DEPTNO = 20);

-- Q16
SELECT * FROM EMP WHERE (JOB != 'CLERK' AND JOB != 'MANAGER') AND SAL >= 2000;

-- Q17
SELECT * FROM EMP WHERE SAL BETWEEN 1200 AND 1400;

-- Q18
SELECT * FROM EMP WHERE JOB = 'CLERK' OR JOB = 'ANALYST' OR JOB = 'SALESMAN';

-- Q19
SELECT * FROM EMP WHERE NOT(JOB = 'CLERK' OR JOB = 'ANALYST' OR JOB = 'SALESMAN');

-- Q20
SELECT * FROM EMP WHERE COMM IS NULL;

-- Q21
SELECT * FROM EMP WHERE COMM = 0;

-- Q22
SELECT DISTINCT JOB FROM EMP WHERE COMM > 0;

-- Q23
SELECT * FROM EMP WHERE COMM < 100 OR COMM IS NULL;

-- Q24
SELECT ENAME, SAL + NVL(COMM, 250) AS NET_EARNING FROM EMP;

-- Q25
SELECT * FROM (SELECT ENAME, SAL + NVL(COMM, 250) AS NET_EARNING FROM EMP) WHERE NET_EARNING > 2000;

-- Q26
SELECT ENAME FROM EMP WHERE ENAME LIKE 'M%';

-- Q27
SELECT ENAME FROM EMP WHERE ENAME LIKE '%M';

-- Q28
SELECT ENAME FROM EMP WHERE ENAME LIKE '%M%';

-- Q29
SELECT ENAME FROM EMP WHERE ENAME LIKE '____N';

-- Q30
SELECT ENAME FROM EMP WHERE ENAME LIKE '__R%';

-- SECOND SECTION 

-- Q31
SELECT * FROM EMP WHERE TO_CHAR(HIREDATE, 'MM') = '02';

-- Q32
SELECT * FROM EMP WHERE TO_CHAR(HIREDATE, 'DD') = TO_CHAR(LAST_DAY(HIREDATE));

-- Q33
SELECT * FROM EMP WHERE HIREDATE < (SELECT ADD_MONTHS(SYSDATE, 144) FROM DUAL);

-- Q34
SELECT * FROM EMP WHERE TO_CHAR(HIREDATE, 'YYYY') = '2007' AND JOB = 'MANAGER';

-- Q35
SELECT '(' || ENAME||','||JOB || ')' FROM EMP;

-- Q36
SELECT INITCAP(ENAME) AS NAME FROM EMP;

-- Q37
SELECT LPAD(ENAME, 15) AS NAME FROM AEMP;

-- Q38
SELECT LPAD(ENAME, 15, '-') AS NAME FROM EMP;

-- Q39
SELECT ENAME, LENGTH(ENAME) AS LEN FROM EMP;

-- Q40
SELECT RPAD(LPAD(ENAME,LENGTH(ENAME) + (20-(LENGTH(ENAME)))/2),20) AS NAME FROM EMP;

-- Q41
SELECT ENAME FROM EMP WHERE ENAME NOT LIKE 'A%';

-- Q42
SELECT ENAME FROM EMP WHERE ENAME NOT LIKE '%R';

-- Q43
SELECT SUBSTR(ENAME, 1, 3) FROM EMP;

-- Q44
SELECT SUBSTR(ENAME, LENGTH(ENAME) - 2, LENGTH(ENAME)) FROM EMP;

-- Q45
SELECT REPLACE(ENAME, 'A', 'E') FROM EMP;

-- Q46
SELECT ENAME, INSTR(ENAME, 'AR') AS AR_AT FROM EMP;

-- Q47
SELECT ENAME, FLOOR((SAL + 999) / 1000) * 1000 FROM EMP; 

-- Q48
SELECT ENAME, ROUND((SAL/360),2) AS DAILY_SAL FROM EMP;

-- Q49
SELECT ENAME, CASE WHEN (SAL * 20 / 100) < 500 THEN (SAL * 20 / 100)
                   WHEN (SAL * 20 / 100) > 500 THEN 500 END AS BONUS FROM EMP;

-- Q50
SELECT ENAME, CASE WHEN (SAL * 20 / 100) < 200 THEN (SAL * 20 / 100)
                   WHEN (SAL * 20 / 100) > 200 THEN 200 END AS BONUS FROM EMP;
                   
-- Q51
SELECT ENAME, ROUND(SYSDATE - HIREDATE, 0) AS DAYS FROM EMP;

-- Q52
SELECT ENAME, MONTHS_BETWEEN(SYSDATE,HIREDATE) AS MONTHS FROM EMP;

-- Q53
SELECT TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE)/12) || ' years '
  || TRUNC(mod(MONTHS_BETWEEN(SYSDATE,HIREDATE), 12)) || ' months '
  || ROUND(31*(MONTHS_BETWEEN(SYSDATE,HIREDATE) - TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE))), 0) || ' days' AS WORKING_DAYS
FROM EMP;

-- Q54
SELECT (INITCAP(ENAME) || ' joined on the ' ||
  INITCAP(TO_CHAR(TO_DATE(TO_CHAR(HIREDATE,'DD'), 'J'),'JSP')) || ' of ' ||
  INITCAP(TO_CHAR(HIREDATE,'MONTH')) || ' of the year ' ||
  INITCAP(TO_CHAR(TO_DATE(TO_CHAR(HIREDATE,'YYYY'), 'J'),'JSP'))) IN_WORDS 
FROM EMP;

-- Q55
SELECT * FROM EMP ORDER BY ENAME;

-- Q56
SELECT ENAME, TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE)/12) || ' years '
  || TRUNC(mod(MONTHS_BETWEEN(SYSDATE,HIREDATE), 12)) || ' months '
  || ROUND(31*(MONTHS_BETWEEN(SYSDATE,HIREDATE) - TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE))), 0) || ' days' AS WORKING_DAYS
FROM EMP ORDER BY WORKING_DAYS DESC;

-- Q57
SELECT ENAME, JOB, SAL FROM EMP ORDER BY JOB, SAL;

-- Q58
SELECT ENAME, JOB, SAL FROM EMP ORDER BY JOB, SAL DESC;

-- Q59
SELECT ENAME, JOB, SAL FROM EMP ORDER BY JOB DESC, SAL DESC;

-- Q60
SELECT ENAME, TO_CHAR(HIREDATE, 'MM') AS MNTH, TO_CHAR(HIREDATE, 'YYYY') FROM EMP ORDER BY MNTH;

-- Q61
SELECT ENAME, TO_CHAR(HIREDATE, 'MM') AS MNTH, TO_CHAR(HIREDATE, 'YYYY') AS YR FROM EMP ORDER BY MNTH, YR ASC;