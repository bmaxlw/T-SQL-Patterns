-- variant #1
CREATE PROCEDURE stp_Salary_INS @id INT, @max_id INT AS
BEGIN TRY
	BEGIN
		WHILE (@id != @max_id)
		BEGIN
			UPDATE Employees SET Salary = ROUND(RAND() * (35000 - 10000) + 10000, 2) WHERE EmpID = @id;
			SET @id = @id + 1;
		END
	END 
END TRY
BEGIN CATCH
	BEGIN
		PRINT N'FATAL ERROR!'
	END
END CATCH;

-- varian #2
DECLARE @OrderID INT = 1
WHILE (@OrderID != 1001)
	BEGIN
		UPDATE Orders SET OrderPrice = ROUND(RAND() * (35000 - 10000) + 10000, 2) 
		WHERE OrderID = @OrderID;
		SET @OrderID = @OrderID + 1;
	END

