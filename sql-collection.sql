-- show all views with the name with ending tion
SELECT * FROM tab where tabtype = 'VIEW' and tname like '%TIONS';

--show all synonymes:

SELECT * FROM USER_SYNONYMS;

-- show all privileges on a table
SELECT * FROM SYS.table_privileges WHERE table_name='x-table-name';

--show all users
SELECT * FROM users;

--copy a column to another column
DECLARE
BEGIN
    -- Copy data to new column
    UPDATE STUDENTS s1 SET NEW_NUMBER = (SELECT TO_CHAR(STDNUMBER) FROM STUDENTS s2 WHERE s1.id=s2.id);
END;/


--modify column
--1. create a new column
DECLARE
  v_tab_name    VARCHAR2(30)  := 'STUDENTS';
  v_col_name    VARCHAR2(30)  := 'NEW_NUMBER';
  v_col_type    VARCHAR2(30)  := 'VARCHAR2(40)';
  -- Do not edit below
  v_stmt_1 VARCHAR2(200)  := 'ALTER TABLE ' || v_tab_name || ' ADD ' || v_col_name || ' ' || v_col_type;
BEGIN

  BEGIN
    dbms_output.put_line('>>> Command: ' || v_stmt_1);
    EXECUTE immediate v_stmt_1;
  EXCEPTION
    WHEN OTHERS THEN
      IF SQLCODE != -01430 THEN
        RAISE;
      ELSE
        dbms_output.put_line('Skipping. Nothing to do.');
      END IF;
  END;

EXCEPTION
  WHEN OTHERS THEN
    RAISE;
END;
/

--2. copy data to new column

--3. delete old column
DECLARE
  v_tab_name VARCHAR2(30) := ''STUDENTS'';
  v_col_name VARCHAR2(30) := STDNUMBER;
  -- do not edit below
  v_stmt_1 VARCHAR2(150) := 'ALTER TABLE ' || v_tab_name || ' DROP COLUMN ' || v_col_name;
BEGIN
  BEGIN
    dbms_output.put_line('>>> Command: ' || v_stmt_1);
    EXECUTE immediate v_stmt_1;
  EXCEPTION
    WHEN OTHERS THEN
      IF SQLCODE != -01442 THEN
        RAISE;
      ELSE
        dbms_output.put_line('Skipping. Nothing to do.');
      END IF;
  END;
EXCEPTION
  WHEN OTHERS THEN
    RAISE;
END;
/

--4. rename the new column
DECLARE
  v_tab_name VARCHAR2(30) := 'STUDENTS';
  v_col_name_old VARCHAR2(30) := 'NEW_NUMBER';
  v_col_name_new VARCHAR2(30) := 'STD_NUMBER';
  -- do not edit below
  v_stmt_1 VARCHAR2(150) := 'ALTER TABLE ' || v_tab_name || ' RENAME COLUMN ' || v_col_name_old || ' TO ' || v_col_name_new;
BEGIN
  BEGIN
    dbms_output.put_line('>>> Command: ' || v_stmt_1);
    EXECUTE immediate v_stmt_1;
  EXCEPTION
    WHEN OTHERS THEN
      IF SQLCODE != -01442 THEN RAISE;
      ELSE dbms_output.put_line('Skipping. Nothing to do.'); END IF;
  END;
EXCEPTION
  WHEN OTHERS THEN RAISE;
END;/


--show table column definitions
SELECT table_name, column_name, data_type, data_length
FROM USER_TAB_COLUMNS WHERE table_name = 'students'

--decode 
SELECT std_name,
DECODE(country, DE, 'Banana', CH, 'Orange', 'Papaya') std_source
FROM students;

