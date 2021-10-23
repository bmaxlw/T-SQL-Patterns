USE [Data];
SELECT * FROM Employees;
SELECT * FROM smpl;
drop table smpl;

CREATE TABLE smpl (id INT, username NVARCHAR(50));

ALTER TABLE smpl ADD [RegDate] DATE;
ALTER TABLE smpl ALTER COLUMN id INT NOT NULL;
ALTER TABLE smpl ADD PRIMARY KEY(id);
ALTER TABLE smpl ADD CONSTRAINT CheckLen CHECK(LEN(username) > 15);
ALTER TABLE smpl DROP COLUMN RegDate;
EXEC sp_rename 'smpl.RegDate', 'Registered', 'COLUMN';

INSERT INTO smpl VALUES (2, 'ss');

INSERT INTO Users(Username) VALUES ('Shoot4');
select * from Users;
SELECT * FROM Accounts;
INSERT INTO Accounts(UserID, [Status]) VALUES (5, 'Active');

ALTER TABLE Accounts DROP CONSTRAINT FK_Users_ID;
ALTER TABLE Accounts ADD CONSTRAINT FK_Users_ID FOREIGN KEY(UserID) 
REFERENCES Users(ID) ON DELETE CASCADE ON UPDATE CASCADE;

delete from Users WHERE ID = 3;
UPDATE Users SET ID = 10000 WHERE ID = 1;
EXEC sp_help Accounts;