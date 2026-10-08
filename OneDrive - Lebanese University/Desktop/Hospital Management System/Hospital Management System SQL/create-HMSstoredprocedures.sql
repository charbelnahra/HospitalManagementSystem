CREATE PROCEDURE sp_AddPatient
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @Gender VARCHAR(10),
    @DOB DATE,
    @Phone VARCHAR(15),
    @Address VARCHAR(255),
    @Email VARCHAR(100)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION

        -- Validate DOB
        IF @DOB > GETDATE()
        BEGIN
            RAISERROR('Date of birth cannot be in the future.',16,1)
            ROLLBACK TRANSACTION
            RETURN
        END

        INSERT INTO PATIENTS (FIRST_NAME, LAST_NAME, GENDER, DATE_OF_BIRTH, PHONE_NUMBER, ADDRESS, EMAIL)
        VALUES (@FirstName, @LastName, @Gender, @DOB, @Phone, @Address, LOWER(@Email))

        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        THROW
    END CATCH
END;
GO


CREATE PROCEDURE sp_AddDoctor
    @DepID INT,
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @Specialization VARCHAR(100),
    @Phone VARCHAR(15),
    @Email VARCHAR(100)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION

        -- Check if department exists
        IF NOT EXISTS(SELECT 1 FROM DEPARTMENTS WHERE DEPARTMENT_ID = @DepID)
        BEGIN
            RAISERROR('Department does not exist.',16,1)
            ROLLBACK TRANSACTION
            RETURN
        END

        INSERT INTO DOCTORS (DEPID, FIRST_NAME, LAST_NAME, SPECIALIZATION, PHONE_NUMBER, EMAIL)
        VALUES (@DepID, @FirstName, @LastName, UPPER(@Specialization), @Phone, @Email)

        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        THROW
    END CATCH
END;
GO


CREATE PROCEDURE sp_AddAppointment
    @DID INT,
    @PID INT,
    @AppointmentDate DATETIME
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION

        IF NOT EXISTS(SELECT 1 FROM DOCTORS WHERE DOCTOR_ID = @DID)
        BEGIN
            RAISERROR('Doctor does not exist.',16,1)
            ROLLBACK TRANSACTION
            RETURN
        END

         IF NOT EXISTS(SELECT 1 FROM PATIENTS WHERE PATIENT_ID = @PID)
        BEGIN
            RAISERROR('Patient does not exist.',16,1)
            ROLLBACK TRANSACTION
            RETURN
        END

        
        IF @AppointmentDate < GETDATE()
        BEGIN
            RAISERROR('Cannot schedule appointment in the past.',16,1)
            ROLLBACK TRANSACTION
            RETURN
        END

       
        IF EXISTS(SELECT 1 FROM APPOINTMENTS WHERE DID = @DID AND APPOINTMENT_DATE = @AppointmentDate AND STATUS <> 'Cancelled')
        BEGIN
            RAISERROR('Doctor already has an appointment at this time.',16,1)
            ROLLBACK TRANSACTION
            RETURN
        END

        INSERT INTO APPOINTMENTS (DID, PID, APPOINTMENT_DATE, STATUS)
        VALUES (@DID, @PID, @AppointmentDate, 'Scheduled')

        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        THROW
    END CATCH
END;
GO


CREATE PROCEDURE sp_AddMedicalRecord
    @DID INT,
    @PID INT,
    @Diagnosis TEXT,
    @Treatment TEXT,
    @RecordDate DATETIME,
    @BillAmount DECIMAL(10,2) = NULL -- optional bill amount
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION

        -- Validate doctor
        IF NOT EXISTS(SELECT 1 FROM DOCTORS WHERE DOCTOR_ID = @DID)
        BEGIN
            RAISERROR('Doctor does not exist.',16,1)
            ROLLBACK TRANSACTION
            RETURN
        END

        -- Validate patient
        IF NOT EXISTS(SELECT 1 FROM PATIENTS WHERE PATIENT_ID = @PID)
        BEGIN
            RAISERROR('Patient does not exist.',16,1)
            ROLLBACK TRANSACTION
            RETURN
        END

        -- Validate record date
        IF @RecordDate > GETDATE()
        BEGIN
            RAISERROR('Medical record date cannot be in the future.',16,1)
            ROLLBACK TRANSACTION
            RETURN
        END

        DECLARE @NewBillID INT = NULL;

        -- Create bill automatically if amount provided
        IF @BillAmount IS NOT NULL
        BEGIN
            INSERT INTO BILLINGS (AMOUNT, BILL_DATE, STATUS)
            VALUES (@BillAmount, GETDATE(), 'Unpaid');
            SET @NewBillID = SCOPE_IDENTITY();
        END

        -- Insert medical record
        INSERT INTO MEDICALRECORDS (BID, DID, PID, DIAGNOSIS, TREATMENT, RECORD_DATE)
        VALUES (@NewBillID, @DID, @PID, @Diagnosis, @Treatment, @RecordDate)

        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        THROW
    END CATCH
END;
GO


CREATE PROCEDURE sp_UpdateBillStatus
    @BillID INT,
    @Status VARCHAR(50)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION

        IF NOT EXISTS(SELECT 1 FROM BILLINGS WHERE BILL_ID = @BillID)
        BEGIN
            RAISERROR('Bill does not exist.',16,1)
            ROLLBACK TRANSACTION
            RETURN
        END

        -- Only allow specific statuses
        IF @Status NOT IN ('Unpaid', 'Paid', 'Cancelled')
        BEGIN
            RAISERROR('Invalid status.',16,1)
            ROLLBACK TRANSACTION
            RETURN
        END

        UPDATE BILLINGS
        SET STATUS = @Status
        WHERE BILL_ID = @BillID

        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        THROW
    END CATCH
END;
GO


CREATE PROCEDURE sp_DeleteDepartment
    @DepartmentID INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION

        IF EXISTS(SELECT 1 FROM DOCTORS WHERE DEPID = @DepartmentID)
        BEGIN
            RAISERROR('Cannot delete department with assigned doctors.',16,1)
            ROLLBACK TRANSACTION
            RETURN
        END

        DELETE FROM DEPARTMENTS WHERE DEPARTMENT_ID = @DepartmentID

        COMMIT TRANSACTION
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION
        THROW
    END CATCH
END;
GO


