-- Sequences are stored in DB > Programmability > Sequences
-- Click on sequence to have more details
USE Sample_01;

CREATE TABLE TableOne (
ID INT NOT NULL PRIMARY KEY,
ACCESS NVARCHAR(10) DEFAULT 'USER');
SELECT * FROM TableOne;

-- #1
CREATE SEQUENCE dbo.hundredK_one AS
INT
START WITH 100000
INCREMENT BY 1;

SELECT NEXT VALUE FOR hundredK_one;
ALTER SEQUENCE hundredK_one RESTART WITH 100000; 
SELECT current_value FROM sys.sequences WHERE NAME = 'hundredK_one';
SELECT * FROM sys.sequences WHERE NAME = 'hundredK_one';
INSERT INTO TableOne(ID) VALUES(NEXT VALUE FOR hundredK_one);

-- #2
CREATE SEQUENCE dbo.minus_one AS
INT
START WITH -2147483648
INCREMENT BY 1;

SELECT NEXT VALUE FOR minus_one;
ALTER SEQUENCE minus_one RESTART WITH -2147483648;

-- #3
CREATE SEQUENCE dbo.plus_10 AS
INT 
START WITH 0
INCREMENT BY 10
MINVALUE 0
MAXVALUE 250
CYCLE --> restart after the MAXVALUE reached
CACHE 20; --> when 10 is reached, first 10 values are removed from cache / increases performance

ALTER SEQUENCE plus_10 RESTART WITH 0;
SELECT NEXT VALUE FOR plus_10;
DROP SEQUENCE plus_10;

-- #4
CREATE SEQUENCE fromMinus100ToPlus100 AS
INT
START WITH -100
INCREMENT BY 10
MINVALUE -100
MAXVALUE 100
CYCLE
CACHE 10;

SELECT NEXT VALUE FOR fromMinus100ToPlus100;









